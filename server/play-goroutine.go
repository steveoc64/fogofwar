package main

import (
	"encoding/gob"
	"fmt"
	"log"
	"os"
	"time"

	"../shared"
)

const (
	GameEnds = iota
	GameRewind
	GameRestart
	GamePause
	PlayerPhaseDone
	PlayerPhaseNotDone
)

type PlayMessage struct {
	Game     int
	PlayerID int
	OpCode   int
}

// Global map of comms channels to refer to game goroutines by
// All comms with the goroutine is via its unique message channel
var Plays map[int]chan<- PlayMessage

func InitGames() {
	// on boot, start up a goroutine for every running game
	gob.RegisterName("shared.Game", shared.Game{})
	println("Firing up Game Threads ...")
	Plays = make(map[int]chan<- PlayMessage)
	ids := []int{}
	err := DB.SQL(`select id from game where started and not stopped`).QuerySlice(&ids)
	if err != nil {
		println("Fetching Running Game IDs: ", err.Error())
		return
	}
	for _, v := range ids {
		Plays[v] = StartPlay(v)
	}

	// fmt.Printf("Created map of channels %d\n", Plays)
}

func StartPlay(gameID int) chan<- PlayMessage {
	playChannel := make(chan PlayMessage, 16)
	go playRoutine(gameID, playChannel)
	return playChannel
}

type PlayerState struct {
	TODO bool
	Done bool
}

type PlayState struct {
	Game *shared.Game
}

func loadGameData(id int, state PlayState) error {
	err := DB.SQL(`select
			g.*,u.username as host_name,u.email as host_email,
				coalesce(p_red.reds, 0) as num_red_players,
				coalesce(p_blue.blues, 0) as num_blue_players
		from game g
			left join users u on u.id=g.hosted_by
	 		left join (select game_id, count(*) as reds from game_players where red_team group by 1) p_red on p_red.game_id=g.id
	 		left join (select game_id, count(*) as blues from game_players where blue_team group by 1) p_blue on p_blue.game_id=g.id
		where g.id=$1`, id).QueryStruct(state.Game)
	if err != nil {
		return err
	}

	// Fill in the cmd arrays
	err = DB.SQL(`select
				g.*,
					coalesce(u.username,'') as player_name,
					coalesce(u.email,'') as player_email,
					coalesce(p.accepted, false) as player_ready
				from game_cmd g
				left join users u on u.id=g.player_id
				left join game_players p on p.game_id=$1 and p.player_id=g.player_id
				where g.game_id=$1 and g.red_team order by g.name`, id).QueryStructs(&state.Game.RedCmd)
	if err != nil {
		return err
	}
	err = DB.SQL(`select
				g.*,
					coalesce(u.username,'') as player_name,
					coalesce(u.email,'') as player_email,
					coalesce(p.accepted, false) as player_ready
				from game_cmd g
				left join users u on u.id=g.player_id
				left join game_players p on p.game_id=$1 and p.player_id=g.player_id
				where g.game_id=$1 and g.blue_team order by g.name`, id).QueryStructs(&state.Game.BlueCmd)
	if err != nil {
		return err
	}

	// Get the units for each command
	for _, v := range state.Game.RedCmd {
		err = DB.SQL(`select * from unit where cmd_id=$1 and game_id=$2 order by path`,
			v.ID, id).QueryStructs(&v.Units)
		if err != nil {
			return err
		}
		v.CalcTotals()
	}
	for _, v := range state.Game.BlueCmd {
		err = DB.SQL(`select * from unit where cmd_id=$1 and game_id=$2 order by path`,
			v.ID, id).QueryStructs(&v.Units)
		if err != nil {
			return err
		}
		v.CalcTotals()
	}

	if err == nil {
		// fill in the players on each side
		DB.SQL(`select distinct(u.username),u.id as player_id,p.accepted
			from game_players p
			left join users u on u.id=p.player_id
			where p.game_id=$1 and p.red_team
			order by u.username`, id).QueryStructs(&state.Game.RedPlayers)
		for _, v := range state.Game.RedPlayers {
			v.Done = false
			v.TODO = true
		}

		DB.SQL(`select distinct(u.username),u.id as player_id, p.accepted
			from game_players p
			left join users u on u.id=p.player_id
			where p.game_id=$1 and p.blue_team
			order by u.username`, id).QueryStructs(&state.Game.BluePlayers)
		for _, v := range state.Game.BluePlayers {
			v.Done = false
			v.TODO = true
		}

	}

	// calculate the x and y km
	state.Game.CalcKm()
	state.Game.CalcGrid()
	state.Game.TileX = state.Game.GridX
	state.Game.TileY = state.Game.GridY

	// and fetch the tiles from storage
	err = DB.SQL(`select i,height,content,owner from tiles where game_id=$1 order by i`, id).QueryStructs(&state.Game.Tiles)
	if err != nil {
		return err
	}

	// and fetch the objectives
	err = DB.SQL(`select * from game_objective where game_id=$1`, id).QueryStructs(&state.Game.Objectives)
	return err
}

func dumpHeader(fp *os.File, game *shared.Game) {
	fmt.Fprintf(fp, "Hosted By: %d %s %s\nName: %s %d\nDescr: %s\nTurn %d of %d\nTable: %d x %d ft grid size of %d\"\n",
		game.HostedBy, game.HostName, game.HostEmail,
		game.Name, game.Year,
		game.Descr,
		game.Turn, game.TurnLimit,
		game.TableX, game.TableY, game.GridSize)
	for _, v := range game.Objectives {
		fmt.Fprintf(fp, "  Objective %s @ %d,%d VP: %d per turn, %d Red %d Blue\n",
			v.Name, v.X, v.Y, v.VPPerTurn, v.RedVP, v.BlueVP)
	}

	fmt.Fprintf(fp, "Players:\n  Red Team: %s\n", game.RedTeam)
	for _, v := range game.RedPlayers {
		fmt.Fprintf(fp, "    %s\n", v.Username)
	}
	fmt.Fprintf(fp, "  Blue Team: %s\n", game.BlueTeam)
	for _, v := range game.BluePlayers {
		fmt.Fprintf(fp, "    %s\n", v.Username)
	}
	fmt.Fprintf(fp, "Red Commands:\n")
	for _, v := range game.RedCmd {
		fmt.Fprintf(fp, "  %s of %s, Commander: %s  Player: %d %s %s\n    @%d,%d %s\n",
			v.Name, v.Nation, v.CommanderName, v.PlayerID, v.PlayerName, v.PlayerEmail,
			v.StartX, v.StartY, v.Summarize())
		for _, v1 := range v.Units {
			if v1.UType != 1 {
				fmt.Fprintf(fp, "  ")
			}
			fmt.Fprintf(fp, "      %s\n", v1.Name)
		}
	}
	fmt.Fprintf(fp, "Blue Commands:\n")
	for _, v := range game.BlueCmd {
		fmt.Fprintf(fp, "  %s of %s, Commander: %s  Player: %d %s %s\n    @%d,%d %s\n",
			v.Name, v.Nation, v.CommanderName, v.PlayerID, v.PlayerName, v.PlayerEmail,
			v.StartX, v.StartY, v.Summarize())
		for _, v1 := range v.Units {
			if v1.UType != 1 {
				fmt.Fprintf(fp, "  ")
			}
			fmt.Fprintf(fp, "      %s\n", v1.Name)
		}
	}
}

func exists(path string) (bool, error) {
	_, err := os.Stat(path)
	if err == nil {
		return true, nil
	}
	if os.IsNotExist(err) {
		return false, nil
	}
	return true, err
}

func playRoutine(id int, playChannel <-chan PlayMessage) {

	getTimeStamp := func() string {
		return time.Now().Format("Mon Jan 2 15:04:05 -0700 MST 2006")
	}

	err := os.Mkdir("../gamelog", os.FileMode(0744))
	if err != nil {
		// good if already exists
		if err.(*os.PathError).Err.Error() != "file exists" {
			println("Create Dir ../gamelog", err.Error())
		}
	} else {
		println("Created new directory for gamelogs")
	}
	// if file exists, open in append mode, else create and dump header

	logname := fmt.Sprintf("../gamelog/%d", id)
	logexists, _ := exists(logname)
	fp, err := os.OpenFile(logname, os.O_CREATE|os.O_RDWR|os.O_APPEND, os.FileMode(0644))
	if err != nil {
		println("Error opening game log", err.Error())
		return
	}
	defer fp.Close()
	// all good - spawn our state
	state := PlayState{
		Game: &shared.Game{},
	}
	err = loadGameData(id, state)
	if err != nil {
		log.Printf("Error Loading Game State: %s\n", err.Error())
		fmt.Fprintf(fp, "Error Loading Game State: %s\n", err.Error())
		return
	}

	log.Printf("Starting Game GoRoutine for %d\n", id)
	if !logexists {
		fmt.Fprintf(fp, "====================================\nStart GameRoutine %s\n", getTimeStamp())
		dumpHeader(fp, state.Game)
	} else {
		fmt.Fprintf(fp, "====================================\nRe-Start GameRoutine %s\n", getTimeStamp())
	}
	fmt.Fprintf(fp, "Turn %d of %d, Phase %d\n", state.Game.Turn, state.Game.TurnLimit, state.Game.Phase)

	// Before we start, let the players know that we are back to life over here
	sendPhaseUpdates(state, false)

	for {
		select {
		case m, ok := <-playChannel:
			if !ok {
				println("Error reading from PlayChannel")
				return
			}
			// fmt.Fprintf(fp, "%s %v\n  ", getTimeStamp(), m)
			// fmt.Fprintf(fp, "» %v\n  ", m)
			switch m.OpCode {
			case GameEnds:
				fmt.Fprintf(fp, "End\n")
			case GamePause:
				fmt.Fprintf(fp, "Pause\n")
			case GameRestart:
				fmt.Fprintf(fp, "Restart\n")
			case GameRewind:
				fmt.Fprintf(fp, "Rewind\n")
			case PlayerPhaseDone, PlayerPhaseNotDone:
				if m.OpCode == PlayerPhaseNotDone {
					fmt.Fprintf(fp, "Player %d is Not Done Yet\n", m.PlayerID)
					playerDone(state, m.PlayerID, false)
				} else {
					fmt.Fprintf(fp, "Player %d is Done\n", m.PlayerID)
					playerDone(state, m.PlayerID, true)
				}
				if allDone(state) {
					fmt.Fprintf(fp, "ALL DONE - phase %d ends\n", state.Game.Phase)
					println(".. ALL DONE - phase ends in game", state.Game.ID)
					newTurn := false
					state.Game.Phase++
					if state.Game.Phase > 6 {
						state.Game.Phase = 1
						state.Game.Turn++
						newTurn = true
					}
					fmt.Printf("Turn %d Phase %d Begins\n", state.Game.Turn, state.Game.Phase)
					fmt.Fprintf(fp, "Turn %d Phase %d Begins\n", state.Game.Turn, state.Game.Phase)
					if state.Game.Turn >= state.Game.TurnLimit {
						println("TURN Limit Reached")
						fmt.Fprintf(fp, "TURN Limit %d Reached\n", state.Game.TurnLimit)
					}
					sendPhaseUpdates(state, newTurn)
					_, err := DB.SQL(`update game set turn=$2,phase=$3 where id=$1`,
						state.Game.ID, state.Game.Turn, state.Game.Phase).Exec()
					if err != nil {
						fmt.Fprintf(fp, "DB Error %s\n", err.Error())
					}
				} else {
					println(".. still more players to finish yet")
				}
			}
		case <-time.After(60 * time.Second):

			// print("tick", id)
			// fmt.Fprintf(fp, "Real Time: %s\n", getTimeStamp())
		}
	}
}

func sendPhaseUpdates(state PlayState, newTurn bool) {
	println("sending phase updates")
	for i, v := range state.Game.RedPlayers {
		println("sent to red", v.Username)
		if newTurn {
			Connections.BroadcastPlayer(v.PlayerID, "Play", "Turn", state.Game.Turn)
			state.Game.RedPlayers[i].TODO = true
			state.Game.RedPlayers[i].Done = false
		} else {
			// half the time have nothing to do
			fmt.Printf("%d %% 2 = %d", state.Game.Phase, state.Game.Phase%2)
			if state.Game.Phase%2 == 0 {
				// there is stuff for us to do this phase
				println("Red has things to do this phase")
				state.Game.RedPlayers[i].TODO = true
				state.Game.RedPlayers[i].Done = false
				Connections.BroadcastPlayer(v.PlayerID, "Play", "Phase", state.Game.Phase)
			} else {
				// nothing for us this phase .. wait for everyone to finish
				println("Red has no actions this phase")
				state.Game.RedPlayers[i].TODO = false
				state.Game.RedPlayers[i].Done = true
				Connections.BroadcastPlayer(v.PlayerID, "Play", "PhaseWait", state.Game.Phase)
			}
		}
	}
	for i, v := range state.Game.BluePlayers {
		println("sent to blue", v.Username)
		// we always have stuff in eveny phase
		println("blue has stuff to do this phase")
		state.Game.BluePlayers[i].TODO = true
		state.Game.BluePlayers[i].Done = false
		if newTurn {
			Connections.BroadcastPlayer(v.PlayerID, "Play", "Turn", state.Game.Turn)
		} else {
			Connections.BroadcastPlayer(v.PlayerID, "Play", "Phase", state.Game.Phase)
		}
	}
}

func allDone(state PlayState) bool {
	for _, v := range state.Game.RedPlayers {
		if !v.Done {
			return false
		}
	}
	for _, v := range state.Game.BluePlayers {
		if !v.Done {
			return false
		}
	}
	return true
}

func playerDone(state PlayState, pid int, done bool) {
	for i, v := range state.Game.RedPlayers {
		if v.PlayerID == pid {
			state.Game.RedPlayers[i].Done = done
			// fmt.Printf("Before and After state %v\n%v", v, state.Game.RedPlayers[i])
			return
		}
	}
	for i, v := range state.Game.BluePlayers {
		if v.PlayerID == pid {
			state.Game.BluePlayers[i].Done = done
			// fmt.Printf("Befone and After state %v\n%v", v, state.Game.BluePlayers[i])
			return
		}
	}
}

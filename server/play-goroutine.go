package main

import (
	"encoding/gob"
	"fmt"
	"log"
	"os"
	"time"
	// "runtime/debug"
	"../shared"
)

const (
	GameEnds = iota
	GameRewindPhase
	GameRewindTurn
	GameRestart
	GamePause
	PlayerPhaseDone
	PlayerPhaseBusy
	PlayerPhaseNotBusy
	PlayerConnected
	PlayerDisconnected
	PlayersChanged
	BombardAdd
	BombardCancel
	BombardSetTarget
	BombardDispute
)

type PlayMessage struct {
	Game     int
	PlayerID int
	OpCode   int
	Data     interface{}
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
	Game     *shared.Game
	Log      *os.File
	Bombards []*shared.Bombard
}

func loadGameData(id int, state *PlayState) error {
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
		// We just started, so clear it all out
		DB.SQL(`update game_players set connected=false where game_id=$1`, state.Game.ID).Exec()

		// fill in the players on each side
		DB.SQL(`select u.id as player_id,u.username,u.email,p.accepted,p.connected
			from game_players p
			left join users u on u.id=p.player_id
			where p.game_id=$1 and p.red_team
			order by u.username`, id).QueryStructs(&state.Game.RedPlayers)
		for _, v := range state.Game.RedPlayers {
			v.Done = false
			v.TODO = true
			v.Busy = false
		}

		DB.SQL(`select u.id as player_id,u.username, u.email,p.accepted,p.connected
			from game_players p
			left join users u on u.id=p.player_id
			where p.game_id=$1 and p.blue_team
			order by u.username`, id).QueryStructs(&state.Game.BluePlayers)
		for _, v := range state.Game.BluePlayers {
			v.Done = false
			v.TODO = true
			v.Busy = false
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
		fmt.Fprintf(fp, "    %d %s\n", v.PlayerID, v.Username)
	}
	fmt.Fprintf(fp, "  Blue Team: %s\n", game.BlueTeam)
	for _, v := range game.BluePlayers {
		fmt.Fprintf(fp, "    %d %s\n", v.PlayerID, v.Username)
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
	state := &PlayState{
		Log:  fp,
		Game: &shared.Game{},
	}
	err = loadGameData(id, state)
	if err != nil {
		log.Printf("Error Loading Game State: %s\n", err.Error())
		fmt.Fprintf(fp, "Error Loading Game State: %s\n", err.Error())
		return
	}

	// At the start of the game goroutine, we clear out the bombards array
	// and any other temp combat trackers
	DB.SQL(`delete from bombard where game_id=$1`, state.Game.ID).Exec()

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
			case GameRewindPhase:
				fmt.Fprintf(fp, "Rewind Phase\n")
			case GameRewindTurn:
				fmt.Fprintf(fp, "Rewind Turn\n")
			case PlayerConnected:
				fmt.Fprintf(fp, "Player %d Joins the Game\n", m.PlayerID)
				loadPlayerConnectionStatus(state)
			case PlayerDisconnected:
				fmt.Fprintf(fp, "Player %d Has Left the Game\n", m.PlayerID)
				loadPlayerConnectionStatus(state)
			case PlayersChanged:
				fmt.Fprintf(fp, "Player Teams have been modified - reload\n")
				loadPlayerConnectionStatus(state)
			case BombardAdd:
				fmt.Fprintf(fp, "Player Requests Fire Mission\n")
				bombardAdd(state, m)
			case BombardCancel:
				fmt.Fprintf(fp, "Fire Mission Cancel\n")
				bombardCancel(state, m)
			case BombardDispute:
			case BombardSetTarget:
			case PlayerPhaseBusy:
				// fmt.Fprintf(fp, "Player %d is busy", m.PlayerID)
			case PlayerPhaseNotBusy:
				// fmt.Fprintf(fp, "Player %d is free", m.PlayerID)
			case PlayerPhaseDone:
				fmt.Fprintf(state.Log, "Player %d is Done\n", m.PlayerID)
				playerPhaseDone(state, m)
			}
		case <-time.After(60 * time.Second):

			// print("tick", id)
			// fmt.Fprintf(fp, "Real Time: %s\n", getTimeStamp())
		}
	}
}

func bombardAdd(state *PlayState, m PlayMessage) {
	if bb, ok := m.Data.(*shared.Bombard); ok {
		// add to the list of bombards
		newID := len(state.Bombards) + 1
		bb.ID = newID
		state.Bombards = append(state.Bombards, bb)
		// Both players are not done till this bombard is done
		playerDone(state, bb.TargetID, false)
		playerDone(state, bb.FirerID, false)

		// Stamp the DB with the new ID of the bombardment
		fmt.Fprintf(state.Log, "Register Bombardment %d\n", newID)
		DB.SQL(`update bombard set id=$2 where unit_id=$1`, bb.UnitID, newID).Exec()

		// signal target player that they have incoming
		Connections.BroadcastPlayer(bb.TargetID, "Play", "Incoming", newID)

		// signal the firer that we have a new target identification ID for them, all they need
		// to do is re-get the unit info
		Connections.BroadcastPlayer(bb.FirerID, "Play", "BB", bb.UnitID)
	}
}

func bombardCancel(state *PlayState, m PlayMessage) {
	if bb, ok := m.Data.(*shared.Bombard); ok {
		// find the offending bombard and cancel it
		for i, v := range state.Bombards {
			if v.ID == bb.ID {
				fmt.Fprintf(state.Log, "Removing Bombardment %d\n", bb.ID)
				state.Bombards = append(state.Bombards[:i], state.Bombards[i+1:]...)
				break
			}
		}

		// signal target player that they have 1 less incoming
		Connections.BroadcastPlayer(bb.TargetID, "Play", "IncomingCancel", bb.ID)

		// signal the firer that we have removed the BB, which triggers a refresh of their
		// fire mission page
		Connections.BroadcastPlayer(bb.FirerID, "Play", "BB", bb.UnitID)
	}
}

func playerPhaseDone(state *PlayState, m PlayMessage) {
	if hasBombards(state, m.PlayerID) {
		fmt.Fprintf(state.Log, "But this player still has bombards to sort out\n")
		return
	}

	playerDone(state, m.PlayerID, true)

	if allDone(state) && allFree(state) {
		fmt.Fprintf(state.Log, "ALL DONE - phase %d ends\n", state.Game.Phase)
		println(".. ALL DONE - phase ends in game", state.Game.ID)
		newTurn := false
		state.Game.Phase++
		if state.Game.Phase > shared.PhaseObjectives {
			state.Game.Phase = 1
			state.Game.Turn++
			// Just for now, advance the state of any units adjusting state
			DB.SQL(`update game_cmd set cstate=dstate where game_id=$1`, state.Game.ID).Exec()
			newTurn = true
		}
		fmt.Printf("Turn %d Phase %d Begins\n", state.Game.Turn, state.Game.Phase)
		fmt.Fprintf(state.Log, "Turn %d Phase %d Begins\n", state.Game.Turn, state.Game.Phase)
		if state.Game.Turn >= state.Game.TurnLimit {
			println("TURN Limit Reached")
			fmt.Fprintf(state.Log, "TURN Limit %d Reached\n", state.Game.TurnLimit)
		}
		sendPhaseUpdates(state, newTurn)
		_, err := DB.SQL(`update game set turn=$2,phase=$3 where id=$1`,
			state.Game.ID, state.Game.Turn, state.Game.Phase).Exec()
		if err != nil {
			fmt.Fprintf(state.Log, "DB Error %s\n", err.Error())
		}
	} else {
		if allFree(state) {
			println(".. still more players to finish yet")
		} else {
			println(".. some players are busy")
		}
	}
}

func loadPlayerConnectionStatus(state *PlayState) {

	newRed := []*shared.GamePlayerData{}
	newBlue := []*shared.GamePlayerData{}

	// Completely reload the player arrays from the DB
	DB.SQL(`select distinct(u.username),u.id as player_id,p.accepted,p.connected
			from game_players p
			left join users u on u.id=p.player_id
			where p.game_id=$1 and p.red_team
			order by u.username`, state.Game.ID).QueryStructs(&newRed)
	for _, v := range newRed {
		v.Done = false
		v.TODO = true
		v.Busy = false
		for _, p := range state.Game.RedPlayers {
			if p.PlayerID == v.PlayerID {
				v.Done = p.Done
				v.TODO = p.TODO
				v.Busy = p.Busy
			}
		}
	}

	DB.SQL(`select distinct(u.username),u.id as player_id, p.accepted,p.connected
			from game_players p
			left join users u on u.id=p.player_id
			where p.game_id=$1 and p.blue_team
			order by u.username`, state.Game.ID).QueryStructs(&newBlue)
	for _, v := range newBlue {
		v.Done = false
		v.TODO = true
		v.Busy = false
		for _, p := range state.Game.BluePlayers {
			if p.PlayerID == v.PlayerID {
				v.Done = p.Done
				v.TODO = p.TODO
				v.Busy = p.Busy
			}
		}
	}
	state.Game.RedPlayers = newRed
	state.Game.BluePlayers = newBlue
}

func sendPhaseUpdates(state *PlayState, newTurn bool) {
	// println("sending phase updates")
	for i, v := range state.Game.RedPlayers {
		state.Game.RedPlayers[i].TODO = true
		state.Game.RedPlayers[i].Done = false
		if newTurn {
			Connections.BroadcastPlayer(v.PlayerID, "Play", "Turn", state.Game.Turn)
		} else {
			Connections.BroadcastPlayer(v.PlayerID, "Play", "Phase", state.Game.Phase)
		}
	}
	for i, v := range state.Game.BluePlayers {
		state.Game.BluePlayers[i].TODO = true
		state.Game.BluePlayers[i].Done = false
		if newTurn {
			Connections.BroadcastPlayer(v.PlayerID, "Play", "Turn", state.Game.Turn)
		} else {
			Connections.BroadcastPlayer(v.PlayerID, "Play", "Phase", state.Game.Phase)
		}
	}
}

func allDone(state *PlayState) bool {
	if len(state.Bombards) > 0 {
		println("there are still bombards to do yet")
		return false
	}
	for _, v := range state.Game.RedPlayers {
		if !v.Done {
			println("red player ", v.PlayerID, v.Username, "is not done yet", v.Done)
			return false
		}
	}
	for _, v := range state.Game.BluePlayers {
		if !v.Done {
			println("blue player ", v.PlayerID, v.Username, "is not done yet", v.Done)
			return false
		}
	}
	return true
}

func allFree(state *PlayState) bool {
	for _, v := range state.Game.RedPlayers {
		if v.Busy {
			println("red player ", v.PlayerID, v.Username, "is busy")
			return false
		}
	}
	for _, v := range state.Game.BluePlayers {
		if v.Busy {
			println("blue player ", v.PlayerID, v.Username, "is busy")
			return false
		}
	}
	return true
}

func playerDone(state *PlayState, pid int, done bool) {
	for i, v := range state.Game.RedPlayers {
		if v.PlayerID == pid {
			state.Game.RedPlayers[i].Done = done
			return
		}
	}
	for i, v := range state.Game.BluePlayers {
		if v.PlayerID == pid {
			state.Game.BluePlayers[i].Done = done
			return
		}
	}
}

func hasBombards(state *PlayState, pid int) bool {
	for _, v := range state.Game.RedPlayers {
		if v.PlayerID == pid {
			for _, b := range state.Bombards {
				if b.ID != 0 && (b.TargetID == pid || b.FirerID == pid) {
					println("BB", b.ID, b.TargetID, b.FirerID)
					return true
				}
			}
		}
	}
	for _, v := range state.Game.BluePlayers {
		if v.PlayerID == pid {
			for _, b := range state.Bombards {
				if b.TargetID == pid || b.FirerID == pid {
					println("BB", b.ID, b.TargetID, b.FirerID)
					return true
				}
			}
		}
	}
	return false
}

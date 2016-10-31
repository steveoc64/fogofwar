package main

import (
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
)

type PlayMessage struct {
	Game     *shared.Game
	PlayerID int
	OpCode   int
}

// Global map of comms channels to refer to game goroutines by
// All comms with the goroutine is via its unique message channel
var Plays map[int]chan<- PlayMessage

func InitGames() {
	// on boot, start up a goroutine for every running game
	println("Firing up Game Threads ...")
	Plays := make(map[int]chan<- PlayMessage)
	ids := []int{}
	err := DB.SQL(`select id from game where started and not stopped`).QuerySlice(&ids)
	if err != nil {
		println("Fetching Running Game IDs: ", err.Error())
		return
	}
	for _, v := range ids {
		Plays[v] = StartPlay(v)
	}

	fmt.Printf("Created map of channels %d\n", Plays)
}

func StartPlay(gameID int) chan<- PlayMessage {
	playChannel := make(chan PlayMessage, 16)
	go playRoutine(gameID, playChannel)
	return playChannel
}

type PlayState struct {
	Game *shared.Game
}

func loadGameData(id int, retval *shared.Game) error {
	err := DB.SQL(`select
			g.*,u.username as host_name,u.email as host_email,
				coalesce(p_red.reds, 0) as num_red_players,
				coalesce(p_blue.blues, 0) as num_blue_players
		from game g
			left join users u on u.id=g.hosted_by
	 		left join (select game_id, count(*) as reds from game_players where red_team group by 1) p_red on p_red.game_id=g.id
	 		left join (select game_id, count(*) as blues from game_players where blue_team group by 1) p_blue on p_blue.game_id=g.id
		where g.id=$1`, id).QueryStruct(retval)
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
				where g.game_id=$1 and g.red_team order by g.name`, id).QueryStructs(&retval.RedCmd)
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
				where g.game_id=$1 and g.blue_team order by g.name`, id).QueryStructs(&retval.BlueCmd)
	if err != nil {
		return err
	}

	// Get the units for each command
	for _, v := range retval.RedCmd {
		err = DB.SQL(`select * from unit where cmd_id=$1 and game_id=$2 order by path`,
			v.ID, id).QueryStructs(&v.Units)
		if err != nil {
			return err
		}
		v.CalcTotals()
	}
	for _, v := range retval.BlueCmd {
		err = DB.SQL(`select * from unit where cmd_id=$1 and game_id=$2 order by path`,
			v.ID, id).QueryStructs(&v.Units)
		if err != nil {
			return err
		}
		v.CalcTotals()
	}

	if err == nil {
		// fill in the players on each side
		DB.SQL(`select distinct(u.username),p.accepted
			from game_players p
			left join users u on u.id=p.player_id
			where p.game_id=$1 and p.red_team
			order by u.username`, id).QueryStructs(&retval.RedPlayers)

		DB.SQL(`select distinct(u.username),p.accepted
			from game_players p
			left join users u on u.id=p.player_id
			where p.game_id=$1 and p.blue_team
			order by u.username`, id).QueryStructs(&retval.BluePlayers)
	}

	// calculate the x and y km
	retval.CalcKm()
	retval.CalcGrid()
	retval.TileX = retval.GridX
	retval.TileY = retval.GridY

	// and fetch the tiles from storage
	err = DB.SQL(`select i,height,content,owner from tiles where game_id=$1 order by i`, id).QueryStructs(&retval.Tiles)
	if err != nil {
		return err
	}

	// and fetch the objectives
	err = DB.SQL(`select * from game_objective where game_id=$1`, id).QueryStructs(&retval.Objectives)
	return err
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
	fp, err := os.OpenFile(fmt.Sprintf("../gamelog/%d", id), os.O_CREATE|os.O_RDWR|os.O_APPEND, os.FileMode(0644))
	if err != nil {
		println("Error opening game log", err.Error())
		return
	}
	defer fp.Close()
	log.Printf("Starting Game GoRoutine for %d\n", id)
	fmt.Fprintf(fp, "====================================\nStart GameRoutine %s\n", getTimeStamp())

	// all good - spawn our state
	state := PlayState{
		Game: &shared.Game{},
	}
	err = loadGameData(id, state.Game)
	if err != nil {
		log.Printf("Error Loading Game State: %s\n", err.Error())
		fmt.Fprintf(fp, "Error Loading Game State: %s\n", err.Error())
		return
	}
	fmt.Fprintf(fp, "Hosted By: %d %s %s\nName: %s %d\nDescr: %s\nTurn %d of %d\nTable: %d x %d ft grid size of %d\"\n",
		state.Game.HostedBy, state.Game.HostName, state.Game.HostEmail,
		state.Game.Name, state.Game.Year,
		state.Game.Descr,
		state.Game.Turn, state.Game.TurnLimit,
		state.Game.TableX, state.Game.TableY, state.Game.GridSize)
	for _, v := range state.Game.Objectives {
		fmt.Fprintf(fp, "  Objective %s @ %d,%d VP: %d per turn, %d Red %d Blue\n",
			v.Name, v.X, v.Y, v.VPPerTurn, v.RedVP, v.BlueVP)
	}

	fmt.Fprintf(fp, "Players:\n  Red Team: %s\n", state.Game.RedTeam)
	for _, v := range state.Game.RedPlayers {
		fmt.Fprintf(fp, "    %s\n", v.Username)
	}
	fmt.Fprintf(fp, "  Blue Team: %s\n", state.Game.BlueTeam)
	for _, v := range state.Game.BluePlayers {
		fmt.Fprintf(fp, "    %s\n", v.Username)
	}
	fmt.Fprintf(fp, "Red Commands:\n")
	for _, v := range state.Game.RedCmd {
		fmt.Fprintf(fp, "  %s of %s, Commander: %s  Player: %d %s %s\n    @%d,%d %s\n",
			v.Name, v.Nation, v.CommanderName, v.PlayerID, v.PlayerName, v.PlayerEmail,
			v.StartX, v.StartY, v.Summarize())
		for _, v1 := range v.Units {
			fmt.Fprintf(fp, "      %s\n", v1.Name)
		}
	}
	fmt.Fprintf(fp, "Blue Commands:\n")
	for _, v := range state.Game.BlueCmd {
		fmt.Fprintf(fp, "  %s of %s, Commander: %s  Player: %d %s %s\n    @%d,%d %s\n",
			v.Name, v.Nation, v.CommanderName, v.PlayerID, v.PlayerName, v.PlayerEmail,
			v.StartX, v.StartY, v.Summarize())
		for _, v1 := range v.Units {
			fmt.Fprintf(fp, "      %s\n", v1.Name)
		}
	}

	for {
		select {
		case m, ok := <-playChannel:
			if !ok {
				println("Error reading from PlayChannel")
				return
			}
			fmt.Fprintf(fp, "Message: %v", m)
			switch m.OpCode {
			case GameEnds:
				fmt.Fprintf(fp, "End\n")
			case GamePause:
				fmt.Fprintf(fp, "Pause\n")
			case GameRestart:
				fmt.Fprintf(fp, "Restart\n")
			case GameRewind:
				fmt.Fprintf(fp, "Rewind\n")
			}
		case <-time.After(60 * time.Second):
			fmt.Fprintf(fp, "Real Time: %s\n", getTimeStamp())
		}
	}
}

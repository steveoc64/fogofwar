package main

import (
	"errors"
	"fmt"
	"time"

	"../shared"
)

func (g *GameRPC) PlayList(data shared.GameRPCData, retval *[]shared.Game) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	err := DB.SQL(`select
			g.*,u.username as host_name,u.email as host_email,
				coalesce(p_red.reds, 0) as num_red_players,
				coalesce(p_blue.blues, 0) as num_blue_players
		from game g
			left join users u on u.id=g.hosted_by
	 		left join (select game_id, count(*) as reds from game_players where red_team group by 1) p_red on p_red.game_id=g.id
	 		left join (select game_id, count(*) as blues from game_players where blue_team group by 1) p_blue on p_blue.game_id=g.id
		where started and g.id in (select game_id from game_players where player_id=$1)`, conn.UserID).QueryStructs(retval)

	logger(start, "Game.PlayList", conn,
		"",
		fmt.Sprintf("%d Records", len(*retval)))

	return err
}

func (g *GameRPC) GetPlay(data shared.GameRPCData, retval *shared.Game) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	// check that we are on the invite list
	c1 := 0
	DB.SQL(`select count(*) from game_players where game_id=$1 and player_id=$2`, data.ID, conn.UserID).QueryScalar(&c1)
	if c1 == 0 {
		return errors.New("Insufficient Privilege")
	}

	err := DB.SQL(`select
			g.*,u.username as host_name,u.email as host_email,
				coalesce(p_red.reds, 0) as num_red_players,
				coalesce(p_blue.blues, 0) as num_blue_players
		from game g
			left join users u on u.id=g.hosted_by
	 		left join (select game_id, count(*) as reds from game_players where red_team group by 1) p_red on p_red.game_id=g.id
	 		left join (select game_id, count(*) as blues from game_players where blue_team group by 1) p_blue on p_blue.game_id=g.id
		where started and g.id=$1`, data.ID).QueryStruct(retval)

	if err == nil {
		// fill in the players on each side
		DB.SQL(`select distinct(u.username),p.accepted
			from game_players p
			left join users u on u.id=p.player_id
			where p.game_id=$1 and p.red_team
			order by u.username`, data.ID).QueryStructs(&retval.RedPlayers)

		DB.SQL(`select distinct(u.username),p.accepted
			from game_players p
			left join users u on u.id=p.player_id
			where p.game_id=$1 and p.blue_team
			order by u.username`, data.ID).QueryStructs(&retval.BluePlayers)

		count := 0
		DB.SQL(`select count(*)
			from game_players
			where game_id=$1 and player_id=$2 and red_team`, data.ID, conn.UserID).QueryScalar(&count)
		if count > 0 {
			retval.Red = true
		}

		DB.SQL(`select count(*)
			from game_players
			where game_id=$1 and player_id=$2 and blue_team`, data.ID, conn.UserID).QueryScalar(&count)
		if count > 0 {
			retval.Blue = true
		}

		retval.Team = "Blue Team"
		if retval.Red {
			if retval.Blue {
				retval.Team = "Both Red and Blue Teams"
			} else {
				retval.Team = "Red Team"
			}
		}

		if !retval.Red {
			retval.BlueBrief = ""
		}
		if !retval.Blue {
			retval.RedBrief = ""
		}

		// Fill in the cmd arrays
		if retval.Red {
			DB.SQL(`select
				g.*,
					coalesce(u.username,'') as player_name,
					coalesce(u.email,'') as player_email
				from game_cmd g
				left join users u on u.id=g.player_id
				where g.game_id=$1 and g.red_team order by g.name`, data.ID).QueryStructs(&retval.RedCmd)
		}
		if retval.Blue {
			DB.SQL(`select
				g.*,
					coalesce(u.username,'') as player_name,
					coalesce(u.email,'') as player_email
				from game_cmd g
				left join users u on u.id=g.player_id
				where g.game_id=$1 and g.blue_team order by g.name`, data.ID).QueryStructs(&retval.BlueCmd)
		}

		// If the GetUnits flag was set, then get all the units for each of the commands as well
		if data.GetUnits {
			if retval.Red {
				for _, v := range retval.RedCmd {
					DB.SQL(`select * from unit where cmd_id=$1 and game_id=$2 order by path`,
						v.ID, data.ID).QueryStructs(&v.Units)
					// println("red", v.ID, data.ID, v.Units)
				}
			}
			if retval.Blue {
				for _, v := range retval.BlueCmd {
					DB.SQL(`select * from unit where cmd_id=$1 and game_id=$2 order by path`,
						v.ID, data.ID).QueryStructs(&v.Units)
					// println("blue", v.ID, data.ID, v.Units)
				}
			}
		}

		// calculate the x and y km
		retval.CalcKm()
		retval.CalcGrid()
		retval.TileX = retval.GridX
		retval.TileY = retval.GridY

		// and fetch the tiles from storage
		err2 := DB.SQL(`select i,height,content,owner from tiles where game_id=$1 order by i`, data.ID).QueryStructs(&retval.Tiles)
		if err2 != nil {
			print("hmmm ... ", err2.Error())
		}
		// fmt.Printf("tiles 0 %v\n", retval.Tiles[0])

		// and fetch the objectives
		err2 = DB.SQL(`select * from game_objective where game_id=$1`, data.ID).QueryStructs(&retval.Objectives)

		// TODO - pull in the players on this game
		retval.PhaseTODO = true
	}

	logger(start, "Game.GetPlay", conn,
		fmt.Sprintf("ID %d", data.ID),
		fmt.Sprintf("%s Red %v Blue %v %dx%d on a %d Grid, with %d:%d cmds",
			retval.Name, retval.Red, retval.Blue,
			retval.TableX, retval.TableY, retval.GridSize,
			len(retval.RedCmd), len(retval.BlueCmd)))

	return err
}

func (g *GameRPC) PhaseDone(data shared.PhaseDoneMsg, retval *bool) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)
	err := error(nil)

	// Send message to the play-goroutine to say that this player is done
	if play, ok := Plays[data.GameID]; ok {
		play <- PlayMessage{
			Game:     data.GameID,
			PlayerID: conn.UserID,
			OpCode:   PlayerPhaseDone,
		}
	} else {
		err = errors.New("Invalid Game ID")
	}

	logger(start, "Game.PhaseDone", conn,
		fmt.Sprintf("Game %d", data.GameID), "")

	return err
}

func (g *GameRPC) PhaseNotDone(data shared.PhaseDoneMsg, retval *bool) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)
	err := error(nil)

	// Send message to the play-goroutine to say that this player is done
	if play, ok := Plays[data.GameID]; ok {
		play <- PlayMessage{
			Game:     data.GameID,
			PlayerID: conn.UserID,
			OpCode:   PlayerPhaseNotDone,
		}
	} else {
		err = errors.New("Invalid Game ID")
	}

	logger(start, "Game.PhaseNotDone", conn,
		fmt.Sprintf("Game %d", data.GameID), "")

	return err
}

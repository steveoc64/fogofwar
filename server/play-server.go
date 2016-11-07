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
		where started and g.id in (select game_id from game_players where player_id=$1)
		order by g.name`, conn.UserID).QueryStructs(retval)

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
		DB.SQL(`select u.id as player_id,u.username,u.email,p.accepted,p.connected
			from game_players p
			left join users u on u.id=p.player_id
			where p.game_id=$1 and p.red_team
			order by u.username`, data.ID).QueryStructs(&retval.RedPlayers)

		DB.SQL(`select u.id as player_id,u.username,u.email,p.accepted,p.connected
			from game_players p
			left join users u on u.id=p.player_id
			where p.game_id=$1 and p.blue_team
			order by u.username`, data.ID).QueryStructs(&retval.BluePlayers)

		// generate avatars and clear emails
		for i, v := range retval.RedPlayers {
			retval.RedPlayers[i].Avatar = v.GetAvatar(32)
			retval.RedPlayers[i].Email = ""
		}
		for i, v := range retval.BluePlayers {
			retval.BluePlayers[i].Avatar = v.GetAvatar(32)
			retval.BluePlayers[i].Email = ""
		}

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
					// and get any current bombards
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

		if data.GetBombard {
			bb := []*shared.Bombard{}
			DB.SQL(`select * from bombard where game_id=$1`, data.ID).QueryStructs(&bb)
			for _, v := range retval.RedCmd {
				for _, u := range v.Units {
					for _, b := range bb {
						if b.UnitID == u.ID {
							u.Bombard = b
							break
						}
					}
				}
			}
			for _, v := range retval.BlueCmd {
				for _, u := range v.Units {
					for _, b := range bb {
						if b.UnitID == u.ID {
							u.Bombard = b
							break
						}
					}
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

		DB.SQL(`update game_players set connected=true where game_id=$1 and player_id=$2`, data.ID, conn.UserID).Exec()
		// and message the game thread to re-read its connection status
		if play, ok := Plays[data.ID]; ok {
			play <- PlayMessage{
				Game:     data.ID,
				PlayerID: conn.UserID,
				OpCode:   PlayerConnected,
			}
			println("Player", conn.Username, "has joined game", data.ID)
		}
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

func (g *GameRPC) PhaseBusy(data shared.PhaseDoneMsg, retval *bool) error {
	// start := time.Now()

	conn := Connections.Get(data.Channel)
	err := error(nil)

	// Send message to the play-goroutine to say that this player is done
	if play, ok := Plays[data.GameID]; ok {
		play <- PlayMessage{
			Game:     data.GameID,
			PlayerID: conn.UserID,
			OpCode:   PlayerPhaseBusy,
		}
	} else {
		err = errors.New("Invalid Game ID")
	}

	// logger(start, "Game.PhaseBusy", conn,
	// fmt.Sprintf("Game %d Player %d", data.GameID, conn.UserID), "")

	return err
}

func (g *GameRPC) PhaseNotBusy(data shared.PhaseDoneMsg, retval *bool) error {
	// start := time.Now()

	conn := Connections.Get(data.Channel)
	err := error(nil)

	// Send message to the play-goroutine to say that this player is done
	if play, ok := Plays[data.GameID]; ok {
		play <- PlayMessage{
			Game:     data.GameID,
			PlayerID: conn.UserID,
			OpCode:   PlayerPhaseNotBusy,
		}
	} else {
		err = errors.New("Invalid Game ID")
	}

	// logger(start, "Game.PhaseNotBusy", conn,
	// fmt.Sprintf("Game %d Player %d", data.GameID, conn.UserID), "")

	return err
}
func (g *GameRPC) CmdOrder(data shared.CmdOrder, retval *shared.GameCmd) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	// confirm that this user can issue orders to this unit
	cmd := shared.GameCmd{}
	err := DB.SQL(`select * from game_cmd where id=$1`, data.ID).QueryStruct(&cmd)
	if conn.UserID != cmd.PlayerID {
		fmt.Printf("user %d is not in command of %d\n", conn.UserID, data.ID)
		if err != nil {
			println(err.Error())
		}
		return errors.New("Insufficient Privilege")
	}

	if err == nil {
		switch data.Command {
		case shared.CommandCarryOn:
			println("very good, carry on")
		case shared.CommandNewObjective:
			switch cmd.CState {
			case shared.CmdMarchOrder:
				if data.X == cmd.DX && data.Y == cmd.DY {
					// nothing has changed then ..
				} else {
					if cmd.Moving() {
						// we are already marching, and they have changed the objective en-route, so implement a delay
						_, err = DB.SQL(`update game_cmd set wait=false, prep_defence=false,cstate=$5,dstate=$2,dx=$3,dy=$4 where id=$1`,
							data.ID, shared.CmdMarchOrder, data.X, data.Y, shared.CmdReserve).Exec()
					} else {
						// we are ready to march, so start the march right away
						_, err = DB.SQL(`update game_cmd set wait=false, prep_defence=false,dx=$3,dy=$4 where id=$1`,
							data.ID, shared.CmdMarchOrder, data.X, data.Y, shared.CmdReserve).Exec()
					}
				}
			default:
				// set destination state to march order, and set objective, so start marching next turn
				_, err = DB.SQL(`update game_cmd set wait=false, prep_defence=false,dstate=$2,dx=$3,dy=$4 where id=$1`,
					data.ID, data.Command, data.X, data.Y).Exec()
			}
		case shared.CommandHalt:
			if cmd.CState == shared.CmdBattleAdvance {
				_, err = DB.SQL(`update game_cmd set dstate=$2 where id=$1`,
					data.ID, shared.CmdBattleLine).Exec()
			} else {
				_, err = DB.SQL(`update game_cmd set wait=true,prep_defence=false where id=$1`,
					data.ID).Exec()
			}
		case shared.CommandResumeMarch:
			_, err = DB.SQL(`update game_cmd set dstate=$2,wait=false,prep_defence=false where id=$1`,
				data.ID, shared.CmdMarchOrder).Exec()
		case shared.CommandBattleLine:
			_, err = DB.SQL(`update game_cmd set dstate=$2,wait=false,prep_defence=false where id=$1`,
				data.ID, shared.CmdBattleLine).Exec()
		case shared.CommandReserve:
			_, err = DB.SQL(`update game_cmd set dstate=$2,wait=false,prep_defence=false where id=$1`,
				data.ID, shared.CmdReserve).Exec()
		case shared.CommandMarchOrder:
			_, err = DB.SQL(`update game_cmd set dstate=$2,wait=false,prep_defence=false where id=$1`,
				data.ID, shared.CmdMarchOrder).Exec()
		case shared.CommandPrepare:
			if cmd.CState == shared.CmdBattleLine {
				_, err = DB.SQL(`update game_cmd set prep_defence=true where id=$1`, data.ID).Exec()
			}
		case shared.CommandAdvance:
			if cmd.CState == shared.CmdBattleLine {
				_, err = DB.SQL(`update game_cmd set dstate=$2,wait=false,prep_defence=false where id=$1`,
					data.ID, shared.CmdBattleAdvance).Exec()
			}

		}
	}

	logger(start, "Game.CmdOrder", conn,
		fmt.Sprintf("Corps %d, Cmd %d, XY %d %d", data.ID, data.Command, data.X, data.Y), "")

	if err == nil {
		err = DB.SQL(`select * from game_cmd where id=$1`, data.ID).QueryStruct(retval)
		if err == nil {
			DB.SQL(`select * from unit where cmd_id=$1 order by path`, data.ID).QueryStructs(&retval.Units)
		}
	}

	return err
}

func (g *GameRPC) GTMove(data shared.GTMoveData, retval *shared.GameCmd) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)
	cmd := shared.GameCmd{}
	err := DB.SQL(`select * from game_cmd where id=$1`, data.ID).QueryStruct(&cmd)
	if err != nil || cmd.PlayerID != conn.UserID {
		return errors.New("Invalid Corps Command")
	}

	max, min, gt := cmd.GTMove()
	println("move things", max, min, gt)
	if max > 0 {
		if data.Destination {
			// We have reached the destination
			_, err = DB.SQL(`update game_cmd set cx=dx,cy=dy,dstate=$2 where id=$1`,
				data.ID, shared.CmdCompleteMarch).Exec()
		}
		if data.Contact {
			_, err = DB.SQL(`update game_cmd set contact=true,dstate=$2 where id=$1`,
				data.ID, shared.CmdBattleLine).Exec()
		}
	}

	logger(start, "Game.GTMove", conn,
		fmt.Sprintf("Cmd %d Dest %v Contact %v", data.ID, data.Destination, data.Contact), "")

	if err == nil {
		DB.SQL(`select * from game_cmd where id=$1`, data.ID).QueryStruct(retval)
	}

	return err
}

func (g *GameRPC) Bombard(data shared.BombardData, retval *shared.Bombard) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)
	data.Bombard.FirerID = conn.UserID

	// Create the bombard record
	_, err := DB.InsertInto("bombard").
		Whitelist("game_id", "unit_id", "firer_id", "target_id", "range_max", "range_min").
		Record(data.Bombard).
		Exec()
	if err != nil {
		println(err.Error())
	}

	// Send message to the play-goroutine to add this bombard to the list
	if play, ok := Plays[data.Bombard.GameID]; ok {
		play <- PlayMessage{
			Game:     data.Bombard.GameID,
			PlayerID: conn.UserID,
			OpCode:   BombardAdd,
			Data:     data.Bombard,
		}
	} else {
		err = errors.New("Invalid Game ID")
	}

	logger(start, "Game.Bombard", conn,
		fmt.Sprintf("Game %d bb %v", data.Bombard.GameID, data.Bombard), "")

	return err
}

func (g *GameRPC) GetUnit(data shared.GameRPCData, retval *shared.Unit) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	err := DB.SQL(`select * from unit where id=$1`, data.ID).QueryStruct(retval)
	if err == nil {
		bb := &shared.Bombard{}
		DB.SQL(`select * from bombard where unit_id=$1`, data.ID).QueryStruct(bb)
		retval.Bombard = bb
	}

	logger(start, "Game.GetUnit", conn,
		fmt.Sprintf("ID %d", data.ID),
		fmt.Sprintf("%s", retval.Name))

	return err
}

func (g *GameRPC) GetIncoming(data shared.GameRPCData, retval *[]int) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	err := DB.SQL(`select id from bombard where game_id=$1 and target_id=$2`, data.ID, conn.UserID).QuerySlice(retval)

	logger(start, "Game.GetIncoming", conn,
		fmt.Sprintf("ID %d", data.ID),
		fmt.Sprintf("%d incoming", len(*retval)))

	return err
}

func (g *GameRPC) GetIncomingBombard(data shared.BombardData, retval *string) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	guns := 0
	gtype := ""
	rmax := 0
	rmin := 0
	err := DB.SQL(`select u.guns,gt.name,b.range_min,b.range_max
		from bombard b
			left join unit u on u.id=b.unit_id
			left join gunnery gt on gt.id=u.gunnery_type
		where b.game_id=$1 and b.id=$2`, data.GameID, data.ID).
		QueryScalar(&guns, &gtype, &rmin, &rmax)

	str := ""
	if err == nil && guns > 0 && gtype != "" {
		str = fmt.Sprintf("%d Guns of %s", guns, gtype)
		if rmax != rmin {
			str += fmt.Sprintf(" from %d-%dm", rmin*400, rmax*400)
		} else {
			str += fmt.Sprintf(" at %dm", rmax*400)
		}
		*retval = str
	}

	logger(start, "Game.GetIncomingBombard", conn,
		fmt.Sprintf("Game %d ID %d", data.GameID, data.ID), *retval)

	return err
}
func (g *GameRPC) UnitRole(data shared.UnitRoleData, done *bool) error {
	start := time.Now()

	*done = false
	conn := Connections.Get(data.Channel)

	_, err := DB.SQL(`update unit set role=$2 where id=$1`, data.ID, data.Role).Exec()

	logger(start, "Game.UnitRole", conn,
		fmt.Sprintf("ID %d Role %d", data.ID, data.Role), "")

	if err == nil {
		*done = true
	}

	return err
}

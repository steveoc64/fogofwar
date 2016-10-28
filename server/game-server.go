package main

import (
	"errors"
	"fmt"
	"time"

	"../shared"
)

type GameRPC struct{}

func (g *GameRPC) List(data shared.GameRPCData, retval *[]shared.Game) error {
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
		where g.hosted_by=$1`, conn.UserID).QueryStructs(retval)

	logger(start, "Game.List", conn,
		"",
		fmt.Sprintf("%d Records", len(*retval)))

	return err
}

func (g *GameRPC) ListInvites(data shared.GameRPCData, retval *[]shared.Game) error {
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
		where g.id in (select game_id from game_players where player_id=$1)`, conn.UserID).QueryStructs(retval)

	logger(start, "Game.ListInvites", conn,
		"",
		fmt.Sprintf("%d Records", len(*retval)))

	return err
}

func (g *GameRPC) Get(data shared.GameRPCData, retval *shared.Game) error {
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
		where g.id=$1`, data.ID).QueryStruct(retval)

	if err == nil {
		// TODO - add some security stuff here to ensure that the caller has rights to
		// be able to get this game - ie, they are either the owner of the game, or their ID
		// exists in the invite lists (either red of blue)
		if retval.HostedBy != conn.UserID {
			count := 0
			DB.SQL(`select count(*) from game_players where game_id=$1 and player_id=$2`, data.ID, conn.UserID).QueryScalar(&count)
			if count == 0 {
				return errors.New("Insufficient Privilege")
			}
		}

		// Fill in the cmd arrays
		if data.Red {
			DB.SQL(`select
				g.*,coalesce(u.username,'') as player_name
				from game_cmd g
				left join users u on u.id=g.player_id
				where g.game_id=$1 and g.red_team order by g.name`, data.ID).QueryStructs(&retval.RedCmd)
		}
		if data.Blue {
			DB.SQL(`select
				g.*,coalesce(u.username,'') as player_name
				from game_cmd g
				left join users u on u.id=g.player_id
				where g.game_id=$1 and g.blue_team order by g.name`, data.ID).QueryStructs(&retval.BlueCmd)
		}

		// If the GetUnits flag was set, then get all the units for each of the commands as well
		if data.GetUnits {
			if data.Red {
				for _, v := range retval.RedCmd {
					DB.SQL(`select * from unit where cmd_id=$1 and game_id=$2 order by path`,
						v.ID, data.ID).QueryStructs(&v.Units)
					// println("red", v.ID, data.ID, v.Units)
				}
			}
			if data.Blue {
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

		// Dont need the orders for each corps at this level
		// Dont need the units for each corps at this level

	}

	logger(start, "Game.Get", conn,
		fmt.Sprintf("ID %d", data.ID),
		fmt.Sprintf("%s %dx%d on a %d Grid", retval.Name, retval.TableX, retval.TableY, retval.GridSize))

	return err
}

func (g *GameRPC) GetInvite(data shared.GameRPCData, retval *shared.Game) error {
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
		where g.id=$1`, data.ID).QueryStruct(retval)

	if err == nil {
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
				g.*,coalesce(u.username,'') as player_name
				from game_cmd g
				left join users u on u.id=g.player_id
				where g.game_id=$1 and g.red_team order by g.name`, data.ID).QueryStructs(&retval.RedCmd)
		}
		if retval.Blue {
			DB.SQL(`select
				g.*,coalesce(u.username,'') as player_name
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

		// Dont need the orders for each corps at this level
		// Dont need the units for each corps at this level

	}

	logger(start, "Game.GetInvite", conn,
		fmt.Sprintf("ID %d", data.ID),
		fmt.Sprintf("%s Red %v Blue %v %dx%d on a %d Grid, with %d:%d cmds",
			retval.Name, retval.Red, retval.Blue,
			retval.TableX, retval.TableY, retval.GridSize,
			len(retval.RedCmd), len(retval.BlueCmd)))

	return err
}

func (g *GameRPC) SaveTiles(data shared.GameRPCData, done *bool) error {
	start := time.Now()
	*done = false
	conn := Connections.Get(data.Channel)
	if conn.UserID != data.Game.HostedBy {
		return errors.New("Incorrect owner of game")
	}

	limit := 4
	switch conn.Rank {
	case 1:
		limit = 96 // 6x4 on a 6" grid
	case 2:
		limit = 216 // 6x4 on a 4" grid
	case 3, 4:
		limit = 360 // 8x5 on a 4" grid
	case 10:
		limit = 512 // big table
	}
	if len(data.Game.Tiles) > limit {
		return errors.New("Too many Tiles - try a smaller board, or increase the grid size. Higher Ranks can use a bigger board.")
	}

	tx, _ := DB.Begin()
	defer tx.AutoRollback()

	checkObjectives := (len(data.Game.Objectives) > 0)
	println("objectives", checkObjectives)

	// Update the game header with the table geometry
	_, err := DB.SQL(`update game set table_x=$2,table_y=$3,grid_size=$4,check_table=$5,check_objectives=$6 where id=$1`,
		data.ID, data.Game.TableX, data.Game.TableY, data.Game.GridSize, true, checkObjectives).
		Exec()

	if err == nil {
		// Zap and re-write the tiles
		_, err = DB.SQL(`delete from tiles where game_id=$1`, data.ID).Exec()
		if err == nil {
			for _, v := range data.Game.Tiles {
				_, err = DB.SQL(`insert into tiles (game_id,i,height,content,owner)
				values ($1,$2,$3,$4,$5)`, data.ID, v.I, v.Height, v.Content, v.Owner).Exec()
				if err != nil {
					println(err.Error())
					break
				}
			}

			// Zap and re-write the objective markers
			_, err := DB.SQL(`delete from game_objective where game_id=$1`, data.ID).Exec()
			if err == nil {
				for _, v := range data.Game.Objectives {
					_, err = DB.SQL(`insert
						into game_objective
						(game_id,name,x,y,vp_per_turn,red_vp,blue_vp,current_owner)
						values ($1,$2,$3,$4,$5,$6,$7,$8)`,
						data.ID, v.Name, v.X, v.Y, v.VPPerTurn, v.RedVP, v.BlueVP, v.CurrentOwner).
						Exec()
					if err != nil {
						println(err.Error())
						break
					}
				}
			}

			// Stamp the XY coords for all Red commands
			if err == nil {
				for _, v := range data.Game.RedCmd {
					if v.StartX != -1 && v.StartY != -1 {
						_, err = DB.SQL(`update game_cmd
							set start_x=$3,start_y=$4
							where game_id=$1 and id=$2 and red_team`, data.ID, v.ID, v.StartX, v.StartY).Exec()
					}
					if err != nil {
						println(err.Error())
						break
					}

				}
			}

			// Stamp the XY coords for all Blue commands
			if err == nil {
				for _, v := range data.Game.BlueCmd {
					if v.StartX != -1 && v.StartY != -1 {
						_, err = DB.SQL(`update game_cmd
							set start_x=$3,start_y=$4
							where game_id=$1 and id=$2 and blue_team`, data.ID, v.ID, v.StartX, v.StartY).Exec()
					}
					if err != nil {
						println(err.Error())
						break
					}

				}
			}

		}
	}

	logger(start, "Game.SaveTiles", conn,
		fmt.Sprintf("Game ID %d", data.ID),
		fmt.Sprintf("%d Tiles", len(data.Game.Tiles)))

	if err == nil {
		*done = true
		tx.Commit()
	}
	return err
}

func IntSliceContains(s []int, e int) bool {
	for _, a := range s {
		if a == e {
			return true
		}
	}
	return false
}

func (g *GameRPC) UpdateTeams(data shared.GameRPCData, done *bool) error {
	start := time.Now()
	*done = false
	conn := Connections.Get(data.Channel)
	if conn.UserID != data.Game.HostedBy {
		return errors.New("Incorrect owner of game")
	}

	err := error(nil)
	tx, _ := DB.Begin()
	defer tx.AutoRollback()

	count := 0
	unassignedCmd := false

	// Clear out the invites
	DList := []int{}
	RedList := []int{}
	BlueList := []int{}
	DB.SQL(`select player_id from game_players where game_id=$1`, data.ID).QuerySlice(&DList)
	_, err = DB.SQL(`delete from game_players where game_id=$1`, data.ID).Exec()

	// For each command Red and Blue
	for _, v := range data.Game.RedCmd {
		if err != nil {
			break
		}
		if !v.Cull && v.PlayerID == 0 {
			unassignedCmd = true
			println("cmd is unassigned", v.ID)
		}
		_, err = DB.SQL(`update game_cmd set cull=$2,start_turn=$3,player_id=$4,start_x=$5,start_y=$6 where id=$1`,
			v.ID, v.Cull, v.StartTurn, v.PlayerID, v.StartX, v.StartY).Exec()
		if err != nil {
			unassignedCmd = true
			println(err.Error())
		}
		// Create the game invite
		if v.PlayerID != 0 {
			if !IntSliceContains(RedList, v.PlayerID) {
				RedList = append(RedList, v.PlayerID)
			}
		}

		// For each unit, stamp the unit details
		for _, u := range v.Units {
			_, err := DB.SQL(`update unit
				set condition=$2,bayonets_lost=$3,sabres_lost=$4,guns_lost=$5
				where id=$1`, u.ID, u.Condition, u.BayonetsLost, u.SabresLost, u.GunsLost).
				Exec()
			if err != nil {
				println(err.Error())
				break
			} else {
				count++
			}
		}
	}

	for _, v := range data.Game.BlueCmd {
		if err != nil {
			break
		}
		if !v.Cull && v.PlayerID == 0 {
			unassignedCmd = true
			println("blue cmd is unassigned", v.ID)
		}
		_, err = DB.SQL(`update game_cmd set cull=$2,start_turn=$3,player_id=$4,start_x=$5,start_y=$6 where id=$1`,
			v.ID, v.Cull, v.StartTurn, v.PlayerID, v.StartX, v.StartY).Exec()
		if err != nil {
			println(err.Error())
			unassignedCmd = true
		}
		// Create the game invite
		if v.PlayerID != 0 {
			if !IntSliceContains(BlueList, v.PlayerID) {
				BlueList = append(BlueList, v.PlayerID)
			}

		}

		// For each unit, stamp the unit details
		for _, u := range v.Units {
			_, err := DB.SQL(`update unit
				set condition=$2,bayonets_lost=$3,sabres_lost=$4,guns_lost=$5
				where id=$1`, u.ID, u.Condition, u.BayonetsLost, u.SabresLost, u.GunsLost).
				Exec()
			if err != nil {
				println(err.Error())
				break
			} else {
				count++
			}
		}
	}

	if err == nil {
		// De-Invite those not invited
		AList := append(RedList, BlueList...)
		fmt.Printf("AList is now %v\nRedList %v\nBlueList %v\nDList %v\n", AList, RedList, BlueList, DList)
		for _, v := range DList {
			if IntSliceContains(AList, v) {
				println("player is in the AList", v)
			} else {
				println("player is in the DList", v)
				conn.BroadcastPlayer(v, "Game", "Invite", data.ID)
			}
		}
		for _, v := range RedList {
			_, err = DB.SQL(`insert into game_players
				(game_id,player_id,red_team)
				values ($1,$2,true)`, data.ID, v).Exec()
			if err != nil {
				println(err.Error())
				break
			}
			conn.BroadcastPlayer(v, "Game", "Invite", data.ID)
		}
		if err == nil {
			for _, v := range BlueList {
				println("blue", v)
				// If they are already in RedList, then just update the record
				if IntSliceContains(RedList, v) {
					_, err = DB.SQL(`update game_players set blue_team=true where game_id=$1 and player_id=$2 and red_team`,
						data.ID, v).Exec()
				} else {
					_, err = DB.SQL(`insert into game_players
				(game_id,player_id,blue_team)
				values ($1,$2,true)`, data.ID, v).Exec()
				}
				if err != nil {
					println(err.Error())
					break
				}
				conn.BroadcastPlayer(v, "Game", "Invite", data.ID)
			}
		}

		if err == nil {
			println("unassigned", unassignedCmd)
			DB.SQL(`update game set check_forces='t',check_players=$2 where id=$1`, data.ID, !unassignedCmd).Exec()
			*done = true
			tx.Commit()
		}
	}

	logger(start, "Game.UpdateTeams", conn,
		fmt.Sprintf("Game ID %d", data.ID),
		fmt.Sprintf("%d Updated Units, %d Red Cmds, %d Blue Cmds",
			count, len(data.Game.RedCmd), len(data.Game.BlueCmd)))

	return err
}

func (g *GameRPC) Delete(data shared.GameRPCData, done *bool) error {
	start := time.Now()

	*done = false
	conn := Connections.Get(data.Channel)

	// check that we own the game first
	oldGame := shared.Game{}
	DB.SQL(`select * from game where id=$1`, data.ID).QueryStruct(&oldGame)
	if conn.Rank < 9 && oldGame.HostedBy != conn.UserID {
		return errors.New("You are not the owner of this game - cannot delete")
	}

	tx, _ := DB.Begin()
	defer tx.AutoRollback()

	// Get a list of the players who need to be informed of this tragic news
	DList := []int{}
	DB.SQL(`select player_id from game_players where game_id=$1`, data.ID).QuerySlice(&DList)

	_, err := DB.SQL(`delete from game where id=$1`, data.ID).Exec()
	if err == nil {
		DB.SQL(`delete from tiles where game_id=$1`, data.ID).Exec()
		DB.SQL(`delete from game_players where game_id=$1`, data.ID).Exec()
		DB.SQL(`delete from game_cmd where game_id=$1`, data.ID).Exec()
		DB.SQL(`delete from game_cmd_order where game_id=$1`, data.ID).Exec()
		DB.SQL(`delete from game_objective where game_id=$1`, data.ID).Exec()
		DB.SQL(`delete from unit where game_id=$1`, data.ID).Exec()

		for _, v := range DList {
			conn.BroadcastPlayer(v, "Game", "Invite", data.ID)
		}
	}

	logger(start, "Game.Delete", conn,
		fmt.Sprintf("%d", data.ID), "")

	if err == nil {
		*done = true
		tx.Commit()
	}

	return err
}

func (g *GameRPC) Update(data shared.GameRPCData, done *bool) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	*done = false

	// check that we own the game first
	oldGame := shared.Game{}
	DB.SQL(`select * from game where id=$1`, data.ID).QueryStruct(&oldGame)
	if conn.Rank < 9 && oldGame.HostedBy != conn.UserID {
		return errors.New("You are not the owner of this game - cannot delete")
	}

	_, err := DB.Update("game").
		SetWhitelist(data.Game, "start_date", "expires", "turn", "turn_limit", "name", "descr", "notes", "year").
		Where("id = $1", data.ID).
		Exec()

	logger(start, "Game.Update", conn,
		fmt.Sprintf("ID %d", data.ID), "")

	if err == nil {
		*done = true
		// For any players on this game list, let them know its changed
		players := []int{}
		DB.SQL(`select player_id from game_players where game_id=$1`, data.ID).QuerySlice(&players)
		fmt.Printf("players who need to know about this update %v\n", players)
		for _, v := range players {
			conn.BroadcastPlayer(v, "Game", "Update", data.ID)
		}
	}

	return err
}

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
		where g.hosted_by != $1
			and g.id in (select game_id from game_players where player_id=$1)`, conn.UserID).QueryStructs(retval)

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
			DB.SQL(`select * from game_cmd where game_id=$1 and red_team order by name`, data.ID).QueryStructs(&retval.RedCmd)
		}
		if data.Blue {
			DB.SQL(`select * from game_cmd where game_id=$1 and blue_team order by name`, data.ID).QueryStructs(&retval.BlueCmd)
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

func (g *GameRPC) SaveTiles(data shared.GameRPCData, done *bool) error {
	start := time.Now()

	if len(data.Game.Tiles) > 240 {
		return errors.New("Too many Tiles - try a smaller board, or increase the grid size.")
	}

	*done = false
	conn := Connections.Get(data.Channel)
	if conn.UserID != data.Game.HostedBy {
		return errors.New("Incorrect owner of game")
	}

	tx, _ := DB.Begin()
	defer tx.AutoRollback()

	_, err := DB.SQL(`update game set table_x=$2,table_y=$3,grid_size=$4,check_table=$5 where id=$1`,
		data.ID, data.Game.TableX, data.Game.TableY, data.Game.GridSize, true).
		Exec()
	if err == nil {
		_, err = DB.SQL(`delete from tiles where game_id=$1`, data.ID).Exec()
		if err == nil {
			for _, v := range data.Game.Tiles {
				_, err := DB.SQL(`insert into tiles (game_id,i,height,content,owner)
				values ($1,$2,$3,$4,$5)`, data.ID, v.I, v.Height, v.Content, v.Owner).Exec()
				if err != nil {
					println(err.Error())
					break
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

	_, err := DB.SQL(`delete from game where id=$1`, data.ID).Exec()
	if err == nil {
		DB.SQL(`delete from tiles where game_id=$1`, data.ID).Exec()
		DB.SQL(`delete from game_players where game_id=$1`, data.ID).Exec()
		DB.SQL(`delete from game_cmd where game_id=$1`, data.ID).Exec()
		DB.SQL(`delete from game_cmd_order where game_id=$1`, data.ID).Exec()
		DB.SQL(`delete from game_objective where game_id=$1`, data.ID).Exec()
		DB.SQL(`delete from unit where game_id=$1`, data.ID).Exec()
	}

	logger(start, "Game.Delete", conn,
		fmt.Sprintf("%d", data.ID), "")

	if err == nil {
		*done = true
		tx.Commit()
	}

	return err
}

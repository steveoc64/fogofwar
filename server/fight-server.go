package main

import (
	"errors"
	"fmt"
	"time"

	"../shared"
)

func (g *GameRPC) NewFight(data shared.FightData, done *bool) error {
	start := time.Now()

	*done = false
	conn := Connections.Get(data.Channel)
	c := 0
	DB.SQL(`select count(*) from fight where game_id=$1`, data.Fight.GameID).QueryScalar(&c)

	if data.Fight.Name == "" {
		// Generate a Name
		data.Fight.Name = fmt.Sprintf("Fight %d", c+1)
	}

	id := 0
	err := DB.SQL(`insert into fight 
		(game_id,name,rough,woods,built,fort)
		values ($1,$2,$3,$4,$5,$6) returning id`,
		data.Fight.GameID,
		data.Fight.Name,
		data.Fight.Rough,
		data.Fight.Woods,
		data.Fight.Built,
		data.Fight.Fort).QueryScalar(&id)
	data.Fight.ID = id

	if err == nil {
		// Send message to the play-goroutine to add this bombard to the list
		if play, ok := Plays[data.Fight.GameID]; ok {
			play <- PlayMessage{
				Game:     data.Fight.GameID,
				PlayerID: conn.UserID,
				OpCode:   FightAdd,
				Data:     data.Fight,
			}
		} else {
			err = errors.New("Invalid Game ID")
		}
	}

	logger(start, "Game.NewFight", conn,
		fmt.Sprintf("Game %d, %v", data.Fight.GameID, *data.Fight), "")

	if err == nil {
		*done = true
	}

	return err
}

func (g *GameRPC) GetFights(data shared.GameRPCData, retval *[]shared.Fight) error {
	start := time.Now()
	print("in get fights")

	conn := Connections.Get(data.Channel)

	cmds := []*shared.GameCmd{}
	DB.SQL(`select * from game_cmd where game_id=$1`, data.ID).QueryStructs(&cmds)

	err := DB.SQL(`select * from fight where game_id=$1`, data.ID).QueryStructs(retval)

	isRed := func(unit *shared.Unit) bool {
		for _, v := range cmds {
			if v.ID == unit.CmdID {
				return v.RedTeam
			}
		}
		return false
	}

	for i, v := range *retval {
		// Get the red units involved
		ids := []int{}
		reds := []*shared.Unit{}
		blues := []*shared.Unit{}
		DB.SQL(`select unit_id from fight_unit where game_id=$1 and id=$2`, data.ID, v.ID).QuerySlice(&ids)
		for _, uid := range ids {
			unit := &shared.Unit{}
			DB.SQL(`select * from unit where id=$1`, uid).QueryStruct(unit)
			if isRed(unit) {
				reds = append(reds, unit)
			} else {
				blues = append(blues, unit)
			}
		}
		(*retval)[i].Red = reds
		(*retval)[i].Blue = blues
	}

	logger(start, "Game.GetFights", conn,
		fmt.Sprintf("Game ID %d", data.ID),
		fmt.Sprintf("%d fights", len(*retval)))

	return err
}

func (g *GameRPC) CommitToFight(data shared.FightData, done *bool) error {
	start := time.Now()

	*done = false
	conn := Connections.Get(data.Channel)

	_, err := DB.SQL(`delete from fight_unit where id=$1 and unit_id=$2`, data.ID, data.DivID).Exec()
	if err == nil {
		_, err = DB.SQL(`insert into fight_unit (id,game_id,unit_id) values ($1,$2,$3)`,
			data.ID, data.GameID, data.DivID).Exec()
	}

	if err == nil {
		// Send message to the play-goroutine to add this bombard to the list
		if play, ok := Plays[data.GameID]; ok {
			play <- PlayMessage{
				Game:     data.GameID,
				PlayerID: conn.UserID,
				OpCode:   FightCommit,
				Data:     &data,
			}
		} else {
			err = errors.New("Invalid Game ID")
		}
	}

	logger(start, "Game.CommitToFight", conn,
		fmt.Sprintf("Game %d Fight %d Unit %d", data.GameID, data.ID, data.DivID), "")

	if err == nil {
		*done = true
	}

	return err
}

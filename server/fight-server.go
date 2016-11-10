package main

import (
	"fmt"
	"time"

	"../shared"
)

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

	for _, v := range *retval {
		// Get the red units involved
		ids := []int{}
		reds := []*shared.Unit{}
		blues := []*shared.Unit{}
		unit := &shared.Unit{}
		DB.SQL(`select unit_id from fight_unit where game_id=$1 and id=$2`, data.ID, v.ID).QuerySlice(&ids)
		for _, uid := range ids {
			DB.SQL(`select * from unit where id=$1`, uid).QueryStruct(unit)
			if isRed(unit) {
				reds = append(reds, unit)
			} else {
				blues = append(blues, unit)
			}
		}
		v.Red = reds
		v.Blue = blues
	}

	logger(start, "Game.GetFights", conn,
		fmt.Sprintf("ID %d", data.ID),
		fmt.Sprintf("%d fights", len(*retval)))

	return err
}

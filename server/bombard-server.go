package main

import (
	"errors"
	"fmt"
	"time"

	"../shared"
)

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

func (g *GameRPC) CancelShot(data shared.BombardData, done *bool) error {
	start := time.Now()

	*done = false
	conn := Connections.Get(data.Channel)

	_, err := DB.SQL(`delete from bombard where id=$1`, data.ID).Exec()
	// Send message to the play-goroutine to add this bombard to the list
	if err == nil {
		if play, ok := Plays[data.GameID]; ok {
			play <- PlayMessage{
				Game:     data.GameID,
				PlayerID: conn.UserID,
				OpCode:   BombardCancel,
				Data:     data.Bombard,
			}
		} else {
			err = errors.New("Invalid Game ID")
		}
	}

	logger(start, "Game.CancelShot", conn,
		fmt.Sprintf("Game %d ID %d", data.GameID, data.ID), "")

	if err == nil {
		*done = true
	}

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

func (g *GameRPC) ComputeBombard(data shared.BombardData, done *bool) error {
	start := time.Now()

	*done = false

	conn := Connections.Get(data.Channel)

	bb := &shared.Bombard{}
	err := DB.SQL(`select * from bombard where id=$1`, data.ID).QueryStruct(bb)

	logger(start, "Game.ComputeBombard", conn,
		fmt.Sprintf("Game %d ID %d", data.GameID, data.ID),
		fmt.Sprintf("%v", *bb))

	if err == nil {
		*done = true
	}
	return err
}

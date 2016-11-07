package main

import (
	"errors"
	"fmt"
	"math/rand"
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

	target := &shared.Unit{}
	firer := &shared.Unit{}
	bb := &shared.Bombard{}
	pts := 0

	subUnits := []shared.Unit{}

	err := DB.SQL(`select * from unit where id=$1`, data.Bombard.TargetUID).QueryStruct(target)
	if err != nil {
		println(err.Error())
	} else {
		DB.SQL(`select * from unit where path <@ $1 and game_id=$2 and cmd_id=$3`,
			target.Path,
			target.GameID,
			target.CmdID).QueryStructs(&subUnits)
		println("Main target formation is ", target.Path)
		err = DB.SQL(`select * from bombard where id=$1`, data.ID).QueryStruct(bb)
		// fmt.Printf("bb %d %v\n", data.ID, *bb)
		if err != nil {
			println(err.Error())
		} else {

			err = DB.SQL(`select * from unit where id=$1`, bb.UnitID).QueryStruct(firer)
			if err != nil {
				println(err.Error())
			}
			guns := 0
			gtype := 0
			err = DB.SQL(`select guns,gunnery_type from unit where id=$1`, bb.UnitID).QueryScalar(&guns, &gtype)

			// Take 1 shot at the min range, and 2 shots at the max range
			pts = gunShotGood(guns, gtype, bb.RangeMin)
			pts += gunShotGood(guns, gtype, bb.RangeMax)
			pts += gunShotGood(guns, gtype, bb.RangeMax)
			println("total damage points", pts)

			// pick a random victim
			victim := subUnits[rand.Intn(len(subUnits))]
			println("Actual Victim that takes the hit:", victim.Path, victim.ID, victim.UType, victim.Name, victim.Path)
			println("Regular troops in 3 ranks damage =", victim.PtsToMen(pts, 3, false, false))
			println("If in column damage =", victim.PtsToMen(pts, 3, true, false))
			println("If in skirmish order damage =", victim.PtsToMen(pts, 3, false, true))
			println("If in 2 ranks damage =", victim.PtsToMen(pts, 2, false, false))
		}
	}

	logger(start, "Game.ComputeBombard", conn,
		fmt.Sprintf("Game %d ID %d", data.GameID, data.ID),
		fmt.Sprintf("%d Pts damage", pts))

	if err == nil {
		*done = true
	}
	return err
}

type GunTables struct {
	GunneryType int
	Name        string
	MaxRange    int
	Effect      [][]int
}

func gunShotGood(guns int, gtype int, r int) int {
	if guns < 1 {
		return 0
	}
	if gtype < 1 || gtype > 5 {
		return 0
	}
	if r < 1 || r > 5 {
		return 0
	}
	mult := float64(guns) / 8.0
	die := rand.Intn(6)
	table := shotGoodEffect[gtype-1]
	effects := table.Effect[r-1]
	return int(float64(effects[die]) * mult)
}

var shotGoodEffect = []GunTables{
	{1, "12lb", 5, [][]int{
		{20, 13, 8, 13, 13, 8},
		{14, 10, 5, 9, 9, 5},
		{7, 5, 5, 3, 3, 3},
		{7, 5, 5, 3, 3, 3},
		{4, 3, 2, 3, 3, 2}}},
	{2, "9lb", 5, [][]int{
		{15, 11, 7, 14, 13, 9},
		{10, 8, 5, 11, 9, 6},
		{5, 3, 3, 4, 4, 2},
		{4, 3, 2, 7, 3, 2},
		{0, 1, 0, 0, 2, 0}}},
	{3, "6lb", 4, [][]int{
		{12, 10, 6, 16, 12, 10},
		{8, 7, 4, 11, 8, 7},
		{3, 2, 2, 5, 3, 2},
		{4, 3, 2, 6, 3, 2},
		{0, 0, 0, 0, 0, 0}}},
	{4, "Light", 3, [][]int{
		{8, 5, 4, 9, 8, 6},
		{3, 2, 2, 5, 3, 2},
		{2, 1, 0, 1, 2, 0},
		{0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0}}},
	{5, "Howitzer", 4, [][]int{
		{8, 5, 5, 6, 3, 6},
		{8, 5, 5, 6, 3, 6},
		{6, 4, 4, 5, 2, 5},
		{3, 2, 2, 2, 1, 2},
		{0, 0, 0, 0, 0, 0}}},
}

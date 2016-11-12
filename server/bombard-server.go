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
		if guns < 9 {
			str = fmt.Sprintf("a Bty of %s", gtype)
		} else {
			str = fmt.Sprintf("Massed Btys of %s", gtype)
		}
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
	targetCorps := &shared.GameCmd{}
	firer := &shared.Unit{}
	bb := &shared.Bombard{}
	pts := 0

	subUnits := []*shared.Unit{}

	err := DB.SQL(`select * from unit where id=$1`, data.Bombard.TargetUID).QueryStruct(target)
	DB.SQL(`select * from game_cmd where id=$1`, target.CmdID).QueryStruct(targetCorps)
	// println("Target Corps", targetCorps.Name, targetCorps.CState)
	if err != nil {
		println(err.Error())
	} else {
		err = DB.SQL(`select * from bombard where id=$1`, data.ID).QueryStruct(bb)
		// fmt.Printf("bb %d %v\n", data.ID, *bb)
		if err != nil {
			println(err.Error())
		} else {

			err = DB.SQL(`select * from unit where id=$1`, bb.UnitID).QueryStruct(firer)
			if err != nil {
				println(err.Error())
			}

			// Update the firer
			firer.Ammo--
			if firer.Ammo < 1 {
				firer.Ammo = 0
			}
			DB.SQL(`update unit set ammo=$2,guns_fired=true where id=$1`, firer.ID, firer.Ammo).Exec()
			Connections.BroadcastPlayer(bb.FirerID, "Play", &shared.NetData{
				Action: "Unit",
				ID:     firer.ID,
				Opcode: shared.UnitEventFired,
				Unit: &shared.UnitEvent{
					ID:          firer.ID,
					Description: "Fired",
					Ammo:        firer.Ammo,
					GunsFired:   true,
				},
			})

			guns := 0
			gtype := 0
			err = DB.SQL(`select guns,gunnery_type from unit where id=$1`, bb.UnitID).QueryScalar(&guns, &gtype)
			DB.SQL(`select * from unit where path <@ $1 and game_id=$2 and cmd_id=$3`,
				target.Path,
				target.GameID,
				target.CmdID).QueryStructs(&subUnits)

			// compute weighted chances of hitting
			prospects := []int{}
			for ii, v := range subUnits {
				i := 1
				if v.UType != shared.UnitDiv {
					switch v.Role {
					case shared.RoleReserve:
						i = 1
					case shared.RoleAdvance:
						i = 5
					case shared.Role1:
						i = 3
					case shared.Role2, shared.RoleLeft, shared.RoleRight:
						i = 2
					}
				}
				for j := 0; j < i; j++ {
					prospects = append(prospects, ii)
				}
			}

			// Take 1 shot at the min range, and 2 shots at the max range
			inColumn := targetCorps.CState == shared.CmdMarchOrder
			fmt.Printf("Target in march order %v\n", inColumn)

			victim := subUnits[prospects[rand.Intn(len(prospects))]]
			pts = gunShot(guns, gtype, bb.RangeMin, true)
			event := applyGunDamage(victim, targetCorps, pts)
			Connections.BroadcastPlayer(bb.TargetID, "Play", &shared.NetData{
				Action: "Unit",
				ID:     victim.ID,
				Opcode: shared.UnitEventHits,
				Unit:   &event,
			})

			victim = subUnits[prospects[rand.Intn(len(prospects))]]
			pts = gunShot(guns, gtype, bb.RangeMax, true)
			event = applyGunDamage(victim, targetCorps, pts)
			Connections.BroadcastPlayer(bb.TargetID, "Play", &shared.NetData{
				Action: "Unit",
				ID:     victim.ID,
				Opcode: shared.UnitEventHits,
				Unit:   &event,
			})

			victim = subUnits[prospects[rand.Intn(len(prospects))]]
			pts = gunShot(guns, gtype, bb.RangeMax, true)
			event = applyGunDamage(victim, targetCorps, pts)
			Connections.BroadcastPlayer(bb.TargetID, "Play", &shared.NetData{
				Action: "Unit",
				ID:     victim.ID,
				Opcode: shared.UnitEventHits,
				Unit:   &event,
			})

			if play, ok := Plays[data.GameID]; ok {
				play <- PlayMessage{
					Game:     data.GameID,
					PlayerID: conn.UserID,
					OpCode:   BombardDone,
					Data:     bb,
				}
			} else {
				err = errors.New("Invalid Game ID")
			}
			// pick a random victim
			// println("Actual Victim that takes the hit:", victim.Path, victim.ID, victim.UType, victim.Name, victim.Path)
			// println("Regular troops in 3 ranks damage =", victim.PtsToMen(pts, 3, false, false))
			// println("If in column damage =", victim.PtsToMen(pts, 3, true, false))
			// println("If in skirmish order damage =", victim.PtsToMen(pts, 3, false, true))
			// println("If in 2 ranks damage =", victim.PtsToMen(pts, 2, false, false))
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

func applyGunDamage(unit *shared.Unit, cmd *shared.GameCmd, pts int) shared.UnitEvent {

	inColumn := cmd.CState == shared.CmdMarchOrder

	m, c, g, s := unit.PtsToMen(pts, 3, inColumn, false)
	println("Gun Damage ", unit.Name, s, "Men=", m, "Guns=", g, "Cmd=", c)

	switch unit.UType {
	case shared.UnitDiv:
		unit.CommanderControl--
		if c > 0 {
			unit.CommanderControl = 1
		}
		if unit.CommanderControl < 1 {
			unit.CommanderControl = 1
		}
	case shared.UnitBde, shared.UnitSpecial:
		unit.BayonetsLost += m
		if unit.BayonetsLost > unit.Bayonets {
			unit.BayonetsLost = unit.Bayonets
		}
	case shared.UnitCav:
		unit.SabresLost += m
		if unit.SabresLost > unit.Sabres {
			unit.SabresLost = unit.Sabres
		}
	case shared.UnitGun:
		unit.GunsLost += g
		if unit.GunsLost > unit.Guns {
			unit.GunsLost = unit.Guns
		}
	}

	DB.SQL(`update unit set
		bayonets_lost=$2,
		sabres_lost=$3,
		guns_lost=$4,
		commander_control=$5
		where id=$1`,
		unit.ID,
		unit.BayonetsLost, unit.SabresLost, unit.GunsLost,
		unit.CommanderControl).Exec()

	return shared.UnitEvent{
		ID:               unit.ID,
		Description:      s,
		CommanderControl: unit.CommanderControl,
		BayonetsLost:     unit.BayonetsLost,
		SabresLost:       unit.SabresLost,
		GunsLost:         unit.GunsLost,
		MState:           unit.MState,
	}
}

type GunTables struct {
	GunneryType int
	Name        string
	MaxRange    int
	Effect      [][]int
}

func gunShot(guns int, gtype int, r int, good bool) int {
	println("calc shot", guns, gtype, r, good)
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
	if !good {
		table = shotBadEffect[gtype-1]
	}
	effects := table.Effect[r-1]
	println("gunfactors", mult, die)
	println("e", effects[die])
	println("ee", float64(effects[die]))
	println("eee", float64(effects[die])*mult)
	println("e2", int(float64(effects[die])*mult))
	return int(float64(effects[die]) * mult)
}

func cannisterShot(guns int, gtype int, r int, good bool) int {
	println("calc cannister", guns, gtype, r, good)
	if guns < 1 {
		return 0
	}
	if gtype < 1 || gtype > 5 {
		return 0
	}
	if r < 1 || r > 3 {
		return 0
	}
	mult := float64(guns) / 8.0
	die := rand.Intn(6)
	table := cannisterGoodEffect[gtype-1]
	if !good {
		table = cannisterBadEffect[gtype-1]
	}
	effects := table.Effect[r-1]
	println("factors", mult, die)
	println("e", effects[die])
	println("ee", float64(effects[die]))
	println("eee", float64(effects[die])*mult)
	println("e2", int(float64(effects[die])*mult))
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

var shotBadEffect = []GunTables{
	{1, "12lb", 5, [][]int{
		{7, 7, 4, 7, 7, 4},
		{5, 5, 3, 5, 5, 3},
		{2, 2, 2, 2, 2, 2},
		{2, 2, 2, 2, 2, 2},
		{1, 1, 1, 1, 1, 1}}},
	{2, "9lb", 5, [][]int{
		{6, 6, 8, 5, 3, 3},
		{3, 4, 5, 3, 2, 2},
		{1, 2, 2, 1, 1, 1},
		{2, 2, 3, 2, 1, 1},
		{0, 0, 0, 0, 0, 0}}},
	{3, "6lb", 4, [][]int{
		{5, 6, 8, 5, 3, 3},
		{3, 4, 5, 3, 2, 2},
		{1, 2, 2, 1, 1, 1},
		{2, 2, 3, 2, 1, 1},
		{0, 0, 0, 0, 0, 0}}},
	{4, "Light", 3, [][]int{
		{1, 2, 2, 1, 1, 1},
		{2, 2, 3, 2, 1, 1},
		{0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0}}},
	{5, "Howitzer", 4, [][]int{
		{2, 3, 2, 3, 5, 3},
		{2, 3, 2, 3, 5, 3},
		{1, 2, 1, 2, 4, 2},
		{0, 1, 0, 1, 2, 1},
		{0, 0, 0, 0, 0, 0}}},
}

var cannisterGoodEffect = []GunTables{
	{1, "12lb", 5, [][]int{
		{40, 30, 15, 26, 26, 15},
		{27, 20, 10, 16, 17, 10},
		{21, 16, 8, 14, 14, 8}}},
	{2, "9lb", 5, [][]int{
		{24, 20, 12, 32, 24, 20},
		{18, 13, 8, 21, 16, 13},
		{12, 10, 6, 16, 12, 10}}},
	{3, "6lb", 4, [][]int{
		{24, 20, 12, 32, 24, 20},
		{16, 13, 8, 21, 16, 13},
		{12, 10, 6, 16, 12, 10}}},
	{4, "Light", 3, [][]int{
		{16, 8, 6, 16, 19, 6},
		{10, 9, 4, 12, 6, 4},
		{0, 0, 0, 0, 0, 0}}},
	{5, "Howitzer", 4, [][]int{
		{11, 7, 7, 8, 5, 8},
		{11, 7, 7, 8, 5, 8},
		{8, 5, 5, 6, 3, 6}}},
}

var cannisterBadEffect = []GunTables{
	{1, "12lb", 5, [][]int{
		{9, 9, 7, 9, 9, 7},
		{6, 6, 5, 6, 5, 5},
		{4, 4, 4, 4, 4, 4}}},
	{2, "9lb", 5, [][]int{
		{5, 12, 8, 5, 4, 4},
		{3, 8, 5, 3, 3, 3},
		{3, 6, 4, 3, 2, 2}}},
	{3, "6lb", 4, [][]int{
		{5, 12, 8, 5, 4, 4},
		{3, 8, 5, 3, 3, 3},
		{3, 6, 4, 3, 2, 2}}},
	{4, "Light", 3, [][]int{
		{4, 8, 5, 3, 3, 1},
		{2, 4, 1, 1, 1, 2},
		{0, 0, 0, 0, 0, 0}}},
	{5, "Howitzer", 4, [][]int{
		{3, 4, 3, 5, 7, 4},
		{3, 4, 3, 5, 7, 4},
		{2, 3, 2, 3, 5, 3}}},
}

package main

import (
	"math/rand"

	"../shared"
)

func applyMusketDamage(unit *shared.Unit, pts int) shared.UnitEvent {

	inColumn := unit.InColumn()

	m, c, g, s := unit.PtsToMen(pts, 3, inColumn, false)
	println("Musket Damage ", unit.Name, s, "Men=", m, "Guns=", g, "Cmd=", c)

	switch unit.UType {
	case shared.UnitDiv:
		unit.CommanderControl--
		if c > 0 {
			unit.CommanderControl = 1
		}
	case shared.UnitBde, shared.UnitSpecial:
		unit.BayonetsLost += m
		unit.CommanderControl--
		if unit.BayonetsLost > unit.Bayonets {
			unit.BayonetsLost = unit.Bayonets
		}
	case shared.UnitCav:
		unit.SabresLost += m
		unit.CommanderControl--
		if unit.SabresLost > unit.Sabres {
			unit.SabresLost = unit.Sabres
		}
	case shared.UnitGun:
		unit.GunsLost += g
		unit.CommanderControl--
		if unit.GunsLost > unit.Guns {
			unit.GunsLost = unit.Guns
		}
	}
	if unit.CommanderControl < 2 {
		unit.CommanderControl = 2
	}

	// small chance of a morale hit
	if rand.Intn(6) == 0 {
		unit.MState++
	}

	DB.SQL(`update unit set
		bayonets_lost=$2,
		sabres_lost=$3,
		guns_lost=$4,
		commander_control=$5,
		mstate=$6
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

type MusketTables struct {
	MType  int
	Name   string
	Effect [][]int
}

func musketShot(unit *shared.Unit, r int, cover bool) int {
	println("musketshot", unit.ID, unit.Name, r, cover)
	mtype := 1

	fireBonus := 0
	DB.SQL(`select r.fire_bonus+c.effect 
		from unit u
		left join rating r on r.id=u.rating
		left join condition c on c.id=u.condition
		where u.id=$1`, unit.ID).QueryScalar(&fireBonus)
	println("firebonus", fireBonus)

	// TODO - adjust according to the type of unit firing
	if mtype < 1 || mtype > 3 {
		return 0
	}

	if r < 1 || r > 5 {
		return 0
	}

	mult := 1.0
	if unit.GunsFired {
		// local smoke effects
		mult = .6
	}
	// get below 50% condition, then things go south very quickly
	// if unit.Condition < 5 {
	// 	mult *= float64(unit.Condition)
	// 	mult /= 10.0
	// }
	die := rand.Intn(6)
	println("mult", mult, die)

	table := musketOpen[mtype-1]
	if cover {
		table = musketCover[mtype-1]
	}
	effects := table.Effect[r-1]
	v1 := int(float64(effects[die]) * mult)
	println("v1", v1)
	// best of 2
	if fireBonus > 0 {
		v2 := int(float64(effects[rand.Intn(6)]) * mult)
		if v1 > v2 {
			return v1
		}
		return v2
	}
	// worst of 2
	if fireBonus == -1 {
		v2 := int(float64(effects[rand.Intn(6)]) * mult)
		if v1 < v2 {
			return v1
		}
		return v2
	}
	// worst of 2
	if fireBonus < -1 {
		v2 := int(float64(effects[rand.Intn(6)]) * mult)
		v3 := int(float64(effects[rand.Intn(6)]) * mult)
		if v1 < v2 {
			if v1 < v3 {
				return v1
			}
			return v3
		} else {
			if v2 < v3 {
				return v2
			}
			return v3
		}
	}
	// else take it as it comes
	return v1
}

var musketOpen = []MusketTables{
	{1, "Half Battalion", [][]int{
		{15, 20, 30, 20, 40, 30},
		{8, 12, 20, 15, 30, 20},
		{4, 8, 15, 8, 20, 15},
		{2, 4, 8, 4, 10, 8},
		{0, 0, 0, 0, 0, 0}}},
	{2, "Skirmisher", [][]int{
		{12, 16, 25, 16, 30, 25},
		{6, 15, 16, 12, 20, 16},
		{3, 6, 12, 6, 15, 12},
		{1, 3, 6, 3, 8, 6},
		{0, 0, 0, 0, 0, 0}}},
	{3, "Jager", [][]int{
		{15, 20, 25, 20, 35, 25},
		{8, 12, 20, 15, 24, 20},
		{4, 8, 15, 8, 20, 15},
		{2, 4, 8, 4, 10, 8},
		{1, 2, 4, 2, 5, 4}}},
}

var musketCover = []MusketTables{
	{1, "Half Battalion", [][]int{
		{5, 7, 10, 7, 14, 10},
		{3, 5, 7, 5, 10, 7},
		{2, 3, 5, 3, 7, 5},
		{1, 2, 3, 2, 4, 3},
		{0, 0, 0, 0, 0, 0}}},
	{2, "Skirmisher", [][]int{
		{4, 3, 18, 5, 10, 8},
		{2, 4, 5, 4, 7, 5},
		{1, 2, 4, 2, 5, 4},
		{0, 1, 2, 1, 2, 2},
		{0, 0, 0, 0, 0, 0}}},
	{3, "Jager", [][]int{
		{8, 10, 12, 10, 15, 12},
		{4, 8, 10, 8, 12, 10},
		{2, 4, 8, 4, 10, 8},
		{1, 2, 4, 2, 6, 4},
		{0, 1, 2, 1, 3, 2}}},
}

package main

import (
	"fmt"
	"time"

	"../shared"
)

func (g *GameRPC) FightHQAction(data shared.FightAction, retval *shared.FightOutcome) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	// get the DIV and the Game
	div := &shared.Unit{}
	err := DB.SQL(`select * from unit where id=$1`, data.UnitID).QueryStruct(div)
	pts := 0

	outcome := &shared.FightOutcome{}
	outcome.MapFromUnit(div)

	if err == nil {

		switch data.Opcode {
		case shared.TacticalAdvance:
			pts = 2
			outcome.Descr = "All units Advance ½ grid"
		case shared.TacticalStandGround:
			pts = 1
			outcome.Descr = "All units Halt and make a stand"
		case shared.TacticalSquare:
			pts = 2
			outcome.Descr = "All Infantry Units form Square"
		case shared.TacticalPassageOfLines:
			pts = 1
			outcome.Descr = "1st Line Replaced with 2nd Line"
		case shared.TacticalSKIn:
			pts = 0
			outcome.Descr = "All Skirmishers Recalled in"
		case shared.TacticalSKOut:
			pts = 1
			outcome.Descr = "All Skirmishers Deployed Out"
		case shared.TacticalCommitReserve:
			pts = 2
			outcome.Descr = "Reserve Force Committed to the 2nd Line"
		case shared.TacticalResup:
			pts = 1
			outcome.Descr = "Units in 1st line and 2nd line resupplied"
		case shared.TacticalWithdraw:
			pts = 2
			outcome.Descr = "Division Withdraws 1 grid"
		case shared.TacticalSurrender:
			outcome.Descr = "All remaining troops not in reserve Surrender"
		}

		if pts > 0 {
			div.CommanderControl -= pts
			if div.CommanderControl < 0 {
				div.CommanderControl = 0
			}
			DB.SQL(`update unit set commander_control=$2 where id=$1`, data.UnitID, div.CommanderControl).Exec()
			outcome.CommanderControl = div.CommanderControl
		}

		*retval = *outcome
	}

	logger(start, "Game.FightHQAction", conn,
		fmt.Sprintf("Game %d Opcode %d Unit %d Target %d", data.GameID, data.Opcode, data.UnitID, data.Target),
		fmt.Sprintf("Outcome"))

	return err
}

func (g *GameRPC) FightUnitAction(data shared.FightAction, retval *shared.FightOutcome) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	// get the DIV and the Game
	unit := &shared.Unit{}
	err := DB.SQL(`select * from unit where id=$1`, data.UnitID).QueryStruct(unit)
	pts := 0

	outcome := &shared.FightOutcome{}
	outcome.MapFromUnit(unit)

	if err == nil {

		switch unit.UType {
		case shared.UnitBde, shared.UnitSpecial:
			switch data.Opcode {
			case shared.TacticalAdvance:
				switch outcome.Role {
				case shared.RoleAdvance:
					pts = 2
					outcome.Descr = "Unit advances ½ grid ahead of the main line"
				case shared.Role1:
					pts = 1
					outcome.Descr = "All units in 1st and 2nd line advance ½ grid"
					outcome.Descr2 = "Supporting units and flanks keep pace"
				case shared.Role2:
					pts = 2
					outcome.Descr = "Unit advances into 1st Line"
					outcome.Role = shared.Role1
					DB.SQL(`update unit set role=$2 where id=$1`, unit.ID, outcome.Role).Exec()
				case shared.RoleLeft:
					pts = 1
					outcome.Descr = "Unit advances ½ grid, still covering flank"
				case shared.RoleRight:
					pts = 1
					outcome.Descr = "Unit advances ½ grid, still covering flank"
				case shared.RoleReserve:
					pts = 0
					outcome.Descr = "Unit already in reserve"
				}
			case shared.TacticalStandGround:
				pts = 1
				outcome.Descr = "Unit stands"
			case shared.TacticalSKIn:
				outcome.Descr = "Skirmishers pulled in"
				outcome.SKOut = false
				DB.SQL(`update unit set sk_out=false where id=$1`, unit.ID).Exec()
			case shared.TacticalSKOut:
				pts = 1
				outcome.Descr = "Deploy Skirmish Line Out"
				outcome.SKOut = true
				DB.SQL(`update unit set sk_out=true where id=$1`, unit.ID).Exec()
			case shared.TacticalFire:
				if outcome.Ammo > 1 {
					pts = 1
					outcome.Descr = "Unit Fires"
					outcome.Ammo--
					outcome.BayonetsFired = true
					DB.SQL(`update unit set bayonets_fired=true,ammo=$2 where id=$1`, unit.ID, outcome.Ammo).Exec()
				} else {
					pts = 1
					outcome.Descr = "Low Ammo, ineffective fire"
				}
			case shared.TacticalColdSteel:
				pts = 2
				outcome.Descr = "Unit advances to contact enemy within same grid"
				// TODO - must pass in complete contact info to resolve the fight
			case shared.TacticalForm:
				pts = 2
				outcome.Descr = "Unit Changes Formation"
				// TODO - must pass in info about formation to change into
			case shared.TacticalWheel:
				pts = 2
				outcome.Descr = "Unit Executes wheel within same grid"
				outcome.Descr2 = ".. up to 45deg angle"
			case shared.TacticalWithdraw:
				switch outcome.Role {
				case shared.RoleAdvance:
					pts = 3
					outcome.Descr = "Unit falls back up to 2 grids to reserve"
					outcome.Role = shared.RoleReserve
					DB.SQL(`update unit set role=$2 where id=$1`, unit.ID, outcome.Role).Exec()
				case shared.Role1:
					pts = 1
					outcome.Descr = "Unit falls back 1 grid to 2nd Line"
					outcome.Role = shared.Role2
					DB.SQL(`update unit set role=$2 where id=$1`, unit.ID, outcome.Role).Exec()
				case shared.Role2:
					pts = 1
					outcome.Descr = "Unit falls back 1 grid to reserve"
					outcome.Role = shared.RoleReserve
					DB.SQL(`update unit set role=$2 where id=$1`, unit.ID, outcome.Role).Exec()
				case shared.RoleLeft:
					pts = 2
					outcome.Descr = "Unit falls back, but still covers left flank"
				case shared.RoleRight:
					pts = 2
					outcome.Descr = "Unit falls back, but still covers right flank"
				case shared.RoleReserve:
					pts = 0
					outcome.Descr = "Unit already in reserve"
				}
			case shared.TacticalSurrender:
				outcome.Descr = "The End - Unit is Lost"

			}
		case shared.UnitCav:
			switch data.Opcode {
			case shared.TacticalCavCharge:
				if outcome.SabresCharged > 3 {
					outcome.Descr = "Cavalry is blown, and can no longer charge"
				} else {
					pts = 3
					outcome.Descr = "Cavalry Advance 1 grid, and announce Charge"
					outcome.Descr2 = ".. then move up to 2 grids to complete the charge"
					outcome.SabresCharged++
					DB.SQL(`update unit set sabres_charged=$2 where id=$1`, unit.ID, outcome.SabresCharged).Exec()
				}
			case shared.TacticalCavFeint:
				pts = 3
				outcome.Descr = "Cavalry Advance 1 grid, and announce Charge"
				outcome.Descr2 = "then .. will return to position after enemy reacts"
			case shared.TacticalCounterCavCharge:
				if outcome.SabresCharged > 3 {
					outcome.Descr = "Cavalry is blown, and can no longer charge"
				} else {
					pts = 2
					outcome.Descr = "Cavalry Advance 1 grid to counter incoming Charge"
					outcome.SabresCharged++
					DB.SQL(`update unit set sabres_charged=$2 where id=$1`, unit.ID, outcome.SabresCharged).Exec()
				}
			case shared.TacticalLeftFlank:
				pts = 1
				outcome.Descr = "Unit moves 1 grid to take a flank position"
			case shared.TacticalPursuit:
				if outcome.SabresCharged > 3 {
					outcome.Descr = "Cavalry is Blown, and can no longer pursue"
				} else {
					pts = 2
					outcome.Descr = "Unit pursuit up to 2 grids"
					outcome.SabresCharged++
					DB.SQL(`update unit set sabres_charged=$2 where id=$1`, unit.ID, outcome.SabresCharged).Exec()
				}
			case shared.TacticalTakeGuns:
				pts = 1
				outcome.Descr = "Cavalry can attack any within 1 grid"
				outcome.Descr2 = ".. otherwise Move 1 grid"
			case shared.TacticalWithdraw:
				pts = 1
				outcome.Descr = "Cavalry Retire up to 2 grids, back to reserve"
				outcome.Role = shared.RoleReserve
				DB.SQL(`update unit set role=$2 where id=$1`, unit.ID, outcome.Role).Exec()
			}
		case shared.UnitGun:
			switch data.Opcode {
			case shared.TacticalCannister:
				pts = 1
				outcome.Descr = "Fires Cannister"
			case shared.TacticalShot:
				pts = 1
				outcome.Descr = "Fires Roundshot"
			case shared.TacticalLimber:
				pts = 2
				outcome.Descr = "Guns Limber Up"
				outcome.GunsLimbered = true
				DB.SQL(`update unit set guns_limbered=true where id=$1`, unit.ID).Exec()
			case shared.TacticalDeployGuns:
				pts = 3
				outcome.Descr = "Guns Deployed"
				outcome.GunsLimbered = false
				DB.SQL(`update unit set guns_limbered=false where id=$1`, unit.ID).Exec()
			case shared.TacticalResup:
				pts = 1
				outcome.Ammo++
				outcome.Descr = "Resupply and Restock Ammo"
				DB.SQL(`update unit set ammo=$2 where id=$1`, unit.ID, outcome.Ammo).Exec()
			case shared.TacticalWithdraw:
				pts = 1
				outcome.Descr = "Unit Withdraws to Reserve"
				outcome.GunsLimbered = true
				outcome.Role = shared.RoleReserve
				DB.SQL(`update unit set gun_limbered=true, role=$2 where id=$1`, unit.ID, outcome.Role).Exec()
			}
		}

		if pts > 0 {
			unit.CommanderControl -= pts
			if unit.CommanderControl < 0 {
				unit.CommanderControl = 0
			}
			DB.SQL(`update unit set commander_control=$2 where id=$1`, data.UnitID, unit.CommanderControl).Exec()
			outcome.CommanderControl = unit.CommanderControl
		}

		*retval = *outcome
	}

	logger(start, "Game.FightHQAction", conn,
		fmt.Sprintf("Game %d Opcode %d Unit %d Target %d", data.GameID, data.Opcode, data.UnitID, data.Target),
		fmt.Sprintf("Outcome"))

	return err
}

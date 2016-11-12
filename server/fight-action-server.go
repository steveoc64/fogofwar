package main

import (
	"errors"
	"fmt"
	"math/rand"
	"time"

	"../shared"
)

var fnames = []string{"March Order", "Open Order", "Line", "Supporting Lines", "Mixed Order", "Attack Column", "Close Column", "Square", "Mob"}

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
			reserveID := 0
			reserveName := ""
			restype := 0
			DB.SQL(`select id,name,utype from unit where game_id=$1 and cmd_id=$2 and path <@ $3 and role=$4 and id != $5 limit 1`,
				data.GameID, div.CmdID, div.Path, shared.RoleReserve, div.ID).
				QueryScalar(&reserveID, &reserveName, &restype)
			if reserveID != 0 {
				pts = 2
				outcome.Descr = reserveName
				outcome.UnitID = reserveID
				outcome.Role = shared.Role2
				switch restype {
				case shared.UnitBde, shared.UnitSpecial:
					outcome.Descr2 = "Committed to the 2nd Line"
				case shared.UnitCav:
					if rand.Intn(1) == 0 {
						outcome.Descr2 = "Rushes to the Left Flank"
						outcome.Role = shared.RoleLeft
					} else {
						outcome.Descr2 = "Rushes to the Right Flank"
						outcome.Role = shared.RoleRight
					}
				case shared.UnitGun:
					outcome.Descr2 = "Rushes to the advance of the formation"
					outcome.Role = shared.RoleAdvance
				}
				DB.SQL(`update unit set role=$2 where id=$1`, reserveID, outcome.Role).Exec()
			} else {
				pts = 0
				outcome.Descr = "No Reserves Left to Commit"
			}
		case shared.TacticalResup:
			pts = 1
			outcome.Descr = "Units in 1st line and 2nd line resupplied"
		case shared.TacticalWithdraw:
			pts = 2
			outcome.Descr = "Division Moves back 1 grid"
			outcome.Descr2 = "and withdraws from the engagement"
			DB.SQL(`delete from fight_unit where unit_id=$1`, div.ID).Exec()
			// Tell the playroutine that this unit is no longer in the fight
			print("getplay", data.GameID)
			if play, ok := Plays[data.GameID]; ok {
				print("play")
				play <- PlayMessage{
					Game:   data.GameID,
					OpCode: FightWithdraw,
					Data: &shared.FightData{
						ID:    data.FightID,
						DivID: div.ID,
					},
				}
			} else {
				err = errors.New("Invalid Game ID")
			}

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

	drill := &shared.DrillType{}
	DB.SQL(`select * from drill where id=$1`, unit.Drill).QueryStruct(drill)
	// fmt.Printf("drill %v\n", drill)
	if err == nil {

		switch unit.UType {
		case shared.UnitBde, shared.UnitSpecial:
			switch data.Opcode {
			case shared.TacticalAdvance:
				if drill.Oblique {
					outcome.Descr2 = "+/- 1 Base Width to the Oblique"
				}
				switch outcome.Role {
				case shared.RoleAdvance:
					pts = 2
					if drill.Speed > 2 {
						pts = 1
					}
					outcome.Descr = "Unit advances ½ grid ahead of the main line"
				case shared.Role1:
					pts = 1
					if unit.Formation == shared.FormationOpenOrder {
						outcome.Descr = "Unit Advances to the head of the"
						outcome.Descr2 = "engagement in Open Order"
						outcome.Role = shared.RoleAdvance
						DB.SQL(`update unit set role=$2 where id=$1`, unit.ID, outcome.Role).Exec()
					} else {
						outcome.Descr = "All units in 1st and 2nd line advance ½ grid"
						if outcome.Descr2 == "" {
							outcome.Descr2 = "Supporting units and flanks keep pace"
						}
					}
				case shared.Role2:
					pts = 2
					if unit.Formation == shared.FormationOpenOrder {
						outcome.Descr = "Unit Advances to the head of the"
						outcome.Descr2 = "engagement in Open Order"
						outcome.Role = shared.RoleAdvance
						DB.SQL(`update unit set role=$2 where id=$1`, unit.ID, outcome.Role).Exec()
					} else {
						outcome.Descr = "Unit advances into 1st Line"
						outcome.Role = shared.Role1
						DB.SQL(`update unit set role=$2 where id=$1`, unit.ID, outcome.Role).Exec()
					}
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
				if outcome.Ammo < 2 {
					outcome.Descr = "Unit is very low on ammo"
					outcome.Descr2 = ".. ineffective fire"
				} else {
					pts = 1
					outcome.Descr = fmt.Sprintf("Aimed Volley Fire within %d00 paces", data.Range)
					if unit.BayonetsFired {
						outcome.Descr = "Sporadic fire blindly into the smoke"
					} else {
						if data.Terrain != 0 {
							outcome.Descr = "Fires Volley in the General Direction of the enemy"
						}
					}
					outcome.Ammo--
					outcome.BayonetsFired = true
					DB.SQL(`update unit set ammo=$2,bayonets_fired=true where id=$1`, unit.ID, outcome.Ammo).Exec()

					victim := &shared.Unit{}
					err = DB.SQL(`select * from unit where id=$1`, data.Target).QueryStruct(victim)
					if err == nil {
						println("terrain", data.Terrain)
						println("range", data.Range)
						println("bases", data.Bases)
						hitpoints := 0
						goodEffect := data.Terrain == 0
						for ii := 0; ii < data.Bases; ii++ {
							hitpoints += musketShot(unit, data.Range, !goodEffect)
						}
						if unit.Guns-unit.GunsLost > 0 {
							// has attached guns - throw them into the mix !!
							grange := 0
							if data.Range > 1 {
								grange = 1
							}
							println("Adding a dash of cannister from the Battalion guns at gun range", grange)
							hitpoints += cannisterShot(unit.Guns, unit.GunneryType, grange, goodEffect)
						}
						event := applyTacticalSmallArmsFire(victim, false, hitpoints)
						fmt.Printf("event %v\n", event)

						if !unit.BayonetsFired {
							outcome.Descr2 = fmt.Sprintf("%d points of damage", hitpoints)
							println("muskets do ", hitpoints)
							// event := applyTacticalGunShot(victim, false, pts)
							if hitpoints > 3 {
								eff := hitpoints / data.Bases
								if eff > 10 {
									if eff > 20 {
										outcome.Descr2 = ".. Massive Devastation"
									} else {
										outcome.Descr2 = ".. Most Effective"
									}
								} else {
									outcome.Descr2 = ".. Somewhat Effective"
								}
							} else {
								outcome.Descr2 = ".. Not overly Effective"
							}
						}
						// get player who owns the target unit, and let them know the bad news
						TargetPlayerID := 0
						DB.SQL(`select c.player_id from unit u left join game_cmd c on c.id=u.cmd_id where u.id=$1`,
							data.Target).QueryScalar(&TargetPlayerID)

						Connections.BroadcastPlayer(TargetPlayerID, "Play", &shared.NetData{
							Action: "Unit",
							ID:     victim.ID,
							Opcode: shared.UnitEventHits,
							Unit:   &event,
						})
					}
				}
			case shared.TacticalColdSteel:
				pts = 2
				outcome.Descr = "Unit advances to contact enemy within same grid"
				// TODO - must pass in complete contact info to resolve the fight
			case shared.TacticalForm:
				pts = 5 - drill.Speed
				outcome.Descr = "Unit Changes Formation"
				if data.Target >= 0 && data.Target < len(fnames) {
					outcome.Descr2 = "to " + fnames[data.Target]
				}
				outcome.Formation = data.Target
				DB.SQL(`update unit set formation=$2 where id=$1`, unit.ID, outcome.Formation).Exec()
			case shared.TacticalWheel:
				pts = 2
				outcome.Descr = "Unit Executes wheel within same grid"
				outcome.Descr2 = ".. up to 45deg angle"
			case shared.TacticalWithdraw:
				switch outcome.Role {
				case shared.RoleAdvance:
					pts = 3
					if drill.Speed > 2 {
						pts = 2
					}
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
			case shared.TacticalShot, shared.TacticalCannister:
				if outcome.Ammo < 2 {
					outcome.Descr = "Guns are out of Ammo .. no effective fire"
				} else {
					pts = 1
					shotter := "Round Shot"
					if data.Opcode == shared.TacticalCannister {
						shotter = "Cannister"
						outcome.Ammo--
					}
					if data.Terrain == 0 {
						outcome.Descr = fmt.Sprintf("Fires %s with a clear view of the enemy", shotter)
					} else {
						outcome.Descr = fmt.Sprintf("Fires %s blindly at the Target", shotter)
					}
					outcome.Ammo-- // Note - if cannister, total decrement = 2
					outcome.GunsFired = true
					DB.SQL(`update unit set ammo=$2,guns_fired=true where id=$1`, unit.ID, outcome.Ammo).Exec()

					victim := &shared.Unit{}
					err = DB.SQL(`select * from unit where id=$1`, data.Target).QueryStruct(victim)
					if err == nil {
						println("terrain", data.Terrain)
						println("range", data.Range)
						hitpoints := 0
						goodEffect := data.Terrain == 0
						useGuns := unit.Guns - unit.GunsLost
						if data.Opcode == shared.TacticalCannister {
							hitpoints = cannisterShot(useGuns, unit.GunneryType, data.Range, goodEffect)
						} else {
							hitpoints = gunShot(useGuns, unit.GunneryType, data.Range, goodEffect)
						}
						event := applyTacticalGunShot(victim, false, hitpoints)

						if goodEffect {
							if hitpoints > 3 {
								if hitpoints > 10 {
									if hitpoints > 20 {
										outcome.Descr2 = ".. Massive Devastation"
									} else {
										outcome.Descr2 = ".. Most Effective"
									}
								} else {
									outcome.Descr2 = ".. Somewhat Effective"
								}
							} else {
								outcome.Descr2 = ".. Not overly Effective"
							}

						}

						// get player who owns the target unit, and let them know the bad news
						TargetPlayerID := 0
						DB.SQL(`select c.player_id from unit u left join game_cmd c on c.id=u.cmd_id where u.id=$1`,
							data.Target).QueryScalar(&TargetPlayerID)

						Connections.BroadcastPlayer(TargetPlayerID, "Play", &shared.NetData{
							Action: "Unit",
							ID:     victim.ID,
							Opcode: shared.UnitEventHits,
							Unit:   &event,
						})
					}
				}
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
				if outcome.Ammo > 10 {
					outcome.Ammo = 10
				}
				outcome.Descr = "Resupply and Restock Ammo"
				DB.SQL(`update unit set ammo=$2 where id=$1`, unit.ID, outcome.Ammo).Exec()
			case shared.TacticalWithdraw:
				pts = 1
				outcome.Descr = "Unit Withdraws to Reserve"
				outcome.GunsLimbered = true
				outcome.Role = shared.RoleReserve
				DB.SQL(`update unit set guns_limbered=true, role=$2 where id=$1`, unit.ID, outcome.Role).Exec()
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

	logger(start, "Game.FightUnitAction", conn,
		fmt.Sprintf("Game %d Opcode %d Unit %d Target %d", data.GameID, data.Opcode, data.UnitID, data.Target),
		fmt.Sprintf("Outcome"))

	return err
}

func applyTacticalGunShot(unit *shared.Unit, cannister bool, pts int) shared.UnitEvent {

	inColumn := false
	ranks := 3
	sk := false
	switch unit.Formation {
	case shared.FormationOpenOrder:
		sk = true
	case shared.FormationLines:
		inColumn = false
		ranks = 3
	case shared.FormationLine,
		shared.FormationMixed:
		inColumn = false
		if unit.Drill >= 7 {
			ranks = 2
		}
	case shared.FormationMarchCol,
		shared.FormationAttCol,
		shared.FormationCloseCol,
		shared.FormationSquare,
		shared.FormationMob:
		inColumn = true
	}
	if unit.SKOut {
		sk = true
	}

	m, c, g, s := unit.PtsToMen(pts, ranks, inColumn, sk)
	println("Gun Damage ", pts, ranks, inColumn, sk, unit.Name, s, "Men=", m, "Guns=", g, "Cmd=", c)

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

	if cannister && rand.Intn(3) == 0 {
		unit.MState++
	} else if rand.Intn(12-unit.Rating) == 0 {
		unit.MState++
	}

	if rand.Intn(12-unit.Rating) == 0 {
		unit.Condition++
		if unit.Condition > 5 {
			unit.Condition = 5
		}
	}

	DB.SQL(`update unit set
		bayonets_lost=$2,
		sabres_lost=$3,
		guns_lost=$4,
		commander_control=$5,
		mstate=$6,
		condition=$7
		where id=$1`,
		unit.ID,
		unit.BayonetsLost, unit.SabresLost, unit.GunsLost,
		unit.CommanderControl,
		unit.MState,
		unit.Condition).Exec()

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

func applyTacticalSmallArmsFire(unit *shared.Unit, skirmishFire bool, pts int) shared.UnitEvent {

	inColumn := false
	ranks := 3
	sk := false
	switch unit.Formation {
	case shared.FormationOpenOrder:
		sk = true
	case shared.FormationLines:
		inColumn = false
		ranks = 3
	case shared.FormationLine,
		shared.FormationMixed:
		inColumn = false
		if unit.Drill >= 7 {
			ranks = 2
		}
	case shared.FormationMarchCol,
		shared.FormationAttCol,
		shared.FormationCloseCol,
		shared.FormationSquare,
		shared.FormationMob:
		inColumn = true
	}
	if unit.SKOut {
		sk = true
	}

	m, c, g, s := unit.PtsToMen(pts, ranks, inColumn, sk)
	println("SmallArms Damage ", pts, ranks, inColumn, sk, unit.Name, s, "Men=", m, "Guns=", g, "Cmd=", c)

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

	if rand.Intn(11-unit.Rating) == 0 {
		unit.MState++
	}

	if rand.Intn(16-unit.Rating) == 0 {
		unit.Condition++
		if unit.Condition > 5 {
			unit.Condition = 5
		}
	}

	DB.SQL(`update unit set
		bayonets_lost=$2,
		sabres_lost=$3,
		guns_lost=$4,
		commander_control=$5,
		mstate=$6,
		condition=$7
		where id=$1`,
		unit.ID,
		unit.BayonetsLost, unit.SabresLost, unit.GunsLost,
		unit.CommanderControl,
		unit.MState,
		unit.Condition).Exec()

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

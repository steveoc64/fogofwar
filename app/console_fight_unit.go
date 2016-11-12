package main

import (
	"fmt"
	"strconv"

	"./shared"
	"honnef.co/go/js/dom"
)

func doFightUnit(game *shared.Game, fight *shared.Fight, unit *shared.Unit) {
	w := dom.GetWindow()
	doc := w.Document()
	c := doc.QuerySelector("[name=svg-console]")
	html := ""
	xx := 100
	if Session.Orientation == "Landscape" {
		consoleSetViewBox(game, 150, 100, false)
		xx = 150
	} else {
		consoleSetViewBox(game, 100, 100, false)
	}
	consolePhaseBusy(game, "FightHQ")
	consoleCurrentFight = fight

	// Add a turn summary object
	g := c.QuerySelector("[name=g-main]")

	team := "blue"
	if game.Red {
		team = "red"
	}

	html = svgText(4, 10, fmt.Sprintf("text__2x text__%s", team), "Fight -")
	html += svgText(40, 8, "text__1x text__"+team, fight.Name)

	if Session.Orientation == "Landscape" {
		html += fmt.Sprintf(`<image xlink:href=/img/fight.png x=%d y=0 height=15 width=50></image>`, xx-60)
	}
	html += svgHelpBtn()

	// Add ourself
	myCorps := game.GetCmd(team, unit.CmdID)
	cmdr := unit.GetParentDiv(myCorps)

	ttl := unit.Name
	if Session.Orientation == "Landscape" {
		ttl = cmdr.Name + " - " + unit.Name
	}
	html += svgG(unit.ID)
	html += svgHQ(unit.ID, xx/2, 15, unit.CommanderControl, ttl)
	html += svgEndG()

	html += svgText(xx, 29, "text__end text__0x", unit.GetFightingDescription())
	switch unit.UType {
	case shared.UnitBde, shared.UnitSpecial:
		print("unit", unit.Formation)
		html += svgText(xx/2, 25, "text__middle text__1x text__gold", fnames[unit.Formation])
	case shared.UnitCav:
		if unit.SabresCharged < 3 {
			html += svgText(xx/2, 25, "text__middle text__1x text__gold", "on Fresh Horses")
		} else {
			html += svgText(xx/2, 25, "text__middle text__1x text__gold", "Blown")
		}
	case shared.UnitGun:
		if unit.GunsLimbered {
			html += svgText(xx/2, 25, "text__middle text__1x text__gold", "Limbered")
		} else {
			html += svgText(xx/2, 25, "text__middle text__1x text__gold", "Ready to Fire")
		}

	}

	html += svgG(100)
	html += fmt.Sprintf(`<rect x=0 y=88 rx=2 ry=2 width=%d height=12 class="carryon-button" data-id=100></rect>`, xx)
	html += svgText(xx/2, 97, "text__carryon text__middle", "Done")
	html += svgEndG()

	html += fmt.Sprintf(`<text id=outcome x=%d y=60 class="text__middle text__1x hidden text__%s"></text>"`, xx/2, team)
	html += fmt.Sprintf(`<text id=outcome2 x=%d y=70 class="text__middle text__1x hidden text__%s"></text>"`, xx/2, team)

	terrain := ""
	if fight.Rough {
		terrain += "Rough Ground"
	}
	if fight.Woods {
		if terrain != "" {
			terrain += ", "
		}
		terrain += "Woods"
	}
	if fight.Built {
		if terrain != "" {
			terrain += ", "
		}
		terrain += "Buildings"
	}
	if fight.Fort {
		if terrain != "" {
			terrain += ", "
		}
		terrain += "Fort"
	}
	if terrain == "" {
		terrain = "Clear"
	}
	html += svgText(5, 18, "text__1x text__"+team, terrain)

	yoffset := 30
	xoffset := 0
	ids := []int{}

	addButton := func(id int, name string) {
		html += svgG(id)
		html += svgButton(xoffset, yoffset, xx/2, 10, "console-button", "text__1x text__"+team, name)
		html += svgEndG()
		if xoffset == 0 {
			xoffset = xx / 2
		} else {
			xoffset = 0
			yoffset += 11
		}
		ids = append(ids, id)
	}

	// drill := unit.GetDrillData()

	switch unit.UType {
	case shared.UnitBde, shared.UnitSpecial:
		if unit.MState > 0 || unit.CommanderControl < 4 {
			if unit.MState < 4 {
				addButton(shared.TacticalStandGround, "Stand Your Ground")
				if unit.SKOut {
					addButton(shared.TacticalSKIn, "Skirmishers In")
				} else {
					if unit.Drill != 1 {
						addButton(shared.TacticalSKOut, "Skirmishers Out")
					}
				}
			}
			addButton(shared.TacticalWithdraw, "Withdraw")
			addButton(shared.TacticalSurrender, "Surrender")
		} else {
			if unit.Formation == shared.FormationMarchCol {
				addButton(shared.TacticalAdvance, "Advance")
				if unit.SKOut {
					addButton(shared.TacticalSKIn, "Skirmishers In")
				} else {
					if unit.Drill != 1 {
						addButton(shared.TacticalSKOut, "Skirmishers Out")
					}
				}
				if unit.CommanderControl >= 5 {
					addButton(shared.TacticalForm, "Change Formation")
					addButton(shared.TacticalWheel, "Wheel / EnFlank")
				}

				addButton(shared.TacticalWithdraw, "Withdraw")
				addButton(shared.TacticalSurrender, "Surrender")
			} else {

				if unit.CommanderControl >= 3 {
					addButton(shared.TacticalAdvance, "Advance")
					addButton(shared.TacticalStandGround, "Stand Your Ground")
				}

				if unit.CommanderControl >= 2 {
					if unit.Formation == shared.FormationOpenOrder {
						addButton(shared.TacticalSKAttack, "Skirmisher Attack")
					} else {
						if unit.SKOut {
							addButton(shared.TacticalSKIn, "Skirmishers In")
							addButton(shared.TacticalSKAttack, "Skirmisher Attack")
						} else {
							if unit.Drill != 1 {
								addButton(shared.TacticalSKOut, "Skirmishers Out")
							}
						}
					}
				}

				if unit.Formation != shared.FormationOpenOrder {
					if unit.CommanderControl >= 4 {
						if unit.Ammo > 1 {
							addButton(shared.TacticalFire, "Fire !")
						}
						addButton(shared.TacticalColdSteel, "Cold Steel !")
					}
				}

				if unit.CommanderControl >= 5 {
					addButton(shared.TacticalForm, "Change Formation")
					addButton(shared.TacticalWheel, "Wheel / EnFlank")
				}

				addButton(shared.TacticalWithdraw, "Withdraw")
				addButton(shared.TacticalSurrender, "Surrender")
			}
		}
	case shared.UnitCav:
		if unit.CommanderControl >= 6 {
			addButton(shared.TacticalCavCharge, "Charge !")
			addButton(shared.TacticalCavFeint, "Fient a Charge")
		}

		if unit.CommanderControl >= 4 {
			addButton(shared.TacticalCounterCavCharge, "Counter Charge")
			addButton(shared.TacticalStandGround, "Stand Your Ground")
		}

		if unit.CommanderControl >= 3 {
			addButton(shared.TacticalLeftFlank, "En Flank")
			addButton(shared.TacticalPursuit, "Pursuit !")
		}

		if unit.CommanderControl >= 6 {
			addButton(shared.TacticalTakeGuns, "Take Enemy Guns")
		}
		addButton(shared.TacticalWithdraw, "Withdraw to Reserve")
	case shared.UnitGun:
		if unit.Ammo > 1 && unit.CommanderControl >= 2 {
			addButton(shared.TacticalCannister, "Cannister !")
			addButton(shared.TacticalShot, "Round Shot")
		}

		if unit.CommanderControl >= 4 {
			if unit.GunsLimbered {
				addButton(shared.TacticalDeployGuns, "Deploy Guns")
			} else {
				addButton(shared.TacticalLimber, "Limber Guns")
			}
		}

		addButton(shared.TacticalResup, "Reload / Prepare")
		addButton(shared.TacticalWithdraw, "Withdraw to Reserve")
	}

	g.SetInnerHTML(html)

	svgCallback(100, func(dom.Event) {
		doFight(game, fight)
	})

	svgCallback(unit.ID, func(evt dom.Event) {
		consoleSubunits = append(consoleSubunits, unit)
		clickDiv(evt)
		// doFight(game, fight)
	})

	for _, v := range ids {
		svgCallback(v, func(evt dom.Event) {
			el := evt.Target()
			id, _ := strconv.Atoi(el.GetAttribute("data-id"))
			print("clicked on option", id)
			switch id {
			case shared.TacticalForm:
				doFightFormation(game, fight, unit)
			case shared.TacticalFire, shared.TacticalSKAttack:
				doFightFire(game, fight, unit, id)
			case shared.TacticalColdSteel:
				doFightColdSteel(game, fight, unit)
			case shared.TacticalCannister, shared.TacticalShot:
				doFightGunFire(game, fight, unit, id)
			default:
				go func() {
					outcome := &shared.FightOutcome{}
					err := RPC("GameRPC.FightUnitAction", shared.FightAction{
						Channel: Session.Channel,
						GameID:  game.ID,
						FightID: fight.ID,
						Opcode:  id,
						UnitID:  unit.ID,
						Target:  0,
					}, outcome)
					if err != nil {
						print(err.Error())
					} else {
						// print("got outcome", outcome)
						for _, i := range ids {
							el := doc.QuerySelector(fmt.Sprintf("#g-%d", i))
							if el != nil {
								el.Class().Add("hidden")
							}
						}
						outtext := doc.QuerySelector("#outcome")
						outtext.SetInnerHTML(outcome.Descr)
						outtext.Class().Remove("hidden")
						outtext2 := doc.QuerySelector("#outcome2")
						outtext2.SetInnerHTML(outcome.Descr2)
						outtext2.Class().Remove("hidden")
						unit.SetOutcome(outcome)
					}
				}()
			}

		})
	}

	// svgCallback(cmdr.ID, func(dom.Event) {
	// 	doFightHQ(game, fight, cmdr)
	// })

	svgCallbackQuery("#help", func(dom.Event) {
		loadTemplate("fight", "#unit-details", nil)
		doc.QuerySelector("#unit-details").Class().Add("md-show")
		doc.QuerySelector("[name=fight]").AddEventListener("click", false, func(evt dom.Event) {
			doc.QuerySelector("#unit-details").Class().Remove("md-show")
		})
	})

}

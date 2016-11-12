package main

import (
	"fmt"
	"strconv"

	"./shared"
	"honnef.co/go/js/dom"
)

func doFightColdSteel(game *shared.Game, fight *shared.Fight, unit *shared.Unit) {
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
	enemy := fight.Red
	enemyteam := "red"
	if game.Red {
		team = "red"
		enemy = fight.Blue
		enemyteam = "blue"
	}

	html = svgText(4, 10, fmt.Sprintf("text__2x text__%s", team), "Cold Steel")
	html += `<g id=fight-name>`
	html += svgText(xx-20, 8, "text__end text__1x text__"+team, fight.Name)
	html += `</g>`

	html += svgHelpBtn()

	// Add ourself
	myCorps := game.GetCmd(team, unit.CmdID)
	cmdr := unit.GetParentDiv(myCorps)
	// html += svgG(cmdr.ID)
	// html += svgHQ(cmdr.ID, xx/2, 15, cmdr.CommanderControl, cmdr.Name)
	// html += svgEndG()

	ttl := unit.Name
	if Session.Orientation == "Landscape" {
		ttl = cmdr.Name + " - " + unit.Name
	}
	html += svgG(unit.ID)
	html += svgHQ(unit.ID, xx/2, 15, unit.CommanderControl, ttl)
	html += svgEndG()

	// html += svgG(101)
	// html += svgText(xx/2, 50, "text__middle text__1x text__"+enemyteam, "Choose Target Unit")
	// html += svgEndG()

	html += svgG(100)
	html += fmt.Sprintf(`<rect x=30 y=88 rx=2 ry=2 width=%d height=12 class="carryon-button" data-id=100></rect>`, xx-30)
	html += svgText(xx/2, 97, "text__carryon text__middle", "Attack !")
	html += svgEndG()
	html += svgG(102)
	html += fmt.Sprintf(`<rect x=0 y=88 rx=2 ry=2 width=30 height=12 class="reorg-button" data-id=100></rect>`, xx)
	html += svgText(15, 97, "text__carryon text__middle", "Cancel")
	html += svgEndG()

	html += fmt.Sprintf(`<text id=outcome x=%d y=30 class="text__middle text__1x hidden text__%s"></text>"`, xx/2, team)
	html += fmt.Sprintf(`<text id=outcome2 x=%d y=40 class="text__middle text__1x hidden text__%s"></text>"`, xx/2, team)

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
	html += `<g id=terrain>`
	html += svgText(5, 18, "text__1x text__"+team, terrain)
	html += `</g>`

	drill := unit.GetDrillData()
	ratingData := unit.GetRatingData()
	print("ratingData", ratingData)

	drillDesc := fmt.Sprintf(".. in %d Ranks", drill.Ranks)
	if drill.Flankers {
		drillDesc += ", with Flank Companies"
	}
	if drill.EliteCoy {
		drillDesc += ", with Voltigeur & Grenadier Companies"
	}
	if drill.ThirdRank {
		drillDesc += ",  3rd Rank for skirmish line"
	}
	// html += svgText(xx/2, 78, "text__middle text__1x text__gold", drill.Name)
	// html += svgText(xx/2, 85, "text__middle text__1x text__gold", drillDesc)

	// html += svgText(xx/2, 25, "text__middle text__1x text__gold", fnames[unit.Formation])

	// Show the enemy units in range for selection

	html += `<g id=select-enemy>`
	left := 0
	right := 0
	center := 0
	advance := 0
	baseline := 25
	ids := []int{}
	for _, v := range enemy {
		subs := v.GetSubunits(game.GetCmd(enemyteam, v.CmdID))
		for _, u := range subs {
			x := 0
			y := 0
			switch u.Role {
			case shared.RoleReserve:
				// skip this unit
			case shared.RoleAdvance:
				x = xx / 3
				y = baseline + (advance * -6) + 12
				advance++
			case shared.Role1:
				x = xx / 3
				y = baseline + (center * -6)
				center++
			case shared.Role2:
				// hide the enemy second line
			case shared.RoleLeft: // mirror image - their left is our right
				x = 2 * (xx / 3)
				y = baseline + (right * -6) - 3
				right++
			case shared.RoleRight: // mirror image - their right is our left
				x = 0
				y = baseline + (left * -6) - 3
				left++
			}
			if y > 0 && u.UType != shared.UnitDiv {
				html += svgG(u.ID)
				// html += svgText(x, y, "text__middle text__1x text__"+team, v.Name)
				html += svgButton(x, y, xx/3, 6, "console-corps-button", "text__1x text__"+enemyteam, u.Name)
				html += svgEndG()
				ids = append(ids, u.ID)
			}
		}
	}

	html += svgText(xx/2, 60, "text__2x text__gold text__middle", "Select Enemy Unit")
	html += `</g>`

	html += `<g id=range class=hidden>`
	html += svgText(12, 28, "text__end text__0x", "Range:")
	html += svgText(7, 40, "text__end text__0x", `100p`)
	html += svgText(7, 50, "text__end text__0x", `200p`)
	html += svgText(7, 60, "text__end text__0x", `300p`)
	html += svgText(7, 70, "text__end text__0x", `400p`)
	html += `<rect data-id=1 x=7 y=30 width=15 height=10 class=range-bands></rect>`
	html += `<rect data-id=2 x=7 y=40 width=15 height=10 class=range-bands></rect>`
	html += `<rect data-id=3 x=7 y=50 width=15 height=10 class=range-bands></rect>`
	html += `<rect data-id=4 x=7 y=60 width=15 height=10 class=range-bands></rect>`
	html += `</g>`

	html += `<g id=bases class=hidden>`

	basesMax := (((unit.Bayonets - unit.BayonetsLost) + 200) / 450)
	if basesMax > 8 {
		basesMax = 8
	}
	basesSelected := basesMax
	html += svgText(xx/2, 87, "text__middle text__0x text__black", "Attacker Bases")
	html += svgText(xx, 87, "text__end text__0x", unit.GetFightingDescription())
	mb := ""
	if ratingData.MeleeBonus >= 0 {
		mb = "+"
	}
	html += svgText(xx, 70, "text__end text__1x text__"+team, fmt.Sprintf("Melee Bonus %s%d", mb, ratingData.MeleeBonus))
	bwidth := xx / 8
	basesMax = 8
	for ii := 0; ii < basesMax; ii++ {
		html += fmt.Sprintf(`<rect data-id=%d x=%d y=73 width=%d height=11 rx=2 ry=2 class="console-check"></rect>`,
			ii+1, ii*bwidth, bwidth)
		svgID = ii + 1
		html += svgText(ii*bwidth+bwidth/2, 79, "text__middle text__0x text__black", fmt.Sprintf("%d", ii+1))
	}

	// draw SK buttons
	html += svgText(30, 60, "text__0x text__black", "Skirmishers")
	for ii := 0; ii < 8; ii++ {
		html += fmt.Sprintf(`<circle data-id=%d class=help-button cx=%d cy=67 cy=5 r=5 class=unit-selected></circle>`,
			11+ii, 30+ii*10)
		svgID = ii + 11
		html += svgText(30+ii*10, 67, "text__middle text__0x text__black", fmt.Sprintf("%d", ii+1))
	}

	html += `</g>`

	html += `<g id=ebases class=hidden>`
	ebasesMax := (((unit.Bayonets - unit.BayonetsLost) + 200) / 450)
	if ebasesMax > 8 {
		ebasesMax = 8
	}
	ebasesSelected := basesMax
	html += svgText(xx/2, 12, "text__middle text__0x text__black", "Defender Bases")
	basesMax = 8
	for ii := 0; ii < basesMax; ii++ {
		html += fmt.Sprintf(`<rect data-id=%d x=%d y=13 width=%d height=11 rx=2 ry=2 class="console-check"></rect>`,
			ii+1, ii*bwidth, bwidth)
		svgID = ii + 1
		html += svgText(ii*bwidth+bwidth/2, 19, "text__middle text__0x text__black", fmt.Sprintf("%d", ii+1))
	}

	// draw SK buttons
	html += svgText(30, 40, "text__0x text__black", "Skirmishers")
	for ii := 0; ii < 8; ii++ {
		html += fmt.Sprintf(`<circle data-id=%d class=help-button cx=%d cy=30 cy=5 r=5></circle>`, 11+ii, 30+ii*10)
		svgID = ii + 11
		html += svgText(30+ii*10, 32, "text__middle text__0x text__black", fmt.Sprintf("%d", ii+1))
	}
	html += `</g>`
	svgID = 0

	g.SetInnerHTML(html)

	selectedEnemy := 0
	isDone := false

	svgCallback(102, func(dom.Event) {
		doFight(game, fight)
	})

	svgCallback(unit.ID, func(evt dom.Event) {
		consoleSubunits = append(consoleSubunits, unit)
		clickDiv(evt)
		// doFight(game, fight)
	})

	svgCallback(100, func(dom.Event) {
		if isDone {
			doFight(game, fight)
			return
		}
		if selectedEnemy == 0 {
			print("select enemy first")
		} else if basesSelected == 0 {
			print("choose bases attacking")
		} else if ebasesSelected == 0 {
			print("choose enemy bases as well")
		} else {
			theRange := 100
			for i, v := range doc.QuerySelector("#range").QuerySelectorAll("rect") {
				if v.Class().Contains("range-selected") {
					theRange = i
					break
				}
			}
			if theRange == 100 {
				print("select range first")
				return
			}
			print("Attack")
			go func() {
				outcome := &shared.FightOutcome{}
				terrain := 0
				if doc.QuerySelector("#clear-shot").Class().Contains("hidden") {
					terrain = 1
				}
				err := RPC("GameRPC.FightUnitAction", shared.FightAction{
					Channel: Session.Channel,
					GameID:  game.ID,
					FightID: fight.ID,
					Opcode:  shared.TacticalFire,
					UnitID:  unit.ID,
					Bases:   basesSelected,
					Terrain: terrain,
					Range:   theRange + 1,
					Target:  selectedEnemy,
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
					// doc.QuerySelector("#g-101").Class().Add("hidden")
					outtext := doc.QuerySelector("#outcome")
					outtext.SetInnerHTML(outcome.Descr)
					outtext.Class().Remove("hidden")
					outtext2 := doc.QuerySelector("#outcome2")
					outtext2.SetInnerHTML(outcome.Descr2)
					outtext2.Class().Remove("hidden")
					unit.SetOutcome(outcome)
					doc.QuerySelector("#g-100").QuerySelector("text").SetInnerHTML("Done")
					isDone = true
				}
			}()
		}
	})

	for _, v := range ids {
		svgCallback(v, func(evt dom.Event) {
			el := evt.Target()
			id, _ := strconv.Atoi(el.GetAttribute("data-id"))
			selectedEnemy = id
			enemyUnit := game.GetUnit(enemyteam, id)
			print("enemy unit", enemyUnit)
			doc.QuerySelector("#select-enemy").Class().Add("hidden")
			doc.QuerySelector("#terrain").Class().Add("hidden")
			doc.QuerySelector(fmt.Sprintf("#g-%d", unit.ID)).Class().Add("hidden")
			doc.QuerySelector("#range").Class().Remove("hidden")
			doc.QuerySelector("#bases").Class().Remove("hidden")
			doc.QuerySelector("#ebases").Class().Remove("hidden")
			doc.QuerySelector("#fight-name").
				QuerySelector("text").
				SetInnerHTML(fmt.Sprintf("%s vs %s", unit.Name, enemyUnit.Name))

		})
	}

	svgCallbackQuery("#range", func(evt dom.Event) {
		el := evt.Target()
		id, _ := strconv.Atoi(el.GetAttribute("data-id"))
		for i, rb := range doc.QuerySelector("#range").QuerySelectorAll("rect") {
			if i < id {
				rb.Class().Add("range-selected")
			} else {
				rb.Class().Remove("range-selected")
			}
		}
	})

	svgCallbackQuery("#bases", func(evt dom.Event) {
		el := evt.Target()
		id, _ := strconv.Atoi(el.GetAttribute("data-id"))
		if id < 10 {
			basesSelected = id
			selstring := team + "-unit-selected"
			for i, rb := range doc.QuerySelector("#bases").QuerySelectorAll("rect") {
				if i < id {
					rb.Class().Add(selstring)
				} else {
					rb.Class().Remove(selstring)
				}
			}
		} else {
			newid := id - 10
			for i, rb := range doc.QuerySelector("#bases").QuerySelectorAll("circle") {
				if i < newid {
					rb.Class().Add("sk-selected")
				} else {
					rb.Class().Remove("sk-selected")
				}
			}
		}
	})

	svgCallbackQuery("#ebases", func(evt dom.Event) {
		el := evt.Target()
		id, _ := strconv.Atoi(el.GetAttribute("data-id"))
		print("id", id)
		if id < 10 {
			ebasesSelected = id
			selstring := enemyteam + "-unit-selected"
			for i, rb := range doc.QuerySelector("#ebases").QuerySelectorAll("rect") {
				if i < id {
					rb.Class().Add(selstring)
				} else {
					rb.Class().Remove(selstring)
				}
			}
		} else {
			newid := id - 10
			for i, rb := range doc.QuerySelector("#ebases").QuerySelectorAll("circle") {
				if i < newid {
					rb.Class().Add("sk-selected")
				} else {
					rb.Class().Remove("sk-selected")
				}
			}
		}
	})

	svgCallbackQuery("#help", func(dom.Event) {
		loadTemplate("fight", "#unit-details", nil)
		doc.QuerySelector("#unit-details").Class().Add("md-show")
		doc.QuerySelector("[name=fight]").AddEventListener("click", false, func(evt dom.Event) {
			doc.QuerySelector("#unit-details").Class().Remove("md-show")
		})
	})

}

package main

import (
	"fmt"
	"strconv"

	"./shared"
	"honnef.co/go/js/dom"
)

func doFightFire(game *shared.Game, fight *shared.Fight, unit *shared.Unit, shotType int) {
	w := dom.GetWindow()
	doc := w.Document()
	c := doc.QuerySelector("[name=svg-console]")

	html := ""
	xx := 100
	if Session.Orientation == "Landscape" {
		consoleSetViewBox(150, 100, false)
		xx = 150
	} else {
		consoleSetViewBox(100, 100, false)
	}
	consolePhaseBusy("FightHQ")

	// Add a turn summary object
	g := c.QuerySelector("[name=g-main]")

	team := "blue"
	enemy := Session.Fight.Red
	enemyteam := "red"
	if Session.Game.Red {
		team = "red"
		enemy = Session.Fight.Blue
		enemyteam = "blue"
	}

	html = svgText(4, 10, fmt.Sprintf("text__2x text__%s", team), "Fight -")
	html += svgText(40, 8, "text__1x text__"+team, Session.Fight.Name)

	if Session.Orientation == "Landscape" {
		html += fmt.Sprintf(`<image xlink:href=/img/fight.png x=%d y=0 height=15 width=50></image>`, xx-60)
	}
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

	html += svgText(xx, 20, "text__end text__0x", unit.GetFightingDescription())

	// html += svgG(101)
	// html += svgText(xx/2, 50, "text__middle text__1x text__"+enemyteam, "Choose Target Unit")
	// html += svgEndG()

	html += svgG(100)
	html += fmt.Sprintf(`<rect x=30 y=88 rx=2 ry=2 width=%d height=12 class="carryon-button" data-id=100></rect>`, xx-30)
	html += svgText(xx/2, 97, "text__carryon text__middle", "Fire")
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
	html += svgText(5, 18, "text__1x text__"+team, terrain)

	drill := unit.GetDrillData()

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

	html += `<g id=range>`
	html += svgText(20, 74, "text__0x", "Range:")
	html += svgText(40, 74, "text__0x", `100p`)
	html += svgText(60, 74, "text__0x", `200p`)
	html += svgText(80, 74, "text__0x", `300p`)
	html += svgText(100, 74, "text__0x", `400p`)
	html += `<rect data-id=1 x=20 y=75 width=20 height=11 class=range-bands></rect>`
	html += `<rect data-id=2 x=40 y=75 width=20 height=11 class=range-bands></rect>`
	html += `<rect data-id=3 x=60 y=75 width=20 height=11 class=range-bands></rect>`
	html += `<rect data-id=4 x=80 y=75 width=20 height=11 class=range-bands></rect>`
	html += `</g>`

	// add a gun model on top of the range band
	html += `<image xlink:href=/img/firingline.png x=7 y=73 height=16 width=16></image>`

	html += svgG(1)
	html += svgText(20, 55, "text__question", "Clear Shot ?")
	html += `<rect class=console-check x=70 y=47 rx=2 ry=2 width=10 height=10 data-id=1></rect>`
	html += svgTick("clear-shot", "tick hidden", 70, 47, 10)
	html += svgEndG()

	html += `<g id=bases>`

	basesMax := (((unit.Bayonets - unit.BayonetsLost) + 200) / 450)
	if basesMax > 4 {
		basesMax = 4
	}
	basesSelected := basesMax
	html += svgText(18, 62, "text__end text__0x text__black", "Bases")
	html += svgText(18, 67, "text__end text__0x text__black", "Firing")
	bnames := []string{"½ Bn", "Full Bn", "3 Bases", "4-6 Bases"}
	for ii := 1; ii <= basesMax; ii++ {
		html += svgText(10+ii*20, 64, "text__middle text__0x text__black", bnames[ii-1])
		html += fmt.Sprintf(`<rect data-id=%d x=%d y=58 width=20 height=11 rx=2 ry=2 class="range-selected console-check"></rect>`,
			ii, ii*20)
	}
	html += `</g>`

	g.SetInnerHTML(html)

	svgCallback(1, func(dom.Event) {
		el := doc.QuerySelector("#clear-shot")
		if el != nil {
			el.Class().Toggle("hidden")
		}
	})

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
			print("choose bases firing")
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
			print("Fire")
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
			for _, enemy := range g.QuerySelectorAll(".unit-selected") {
				enemy.Class().Remove("unit-selected")
			}
			doc.QuerySelector(fmt.Sprintf("#g-%d", id)).QuerySelector("rect").Class().Add("unit-selected")
		})
	}

	svgCallbackQuery("#range", func(evt dom.Event) {
		el := evt.Target()
		id, _ := strconv.Atoi(el.GetAttribute("data-id"))
		for _, rb := range doc.QuerySelector("#range").QuerySelectorAll("rect") {
			rb.Class().Remove("range-selected")
		}
		// print("range is set to", id)
		if id > 0 {
			el.Class().Toggle("range-selected")
		} else {
			print("no range on this item")
		}
	})

	svgCallbackQuery("#bases", func(evt dom.Event) {
		el := evt.Target()
		id, _ := strconv.Atoi(el.GetAttribute("data-id"))
		basesSelected = id
		for i, rb := range doc.QuerySelector("#bases").QuerySelectorAll("rect") {
			if i < id {
				rb.Class().Add("range-selected")
			} else {
				rb.Class().Remove("range-selected")
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

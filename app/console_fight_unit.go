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

	html += svgG(100)
	html += fmt.Sprintf(`<rect x=0 y=88 rx=2 ry=2 width=%d height=12 class="carryon-button" data-id=100></rect>`, xx)
	html += svgText(xx/2, 97, "text__carryon text__middle", "Done")
	html += svgEndG()

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

	switch unit.UType {
	case shared.UnitBde, shared.UnitSpecial:
		addButton(shared.TacticalAdvance, "Advance")
		addButton(shared.TacticalStandGround, "Stand Your Ground")

		addButton(shared.TacticalSKIn, "Skirmishers In")
		addButton(shared.TacticalSKOut, "Skirmishers Out")

		addButton(shared.TacticalForm, "Fire !")
		addButton(shared.TacticalColdSteel, "Cold Steel !")

		addButton(shared.TacticalForm, "Change Formation")
		addButton(shared.TacticalWheel, "Wheel / EnFlank")

		addButton(shared.TacticalWithdraw, "Withdraw")
		addButton(shared.TacticalSurrender, "Surrender")
	case shared.UnitCav:
		addButton(shared.TacticalCavCharge, "Charge !")
		addButton(shared.TacticalCavFeint, "Fient a Charge")

		addButton(shared.TacticalCounterCavCharge, "Counter Charge")
		addButton(shared.TacticalStandGround, "Stand Your Ground")

		addButton(shared.TacticalLeftFlank, "En Flank")
		addButton(shared.TacticalPursuit, "Pursuit !")

		addButton(shared.TacticalTakeGuns, "Take Enemy Guns")
		addButton(shared.TacticalWithdraw, "Withdraw to Reserve")
	case shared.UnitGun:
		addButton(shared.TacticalCannister, "Cannister !")
		addButton(shared.TacticalShot, "Round Shot")

		addButton(shared.TacticalLimber, "Limber Guns")
		addButton(shared.TacticalDeployGuns, "Deploy Guns")

		addButton(shared.TacticalResup, "Reload / Prepare")
		addButton(shared.TacticalWithdraw, "Withdraw to Reserve")
	}

	g.SetInnerHTML(html)

	svgCallback(100, func(dom.Event) {
		doFight(game, fight)
	})

	svgCallback(unit.ID, func(dom.Event) {
		doFight(game, fight)
	})

	for _, v := range ids {
		svgCallback(v, func(evt dom.Event) {
			el := evt.Target()
			id, _ := strconv.Atoi(el.GetAttribute("data-id"))
			print("clicked on option", id)
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

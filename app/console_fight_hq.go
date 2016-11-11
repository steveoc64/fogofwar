package main

import (
	"fmt"

	"./shared"
	"honnef.co/go/js/dom"
)

func doFightUnit(game *shared.Game, fight *shared.Fight, unit *shared.Unit) {
	print("TODO - doFightUnit")
}

func doFightEnemy(game *shared.Game, fight *shared.Fight, unit *shared.Unit) {
	print("TODO - doFightEnemy")
}

func doFightHQ(game *shared.Game, fight *shared.Fight, unit *shared.Unit) {
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
	html += svgG(unit.ID)
	html += svgHQ(unit.ID, xx-60, 10, unit.CommanderControl, unit.Name)
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
	html += svgText(5, 18, "text__1x text__"+team, "Terrain: "+terrain)

	yoffset := 30
	xoffset := 0

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
	}

	addButton(shared.TacticalAdvance, "Division Advance")
	addButton(shared.TacticalWithdraw, "Withdraw / Concede Position")
	addButton(shared.TacticalResup, "Resup")
	addButton(shared.TacticalAdvance, "Division Advance")
	html += svgG(shared.TacticalWithdraw)
	html += svgButton(xoffset, yoffset, xx/2, 10, "console-button", "text__1x text__"+team, "Withdraw / Concede")
	html += svgEndG()
	if xoffset == 0 {
		xoffset = xx / 2
	} else {
		yoffset += 11
	}
	html += svgG(shared.TacticalResup)
	html += svgButton(xoffset, yoffset, xx/2, 10, "console-button", "text__1x text__"+team, "Resupply All")
	html += svgEndG()
	if xoffset == 0 {
		xoffset = xx / 2
	} else {
		yoffset += 11
	}
	html += svgG(shared.TacticalSquare)
	html += svgButton(xoffset, yoffset, xx/2, 10, "console-button", "text__1x text__"+team, "Form Squares !")
	html += svgEndG()
	if xoffset == 0 {
		xoffset = xx / 2
	} else {
		yoffset += 11
	}
	yoffset += 11
	html += svgG(shared.TacticalPassageOfLines)
	html += svgButton(xoffset, yoffset, xx/2, 10, "console-button", "text__1x text__"+team, "Passage of Lines")
	html += svgEndG()
	if xoffset == 0 {
		xoffset = xx / 2
	} else {
		yoffset += 11
	}
	yoffset += 11
	html += svgG(shared.TacticalSKOut)
	html += svgButton(xoffset, yoffset, xx/2, 10, "console-button", "text__1x text__"+team, "Deploy Skrimishers Out")
	html += svgEndG()
	if xoffset == 0 {
		xoffset = xx / 2
	} else {
		yoffset += 11
	}
	yoffset += 11
	html += svgG(shared.TacticalSKIn)
	html += svgButton(xoffset, yoffset, xx/2, 10, "console-button", "text__1x text__"+team, "Pull All Skirmishers In")
	html += svgEndG()
	if xoffset == 0 {
		xoffset = xx / 2
	} else {
		xoffset = 0
		yoffset += 11
	}
	yoffset += 11
	html += svgG(shared.TacticalSKAttack)
	html += svgButton(xoffset, yoffset, xx/2, 10, "console-button", "text__1x text__"+team, "All Skirmishers Attack")
	html += svgEndG()
	if xoffset == 0 {
		xoffset = xx / 2
	} else {
		xoffset = 0
		yoffset += 11
	}
	yoffset += 11
	html += svgG(shared.TacticalStandGround)
	html += svgButton(xoffset, yoffset, xx/2, 10, "console-button", "text__1x text__"+team, "Stand Your Ground")
	html += svgEndG()
	if xoffset == 0 {
		xoffset = xx / 2
	} else {
		xoffset = 0
		yoffset += 11
	}
	yoffset += 11
	html += svgG(shared.TacticalWithdraw)
	html += svgButton(xoffset, yoffset, xx/2, 10, "console-button", "text__1x text__"+team, "Withdraw / Concede")
	html += svgEndG()
	if xoffset == 0 {
		xoffset = xx / 2
	} else {
		xoffset = 0
		yoffset += 11
	}
	g.SetInnerHTML(html)

	svgCallback(100, func(dom.Event) {
		doFight(game, fight)
	})

	svgCallbackQuery("#help", func(dom.Event) {
		loadTemplate("fight", "#unit-details", nil)
		doc.QuerySelector("#unit-details").Class().Add("md-show")
		doc.QuerySelector("[name=fight]").AddEventListener("click", false, func(evt dom.Event) {
			doc.QuerySelector("#unit-details").Class().Remove("md-show")
		})
	})

}

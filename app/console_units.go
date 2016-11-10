package main

import (
	"fmt"
	"strconv"

	"./shared"
	"honnef.co/go/js/dom"
)

func doUnits(game *shared.Game) {
	w := dom.GetWindow()
	doc := w.Document()
	c := doc.QuerySelector("[name=svg-console]")
	xx := 100
	if Session.Orientation == "Landscape" {
		consoleSetViewBox(game, 150, 100, false)
		xx = 150
	} else {
		consoleSetViewBox(game, 100, 100, false)
	}
	consolePhaseBusy(game, "Units")

	// Add a turn summary object
	g := c.QuerySelector("[name=g-main]")

	team := "blue"
	teamName := game.BlueTeam
	cmds := game.BlueCmd
	if game.Red {
		team = "red"
		teamName = game.RedTeam
		cmds = game.RedCmd
	}

	// Create heading with Team Name
	sz := 2
	if len(teamName) > 18 {
		sz = 1
	}
	html := svgText(0, 10, fmt.Sprintf("text__%dx text__%s", sz, team), teamName)

	// yspacing := 80 / (len(cmds) + 1) // width to use for each cmd
	yoffset := 0
	for _, v := range cmds {
		v.CalcTotals()
		html += svgG(v.ID)
		if v.PlayerID == Session.UserID {
			html += svgButton(0, 18+(yoffset), xx, 10, "console-corps-button", "text__"+team+" text__1x", v.Name)
			html += svgText(xx-2, 25+yoffset, "text__0x text__end text__"+team, v.ShortSummary())
		} else {
			html += svgButton(0, 18+(yoffset), xx, 10, "console-corps-disabled", "text__"+team+" text__1x", v.Name)
			html += svgText(xx-2, 25+yoffset, "text__0x text__end text__"+team, v.ShortSummary())
		}
		html += svgEndG()
		yoffset += 11
	}
	// html += svgG(100)
	// html += `<rect x=0 y=88 rx=2 ry=2 width=100 height=12 class="carryon-button" data-id=100></rect>`
	// html += "\n"
	// html += svgText(50, 97, "text__carryon text__middle", "Orders Complete")
	// html += svgEndG()
	g.SetInnerHTML(html)

	// add callbacks for each corps
	clickCorps := func(evt dom.Event) {
		el := evt.Target()
		id, _ := strconv.Atoi(el.GetAttribute("data-id"))
		// print("clicked on corps", id)
		for _, v := range cmds {
			if v.ID == id && v.PlayerID == Session.UserID {
				doUnitsDiv(game, v)
			}
		}
	}

	svgCallback(100, func(dom.Event) {
		print("all done")
		consolePhaseNotBusy(game)
	})

	for _, v := range cmds {
		if v.PlayerID == Session.UserID {
			// svgButtonCallback(fmt.Sprintf("cmd-%d", v.ID), clickCorps)
			svgCallback(v.ID, clickCorps)
		}
	}
}

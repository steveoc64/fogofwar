package main

import (
	"fmt"
	"strconv"

	"./shared"
	"honnef.co/go/js/dom"
)

// Render the orders
func doUnits(game *shared.Game, level int) {
	switch level {
	case 0:
		doUnitsCorps(game)
	case 1:
		print("TODO doUnitsDivs")
	}
}

func doUnitsCorps(game *shared.Game) {
	w := dom.GetWindow()
	doc := w.Document()
	c := doc.QuerySelector("[name=svg-console]")

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
	html := ""
	sz := 2
	if len(teamName) > 18 {
		sz = 1
	}
	html += svgText(0, 10, sz, team, teamName)
	yspacing := 80 / (len(cmds) + 1) // width to use for each cmd
	for i, v := range cmds {
		if v.PlayerID == Session.UserID {
			html += svgButton(v.ID, fmt.Sprintf("cmd-%d", v.ID), 0, 20+(yspacing*i), 100,
				"console-corps-button", "text__"+team+" text__small", v.Name)
		} else {
			html += svgButton(v.ID, fmt.Sprintf("cmd-%d", v.ID), 0, 20+(yspacing*i), 100,
				"console-corps-button-other", "text__"+team+" text__small", v.Name)
		}
	}
	g.SetInnerHTML(html)

	// add callbacks for each corps
	clickCorps := func(evt dom.Event) {
		el := evt.Target()
		id, _ := strconv.Atoi(el.GetAttribute("data-id"))
		// print("clicked on corps", id)
		for _, v := range cmds {
			if v.ID == id && v.PlayerID == Session.UserID {
				// print("command ", v)
			}
		}
	}

	for _, v := range cmds {
		if v.PlayerID == Session.UserID {
			svgButtonCallback(fmt.Sprintf("cmd-%d", v.ID), clickCorps)
		}
	}
}

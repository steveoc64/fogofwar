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
	// yspacing := 80 / (len(cmds) + 1) // width to use for each cmd
	yoffset := 0
	for _, v := range cmds {
		v.CalcTotals()
		if v.PlayerID == Session.UserID {
			html += svgButton(v.ID, fmt.Sprintf("cmd-%d", v.ID), 0, 18+(yoffset), 100,
				"console-corps-button", "text__"+team+" text__1x", v.Name)
			html += svgText(72, 25+yoffset, 0, team, v.ShortSummary())
		} else {
			html += svgButton(v.ID, fmt.Sprintf("cmd-%d", v.ID), 0, 18+(yoffset), 100,
				"console-corps-button-other", "text__"+team+" text__1x", v.Name)
			html += svgText(72, 25+yoffset, 0, team, v.ShortSummary())
		}
		yoffset += 11
	}
	g.SetInnerHTML(html)

	// add callbacks for each corps
	clickCorps := func(evt dom.Event) {
		el := evt.Target()
		id, _ := strconv.Atoi(el.GetAttribute("data-id"))
		// print("clicked on corps", id)
		for _, v := range cmds {
			if v.ID == id && v.PlayerID == Session.UserID {
				print("command ", v)
				doUnitsDiv(game, v)
			}
		}
	}

	for _, v := range cmds {
		if v.PlayerID == Session.UserID {
			svgButtonCallback(fmt.Sprintf("cmd-%d", v.ID), clickCorps)
		}
	}
}

func doUnitsDiv(game *shared.Game, cmd *shared.GameCmd) {
	w := dom.GetWindow()
	doc := w.Document()
	c := doc.QuerySelector("[name=svg-console]")

	// Add a turn summary object
	g := c.QuerySelector("[name=g-main]")

	team := "blue"
	if game.Red {
		team = "red"
	}

	// Create heading with Team Name
	html := ""
	sz := 2
	if len(cmd.Name) > 18 {
		sz = 1
	}
	// title
	html += svgText(0, 10, sz, team, cmd.Name)
	numDivs := 0
	for _, v := range cmd.Units {
		if v.UType == 1 {
			numDivs++
		}
	}

	// yspacing := 80 / (numDivs + 1) // width to use for each cmd
	yoffset := 0
	for _, v := range cmd.Units {
		if v.UType == 1 {
			html += svgButton(v.ID, fmt.Sprintf("unit-%d", v.ID), 0, 18+yoffset, 100,
				"console-corps-button", "text__"+team+" text__1x", v.Name)
			html += svgText(72, 25+yoffset, 0, team, v.GetShortSummary(cmd))
			yoffset += 11
		}
	}
	g.SetInnerHTML(html)

	// add callbacks for each corps
	clickDiv := func(evt dom.Event) {
		el := evt.Target()
		id, _ := strconv.Atoi(el.GetAttribute("data-id"))
		// print("clicked on div", id)
		for _, v := range cmd.Units {
			if v.ID == id {
				print("unit ", v)
			}
		}
	}

	for _, v := range cmd.Units {
		if v.UType == 1 {
			svgButtonCallback(fmt.Sprintf("unit-%d", v.ID), clickDiv)
		}
	}

	g.(*dom.BasicHTMLElement).FirstChild().AddEventListener("click", false, func(evt dom.Event) {
		doUnits(game)
	})
}

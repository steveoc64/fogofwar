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

	consoleSetViewBox(game, 100, 100, false)
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
			html += svgButton(0, 18+(yoffset), 100, 10, "console-corps-button", "text__"+team+" text__1x", v.Name)
			html += svgText(98, 25+yoffset, "text__0x text__end text__"+team, v.ShortSummary())
		} else {
			html += svgButton(0, 18+(yoffset), 100, 10, "console-corps-disabled", "text__"+team+" text__1x", v.Name)
			html += svgText(98, 25+yoffset, "text__0x text__end text__"+team, v.ShortSummary())
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
		consolePhaseDone(game)
	})

	for _, v := range cmds {
		if v.PlayerID == Session.UserID {
			// svgButtonCallback(fmt.Sprintf("cmd-%d", v.ID), clickCorps)
			svgCallback(v.ID, clickCorps)
		}
	}
}

func doUnitsDiv(game *shared.Game, cmd *shared.GameCmd) {
	w := dom.GetWindow()
	doc := w.Document()
	c := doc.QuerySelector("[name=svg-console]")

	consoleSetViewBox(game, 100, 100, false)
	consolePhaseBusy(game, "UnitsDiv")

	// Add a turn summary object
	g := c.QuerySelector("[name=g-main]")

	team := "blue"
	if game.Red {
		team = "red"
	}

	// Create heading with Team Name
	fullName := cmd.Name + ": " + cmd.CommanderName
	sz := 2
	if len(fullName) > 18 {
		sz = 1
	}
	// title
	html := svgG(0)
	html += svgText(0, 10, fmt.Sprintf("text__%dx text__%s", sz, team), fullName)
	html += svgText(98, 15, "text__end text__0x", cmd.CommandSummary())
	html += svgEndG()

	numDivs := 0
	for _, v := range cmd.Units {
		if v.UType == shared.UnitDiv {
			numDivs++
		}
	}

	// yspacing := 80 / (numDivs + 1) // width to use for each cmd
	yoffset := 0
	for _, v := range cmd.Units {
		if v.UType == shared.UnitDiv {
			html += svgG(v.ID)
			html += svgButton(0, 18+yoffset, 100, 10, "console-corps-button", "text__"+team+" text__1x", v.Name)
			html += svgText(98, 25+yoffset, "text__0x text__end text__"+team, v.GetShortSummary(cmd))
			html += svgEndG()
			yoffset += 11
		}
	}
	html += svgG(100)
	html += `<rect x=0 y=88 rx=2 ry=2 width=100 height=12 class="reorg-button" data-id=100></rect>`
	html += "\n"
	html += svgText(50, 97, "text__carryon text__middle", "Layout of Divisions")
	html += svgEndG()
	g.SetInnerHTML(html)

	// add callbacks for each div
	clickDiv := func(evt dom.Event) {
		el := evt.Target()
		id, _ := strconv.Atoi(el.GetAttribute("data-id"))
		for _, v := range cmd.Units {
			if v.ID == id {
				doUnitsBde(game, cmd, v)
			}
		}
	}

	svgCallback(0, func(dom.Event) {
		doUnits(game)
	})
	svgCallback(100, func(evt dom.Event) {
		print("reorg")
	})

	for _, v := range cmd.Units {
		if v.UType == shared.UnitDiv {
			svgCallback(v.ID, clickDiv)
		}
	}

}

func doUnitsBde(game *shared.Game, cmd *shared.GameCmd, div *shared.Unit) {
	w := dom.GetWindow()
	doc := w.Document()
	c := doc.QuerySelector("[name=svg-console]")

	consoleSetViewBox(game, 100, 100, false)
	consolePhaseBusy(game, "Bde")

	// Add a turn summary object
	g := c.QuerySelector("[name=g-main]")

	team := "blue"
	if game.Red {
		team = "red"
	}

	html := svgG(100)
	html += `<rect x=0 y=88 rx=2 ry=2 width=100 height=12 class="reorg-button" data-id=100></rect>`
	html += "\n"
	html += svgText(50, 97, "text__carryon text__middle", "Organise Brigades")
	html += svgEndG()

	// Create heading with Div Name
	sz := 2
	if len(div.Name) > 18 {
		sz = 1
	}
	// title
	html = svgG(0)
	html += svgText(0, 10, fmt.Sprintf("text__%dx text__%s", sz, team), div.Name)
	html += svgEndG()

	subunits := div.GetSubunits(cmd)

	// yspacing := 80 / (numDivs + 1) // width to use for each cmd
	yoffset := 0
	for _, v := range subunits {
		html += svgG(v.ID)
		html += svgButton(0, 18+yoffset, 100, 10, "console-corps-button", "text__"+team+" text__1x", v.Name)
		if len(v.Name) < 16 {
			html += svgText(55, 25+yoffset, "text__0x text__middle text__"+team, v.GetRating())
		}
		html += svgText(98, 25+yoffset, "text__0x text__end text__"+team, v.GetBases())
		html += svgEndG()
		yoffset += 11
	}
	html += svgG(100)
	html += `<rect x=0 y=88 rx=2 ry=2 width=100 height=12 class="reorg-button" data-id=100></rect>`
	html += "\n"
	html += svgText(50, 97, "text__carryon text__middle", "Organise Brigades")
	html += svgEndG()
	g.SetInnerHTML(html)

	TheUnit := &shared.Unit{}
	// var clickHandler func(*js.Object)

	// add callbacks for each bde
	clickDiv := func(evt dom.Event) {
		el := evt.Target()
		id, _ := strconv.Atoi(el.GetAttribute("data-id"))
		print("clicked on bde", id, "from", el.TagName())

		for _, v := range subunits {
			if v.ID == id {
				print("unit ", v)
				TheUnit = v
				// doUnitCard(v)
				loadTemplate("unit-details", "#unit-details", v)
				ud := doc.QuerySelector("#unit-details")
				ud.Class().Add("md-show")
				inspection := ud.QuerySelector(".inspection")

				inspection.AddEventListener("click", false, func(evt dom.Event) {
					el := evt.Target()
					unit := TheUnit
					if el.TagName() == "INPUT" {
						value := el.(*dom.HTMLInputElement).Value
						switch unit.UType {
						case shared.UnitDiv:
							doc.QuerySelector("#unit-details").Class().Remove("md-show")
						case shared.UnitBde, shared.UnitSpecial:
							switch value {
							case "Valour":
								loadTemplate("unit-valour", "[name=unitcard]", unit)
								return
							case "Discipline":
								loadTemplate("unit-discipline", "[name=unitcard]", unit)
								return
							default:
								doc.QuerySelector("#unit-details").Class().Remove("md-show")
								print("here with utype", unit.UType)
							}
						case shared.UnitCav:
							switch value {
							case "Honours":
								loadTemplate("unit-cav-details", "[name=unitcard]", unit)
								return
							default:
								doc.QuerySelector("#unit-details").Class().Remove("md-show")
							}
						case shared.UnitGun:
							switch value {
							case "Gunnery Chart":
								loadTemplate("unit-gunnery", "[name=unitcard]", unit)
								return
							default:
								doc.QuerySelector("#unit-details").Class().Remove("md-show")
							}
						}
					} // tag input
				})
			}
		}
	}

	svgCallback(0, func(evt dom.Event) {
		doUnitsDiv(game, cmd)
	})

	for _, v := range subunits {
		// svgButtonCallback(fmt.Sprintf("unit-%d", v.ID), clickDiv)
		svgCallback(v.ID, clickDiv)
	}
}

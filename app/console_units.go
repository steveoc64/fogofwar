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
	fullName := cmd.Name + ": " + cmd.CommanderName
	sz := 2
	if len(fullName) > 18 {
		sz = 1
	}
	// title
	html += svgText(0, 10, sz, team, fullName)
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

	// add callbacks for each div
	clickDiv := func(evt dom.Event) {
		el := evt.Target()
		id, _ := strconv.Atoi(el.GetAttribute("data-id"))
		// print("clicked on div", id)
		for _, v := range cmd.Units {
			if v.ID == id {
				print("unit ", v)
				doUnitsBde(game, cmd, v)
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

func doUnitsBde(game *shared.Game, cmd *shared.GameCmd, div *shared.Unit) {
	w := dom.GetWindow()
	doc := w.Document()
	c := doc.QuerySelector("[name=svg-console]")

	// Add a turn summary object
	g := c.QuerySelector("[name=g-main]")

	team := "blue"
	if game.Red {
		team = "red"
	}

	// Create heading with Div Name
	html := ""
	sz := 2
	if len(div.Name) > 18 {
		sz = 1
	}
	// title
	html += svgText(0, 10, sz, team, div.Name)
	subunits := div.GetSubunits(cmd)

	// yspacing := 80 / (numDivs + 1) // width to use for each cmd
	yoffset := 0
	for _, v := range subunits {
		html += svgButton(v.ID, fmt.Sprintf("unit-%d", v.ID), 0, 18+yoffset, 100,
			"console-corps-button", "text__"+team+" text__1x", v.Name)
		html += svgText(48, 25+yoffset, 0, team, v.GetRating())
		html += svgText(80, 25+yoffset, 0, team, v.GetBases())
		yoffset += 11
	}
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

				ud.AddEventListener("click", false, func(evt dom.Event) {
					el := evt.Target()
					unit := TheUnit
					if el.TagName() == "INPUT" {
						value := el.(*dom.HTMLInputElement).Value
						// print("with value", value)
						// print("on utype", unit.UType)
						switch unit.UType {
						case 1:
							doc.QuerySelector("#unit-details").Class().Remove("md-show")
						case 2, 5:
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
						case 3:
							// print("in cav with", value)
							switch value {
							case "Honours":
								// print("here with Honours")
								loadTemplate("unit-cav-details", "[name=unitcard]", unit)
								return
							default:
								doc.QuerySelector("#unit-details").Class().Remove("md-show")
							}
						case 4:
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

	for _, v := range subunits {
		svgButtonCallback(fmt.Sprintf("unit-%d", v.ID), clickDiv)
	}

	g.(*dom.BasicHTMLElement).FirstChild().AddEventListener("click", false, func(evt dom.Event) {
		doUnitsDiv(game, cmd)
	})
}

// Click handler on the unitlist
/*		form.OnEvent("UnitList", "click", func(evt dom.Event) {
			td := evt.Target()
			tag := td.TagName()
			// print("clicked on", tag)
			if tag == "TD" {
				tr := td.ParentElement()
				key, _ := strconv.Atoi(tr.GetAttribute("key"))
				team := tr.GetAttribute("data-team")
				// print("clicked on row with key", key)
				unit := game.GetUnit(team, key)
				TheUnit = unit
				// print("unit is", unit)
				if unit.UType == 1 {
					unit.Summary = unit.GetSummary(TheCmd)
				}
				loadTemplate("unit-details", "#unit-details", unit)
				doc.QuerySelector("#unit-details").AddEventListener("click", false, func(evt dom.Event) {
					// print("clicke on the unit details")
					unit := TheUnit
					el := evt.Target()
					print("clicked on a ", el.TagName())
					if el.TagName() == "INPUT" {
						value := el.(*dom.HTMLInputElement).Value
						print("with value", value)
						print("on utype", unit.UType)
						switch unit.UType {
						case 1:
							doc.QuerySelector("#unit-details").Class().Remove("md-show")
						case 2, 5:
							switch value {
							case "Valour":
								loadTemplate("unit-valour", "[name=unitcard]", unit)
								return
							case "Discipline":
								loadTemplate("unit-discipline", "[name=unitcard]", unit)
								return
							default:
								doc.QuerySelector("#unit-details").Class().Remove("md-show")
							}
						case 3:
							// print("in cav with", value)
							switch value {
							case "Honours":
								// print("here with Honours")
								loadTemplate("unit-cav-details", "[name=unitcard]", unit)
								return
							default:
								doc.QuerySelector("#unit-details").Class().Remove("md-show")
							}
						case 4:
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
				doc.QuerySelector("#unit-details").Class().Add("md-show")
			}
		})
*/

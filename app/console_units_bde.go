package main

import (
	"fmt"
	"strconv"

	"./shared"
	"honnef.co/go/js/dom"
)

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

	svgCallback(100, func(evt dom.Event) {
		doUnitBdeReorg(game, cmd, div)
	})

	for _, v := range subunits {
		// svgButtonCallback(fmt.Sprintf("unit-%d", v.ID), clickDiv)
		svgCallback(v.ID, clickDiv)
	}
}

func doUnitBdeReorg(game *shared.Game, cmd *shared.GameCmd, div *shared.Unit) {
	w := dom.GetWindow()
	doc := w.Document()
	c := doc.QuerySelector("[name=svg-console]")
	g := c.QuerySelector("[name=g-main]")
	html := ""

	consoleSetViewBox(game, 100, 100, false)
	consolePhaseBusy(game, "UnitReorg")

	team := "blue"
	if game.Red {
		team = "red"
	}

	html += svgText(0, 8, fmt.Sprintf("text__1x text__%s", team), cmd.Name)
	html += svgText(4, 16, fmt.Sprintf("text__1x text__%s", team), div.Name)
	html += svgHelpBtn()

	// draw the grid of role locations

	html += `
<g id=layout>
<rect data-id=res x=0 y=20 width=100 height=65 class=unit-layout></rect>
<rect data-id=adv x=30 y=20 width=40 height=15 class=unit-layout></rect>
<rect data-id=first x=30 y=35 width=40 height=15 class=unit-layout></rect>
<rect data-id=second x=30 y=50 width=40 height=15 class=unit-layout></rect>
<rect data-id=left x=0 y=35 width=30 height=30 class=unit-layout></rect>
<rect data-id=right x=70 y=35 width=30 height=30 class=unit-layout></rect>
</g>
`

	// Draw in the unit in the various fwd roles
	totaladv := 0
	totalfirst := 0
	totalsecond := 0
	totalright := 0
	totalleft := 0
	totalres := 0
	selectedElement := 0

	subunits := div.GetSubunits(cmd)

	// calc the number of things in each role
	for _, v := range subunits {
		switch v.Role {
		case shared.RoleReserve:
			totalres++
		case shared.RoleAdvance:
			totaladv++
		case shared.Role1:
			totalfirst++
		case shared.Role2:
			totalsecond++
		case shared.RoleRight:
			totalright++
		case shared.RoleLeft:
			totalleft++
		}
	}

	adv := 0
	first := 0
	second := 0
	right := 0
	left := 0
	res := 0

	x := 0
	y := 0

	// render all the things
	for _, v := range subunits {
		switch v.Role {
		case shared.RoleReserve:
			if (res % 2) != 0 {
				x = 50
			} else {
				x = 0
			}
			x += 2
			y = 70 + (res/2)*7

			html += svgG(v.ID)
			html += svgText(x, y, "text__unit", v.Name)
			html += svgEndG()
			res++
		case shared.RoleAdvance:
			x = 32
			y = 25
			html += svgG(v.ID)
			html += svgText(x, y, "text__unit", v.Name)
			html += svgEndG()
			adv++
		case shared.Role1:
			x = 32
			y = 40
			if first == 1 {
				x += 2
				y += 6
			}
			html += svgG(v.ID)
			html += svgText(x, y, "text__unit", v.Name)
			html += svgEndG()
			first++
		case shared.Role2:
			x = 32
			y = 55
			if second == 1 {
				x += 2
				y += 6
			}
			html += svgG(v.ID)
			html += svgText(x, y, "text__unit", v.Name)
			html += svgEndG()
			second++
		case shared.RoleRight:
			x = 75
			y = 50
			// html += svgG(v.ID)
			svgID = v.ID
			html += fmt.Sprintf(`<g id=g-%d transform=rotate(33,80,50)>`, v.ID)
			html += svgText(x, y, "text__unit", v.Name)
			html += svgEndG()
			right++
		case shared.RoleLeft:
			x = -5
			y = 50
			// html += svgG(v.ID)
			svgID = v.ID
			html += fmt.Sprintf(`<g id=g-%d transform=rotate(-33,20,50)>`, v.ID)
			html += svgText(x, y, "text__unit", v.Name)
			html += svgEndG()
			left++
		}
	}

	html += svgG(100)
	html += `<rect x=0 y=88 rx=2 ry=2 width=100 height=12 class="reorg-button" data-id=100></rect>`
	html += "\n"
	html += svgText(50, 97, "text__carryon text__middle", "Done")
	html += svgEndG()
	g.SetInnerHTML(html)

	svgCallback(100, func(dom.Event) {
		doUnitsDiv(game, cmd)
	})

	for _, v := range subunits {
		svgCallback(v.ID, func(evt dom.Event) {
			el := evt.Target()
			id, _ := strconv.Atoi(el.GetAttribute("data-id"))
			if el.TagName() == "text" {
				// deselect all
				m := doc.QuerySelector("[name=g-main]")
				for _, sel := range m.QuerySelectorAll("text") {
					sel.Class().Remove("unit-selected")
				}
				el.Class().Toggle("unit-selected")
				selectedElement = id
			}
		})
	}

	setSelected := func(s string) {
		// find the element
		for _, v := range subunits {
			if v.ID == selectedElement {
				doIt := false
				switch s {
				case "res":
					v.Role = shared.RoleReserve
					doIt = true
				case "adv":
					if totaladv == 0 {
						v.Role = shared.RoleAdvance
						doIt = true
					}
				case "first":
					if totalfirst < 2 {
						v.Role = shared.Role1
						doIt = true
					}
				case "second":
					if totalsecond < 2 {
						v.Role = shared.Role2
						doIt = true
					}
				case "right":
					if totalright == 0 {
						v.Role = shared.RoleRight
						doIt = true
					}
				case "left":
					if totalleft == 0 {
						v.Role = shared.RoleLeft
						doIt = true
					}
				}

				// TODO - send msg to backend with update for unit role
				if doIt {
					setUnitBdeRole(game, cmd, div, selectedElement, v.Role)
				}
			}
		}

	}

	svgCallbackQuery("#layout", func(evt dom.Event) {
		if selectedElement == 0 {
			print("clicked on layout and nothing selected yet")
			return
		}
		el := evt.Target()
		print("selected and clicke on ", el.TagName(), el.GetAttribute("data-id"))
		if el.TagName() == "rect" {
			setSelected(el.GetAttribute("data-id"))
		}

	})

	svgCallbackQuery("#help", func(dom.Event) {
		loadTemplate("unit-org", "#unit-details", nil)
		doc.QuerySelector("#unit-details").Class().Add("md-show")
		doc.QuerySelector("[name=unit-org]").AddEventListener("click", false, func(evt dom.Event) {
			doc.QuerySelector("#unit-details").Class().Remove("md-show")
		})
	})
}

func setUnitBdeRole(game *shared.Game, cmd *shared.GameCmd, div *shared.Unit, uid int, role int) {
	go func() {
		done := false
		err := RPC("GameRPC.UnitRole", shared.UnitRoleData{
			Channel: Session.Channel,
			ID:      uid,
			Role:    role,
		}, &done)
		if err != nil {
			print(err.Error())
		} else {
			doUnitBdeReorg(game, cmd, div)
		}
	}()
}

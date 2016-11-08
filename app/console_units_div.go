package main

import (
	"fmt"
	"strconv"

	"./shared"
	"honnef.co/go/js/dom"
)

func doUnitsDiv(game *shared.Game, cmd *shared.GameCmd) {
	w := dom.GetWindow()
	doc := w.Document()
	c := doc.QuerySelector("[name=svg-console]")

	consoleCurrentCmd = cmd
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
	html += svgText(50, 97, "text__carryon text__middle", "Division Orders")
	html += svgEndG()
	g.SetInnerHTML(html)

	svgCallback(0, func(dom.Event) {
		doUnits(game)
	})

	svgCallback(100, func(evt dom.Event) {
		doUnitDivReorg(game, cmd)
	})

	for _, v := range cmd.Units {
		if v.UType == shared.UnitDiv {
			svgCallback(v.ID, func(evt dom.Event) {
				el := evt.Target()
				id, _ := strconv.Atoi(el.GetAttribute("data-id"))
				for _, v := range cmd.Units {
					if v.ID == id {
						doUnitsBde(game, cmd, v)
					}
				}
			})
		}
	}

}

func doUnitDivReorg(game *shared.Game, cmd *shared.GameCmd) {
	w := dom.GetWindow()
	doc := w.Document()
	c := doc.QuerySelector("[name=svg-console]")
	g := c.QuerySelector("[name=g-main]")
	html := ""

	consoleCurrentCmd = cmd
	consoleSetViewBox(game, 100, 100, false)
	consolePhaseBusy(game, "UnitReorg")

	team := "blue"
	if game.Red {
		team = "red"
	}

	html = svgText(0, 10, fmt.Sprintf("text__2x text__%s", team), cmd.Name)
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

	// calc the number of things in each role
	for _, v := range cmd.Units {
		if v.UType == shared.UnitDiv {
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
	for _, v := range cmd.Units {
		if v.UType == shared.UnitDiv {
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
	}

	html += svgG(100)
	html += `<rect x=0 y=88 rx=2 ry=2 width=100 height=12 class="reorg-button" data-id=100></rect>`
	html += "\n"
	html += svgText(50, 97, "text__carryon text__middle", "Done")
	html += svgEndG()
	g.SetInnerHTML(html)

	svgCallback(100, func(dom.Event) {
		print("done")
		doUnitsDiv(game, cmd)
	})

	for _, v := range cmd.Units {
		if v.UType == shared.UnitDiv {
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
	}

	setSelected := func(s string) {
		// find the element
		for _, v := range cmd.Units {
			if v.UType == shared.UnitDiv {
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
						print("setting", v.ID, selectedElement, v.Role)
						setUnitDivRole(game, cmd, selectedElement, v.Role)
					}
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

func setUnitDivRole(game *shared.Game, cmd *shared.GameCmd, uid int, role int) {
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
			doUnitDivReorg(game, cmd)
		}
	}()
}

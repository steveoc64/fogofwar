package main

import (
	"fmt"
	"strconv"

	"./shared"
	"honnef.co/go/js/dom"
)

func doCommitFight(game *shared.Game, fight *shared.Fight) {
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
	consoleCurrentFight = fight
	consolePhaseBusy(game, "CommitFight")

	// Add a turn summary object
	g := c.QuerySelector("[name=g-main]")

	team := "blue"
	cmds := game.BlueCmd
	if game.Red {
		team = "red"
		cmds = game.RedCmd
	}

	// Create heading with Team Name
	html := svgText(0, 10, "text__2x text__"+team, "Select Corps")
	html += svgHelpBtn()

	if Session.Orientation == "Landscape" {
		html += fmt.Sprintf(`<image xlink:href=/img/fight.png x=%d y=0 height=15 width=50></image>`, xx-60)
	}

	yoffset := 0
	for _, v := range cmds {
		if v.PlayerID == Session.UserID {
			html += svgG(v.ID)
			c := "console-corps-disabled"
			switch v.CState {
			case shared.CmdBattleLine, shared.CmdBattleAdvance, shared.CmdCompleteMarch:
				c = "console-corps-button"
			}
			html += svgButton(0, 18+(yoffset), xx, 10, c, "text__1x text__"+team, v.Name)
			html += svgText(xx-2, 25+yoffset, "text__0x text__end text__"+team, v.CommandSummary())
			html += svgEndG()
			yoffset += 11
		}
	}
	html += svgG(100)
	html += fmt.Sprintf(`<rect x=0 y=88 rx=2 ry=2 width=%d height=12 class="carryon-button" data-id=100></rect>`, xx)
	html += "\n"
	html += svgText(xx/2, 97, "text__carryon text__middle", "Done")
	html += svgEndG()

	if Session.Orientation == "Landscape" {
		html += fmt.Sprintf(`<image xlink:href=/img/fight.png x=%d y=0 height=15 width=50></image>`, xx-60)
	}
	g.SetInnerHTML(html)

	// add callbacks for each corps
	clickCorps := func(evt dom.Event) {
		el := evt.Target()
		id, _ := strconv.Atoi(el.GetAttribute("data-id"))
		// print("clicked on corps", id, el.TagName())
		for _, v := range cmds {
			if v.ID == id && v.PlayerID == Session.UserID {
				doCommitDiv(game, v, fight)
			}
		}
	}

	svgCallback(100, func(dom.Event) {
		// print("all done")
		doFight(game, fight)
	})

	svgCallbackQuery("help", func(dom.Event) {
		loadTemplate("fight", "#unit-details", nil)
		doc.QuerySelector("#unit-details").Class().Add("md-show")
		doc.QuerySelector("[name=fight]").AddEventListener("click", false, func(evt dom.Event) {
			doc.QuerySelector("#unit-details").Class().Remove("md-show")
		})
	})

	for _, v := range cmds {
		if v.PlayerID == Session.UserID {
			svgCallback(v.ID, clickCorps)
		}
	}
}

func doCommitDiv(game *shared.Game, cmd *shared.GameCmd, fight *shared.Fight) {
	w := dom.GetWindow()
	doc := w.Document()
	c := doc.QuerySelector("[name=svg-console]")
	g := c.QuerySelector("[name=g-main]")
	html := ""

	consoleCurrentCmd = cmd
	consoleCurrentFight = fight
	xx := 100
	if Session.Orientation == "Landscape" {
		consoleSetViewBox(game, 150, 100, false)
		xx = 150
	} else {
		consoleSetViewBox(game, 100, 100, false)
	}
	consolePhaseBusy(game, "CommitDiv")

	team := "blue"
	if game.Red {
		team = "red"
	}

	html = svgText(0, 9, "text__1x text__"+team, "Select Divisions from "+cmd.Name)
	html += svgText(0, 18, "text__1x text__"+team, "To commit to "+fight.Name)
	html += svgHelpBtn()

	if Session.Orientation == "Landscape" {
		html += fmt.Sprintf(`<image xlink:href=/img/fight.png x=%d y=0 height=15 width=50></image>`, xx-60)
	}

	// draw the grid of role locations

	if Session.Orientation == "Landscape" {
		html += `
<g id=layout>
<rect data-id=res x=0 y=20 width=150 height=65 class=unit-layout></rect>
<rect data-id=adv x=50 y=20 width=50 height=15 class=unit-layout></rect>
<rect data-id=first x=50 y=35 width=50 height=15 class=unit-layout></rect>
<rect data-id=second x=50 y=50 width=50 height=15 class=unit-layout></rect>
<rect data-id=left x=0 y=35 width=50 height=30 class=unit-layout></rect>
<rect data-id=right x=100 y=35 width=50 height=30 class=unit-layout></rect>
</g>
`
	} else {
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
	}

	// Draw in the unit in the various fwd roles
	totaladv := 0
	totalfirst := 0
	totalsecond := 0
	totalright := 0
	totalleft := 0
	totalres := 0

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
			print("rendering", v.Name, v.Committed)
			addclass := ""
			if v.Committed {
				addclass = " committed"
			}
			switch v.Role {
			case shared.RoleReserve:
				if (res % 2) != 0 {
					x = xx / 2
				} else {
					x = 0
				}
				x += 2
				y = 70 + (res/2)*7

				html += svgG(v.ID)
				html += svgText(x, y, "text__unit"+addclass, v.Name)
				html += svgEndG()
				res++
			case shared.RoleAdvance:
				x = 32
				if Session.Orientation == "Landscape" {
					x = 52
				}
				y = 25
				html += svgG(v.ID)
				html += svgText(x, y, "text__unit"+addclass, v.Name)
				html += svgEndG()
				adv++
			case shared.Role1:
				x = 32
				if Session.Orientation == "Landscape" {
					x = 52
				}
				y = 40
				if first == 1 {
					x += 2
					y += 6
				}
				html += svgG(v.ID)
				html += svgText(x, y, "text__unit"+addclass, v.Name)
				html += svgEndG()
				first++
			case shared.Role2:
				x = 32
				if Session.Orientation == "Landscape" {
					x = 52
				}
				y = 55
				if second == 1 {
					x += 2
					y += 6
				}
				html += svgG(v.ID)
				html += svgText(x, y, "text__unit"+addclass, v.Name)
				html += svgEndG()
				second++
			case shared.RoleRight:
				x = 75
				if Session.Orientation == "Landscape" {
					x = 102
				}
				y = 40
				// html += svgG(v.ID)
				svgID = v.ID
				if Session.Orientation == "Landscape" {
					html += fmt.Sprintf(`<g id=g-%d transform=rotate(33,105,50)>`, v.ID)
				} else {
					html += fmt.Sprintf(`<g id=g-%d transform=rotate(33,70,30)>`, v.ID)
				}
				html += svgText(x, y, "text__unit"+addclass, v.Name)
				html += svgEndG()
				right++
			case shared.RoleLeft:
				x = -5
				if Session.Orientation == "Landscape" {
					x = 0
				}
				y = 40
				// html += svgG(v.ID)
				svgID = v.ID
				if Session.Orientation == "Landscape" {
					html += fmt.Sprintf(`<g id=g-%d transform=rotate(-33,20,40)>`, v.ID)
				} else {
					html += fmt.Sprintf(`<g id=g-%d transform=rotate(-33,30,30)>`, v.ID)
				}
				html += svgText(x, y, "text__unit"+addclass, v.Name)
				html += svgEndG()
				left++
			}
		}
	}

	html += svgG(100)
	html += fmt.Sprintf(`<rect x=0 y=88 rx=2 ry=2 width=%d height=12 class="reorg-button" data-id=100></rect>`, xx)
	html += "\n"
	html += svgText(xx/2, 97, "text__carryon text__middle", "Done")
	html += svgEndG()
	g.SetInnerHTML(html)

	svgCallback(100, func(dom.Event) {
		// print("done")
		// get all selected units
		go func() {
			for _, el := range g.QuerySelectorAll(".unit-selected") {
				id, _ := strconv.Atoi(el.GetAttribute("data-id"))
				// print("adding in", id)
				done := false
				err := RPC("GameRPC.CommitToFight", shared.FightData{
					Channel: Session.Channel,
					GameID:  game.ID,
					ID:      fight.ID,
					DivID:   id,
				}, &done)
				if err != nil {
					print(err.Error())
				} else {
					u := game.GetUnit(team, id)
					u.Committed = true
					if team == "blue" {
						fight.Blue = append(fight.Blue, u)
					} else {
						fight.Red = append(fight.Red, u)
					}
				}
			}
			doFight(game, fight)
		}()
	})

	for _, v := range cmd.Units {
		if v.UType == shared.UnitDiv {
			svgCallback(v.ID, func(evt dom.Event) {
				el := evt.Target()
				// id, _ := strconv.Atoi(el.GetAttribute("data-id"))
				if el.TagName() == "text" {
					if !el.Class().Contains("committed") {
						el.Class().Toggle("unit-selected")
					}
				}
			})
		}
	}

	svgCallbackQuery("#help", func(dom.Event) {
		loadTemplate("unit-org", "#unit-details", nil)
		doc.QuerySelector("#unit-details").Class().Add("md-show")
		doc.QuerySelector("[name=unit-org]").AddEventListener("click", false, func(evt dom.Event) {
			doc.QuerySelector("#unit-details").Class().Remove("md-show")
		})
	})
}

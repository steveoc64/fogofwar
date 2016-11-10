package main

import (
	"fmt"
	"strconv"

	"./shared"
	"honnef.co/go/js/dom"
)

func doBB(game *shared.Game) {
	w := dom.GetWindow()
	doc := w.Document()
	c := doc.QuerySelector("[name=svg-console]")
	g := c.QuerySelector("[name=g-main]")
	html := ""
	xx := 100
	if Session.Orientation == "Landscape" {
		consoleSetViewBox(game, 150, 100, false)
		xx = 150
	} else {
		consoleSetViewBox(game, 100, 100, false)
	}
	consolePhaseBusy(game, "BB")
	// print("phaseBB")

	team := "blue"
	cmds := game.BlueCmd
	if game.Red {
		team = "red"
		cmds = game.RedCmd
	}

	html = svgText(0, 10, fmt.Sprintf("text__2x text__%s", team), "Fire!")
	html += svgText(0, 15, fmt.Sprintf("text__1x text__%s", team), "Units available:")
	html += svgHelpBtn()

	x := 0
	y := 20
	count := 0
	ids := []int{}
	for _, v := range cmds {
		// print("check bb", v.PlayerID, Session.UserID)
		if v.PlayerID == Session.UserID {
			// print("got", v)
			// is under my command
			if v.CanBombard() {
				html += svgG(v.ID)
				html += svgButton(x, y, xx, 10, "console-corps-button", "text__1x text__"+team, v.Name)
				html += svgEndG()
				count++
				ids = append(ids, v.ID)
			}
		}
	}

	html += svgG(100)
	html += fmt.Sprintf(`<rect x=0 y=88 rx=2 ry=2 width=%d height=12 class="carryon-button" data-id=100></rect>`, xx)
	html += "\n"
	if count == 0 {
		html += svgText(xx/2, 97, "text__carryon text__middle", "Nothing to Fire")
	} else {
		html += fmt.Sprintf(`<image xlink:href=/img/bombardment.png x=%d y=0 height=15 width=50></image>`, xx-60)
		html += svgText(xx/2, 97, "text__carryon text__middle", "Cease Fire")
	}
	html += svgEndG()
	g.SetInnerHTML(html)

	svgCallback(100, func(dom.Event) {
		// print("cease fire")
		consolePhaseNotBusy(game)
	})

	svgCallbackQuery("#help", func(dom.Event) {
		loadTemplate("bombardment", "#unit-details", nil)
		doc.QuerySelector("#unit-details").Class().Add("md-show")
		doc.QuerySelector("[name=bombardment]").AddEventListener("click", false, func(evt dom.Event) {
			doc.QuerySelector("#unit-details").Class().Remove("md-show")
		})
	})

	for _, v := range ids {
		svgCallback(v, func(evt dom.Event) {
			el := evt.Target()
			id, _ := strconv.Atoi(el.GetAttribute("data-id"))
			cmd := game.GetCmd(team, id)
			// print("click on cmd", cmd)
			doBB2(game, cmd)
		})
	}

}

func doBB2(game *shared.Game, cmd *shared.GameCmd) {
	w := dom.GetWindow()
	doc := w.Document()
	c := doc.QuerySelector("[name=svg-console]")
	g := c.QuerySelector("[name=g-main]")
	html := ""
	consoleCurrentCmd = cmd
	xx := 100
	if Session.Orientation == "Landscape" {
		consoleSetViewBox(game, 150, 100, false)
		xx = 150
	} else {
		consoleSetViewBox(game, 100, 100, false)
	}
	consolePhaseBusy(game, "BB2")
	// print("phaseBB2")

	team := "blue"
	if game.Red {
		team = "red"
	}

	html = svgText(0, 10, fmt.Sprintf("text__2x text__%s", team), "Fire!")
	html += svgText(0, 15, fmt.Sprintf("text__1x text__%s", team), cmd.Name)
	html += svgHelpBtn()

	// get a prelim count
	total := 0
	for _, v := range cmd.Units {
		if v.CanBombard(cmd) {
			total++
		}
	}

	x := 0
	y := 20
	ids := []int{}
	divName := ""
	count := 0
	for _, v := range cmd.Units {
		if v.UType == shared.UnitDiv {
			divName = v.Name
		}
		if v.CanBombard(cmd) {
			ids = append(ids, v.ID)
			html += svgG(v.ID)
			if total > 4 {
				if v.Bombard == nil || v.Bombard.ID == 0 {
					html += svgButton(x, y, xx/2, 15, "console-corps-button", "", "")
				} else {
					html += svgButton(x, y, xx/2, 15, "console-corps-disabled", "", "")
					html += fmt.Sprintf(`<circle data-id=%d class=help-button cx=%d cy=%d r=5></circle><text data-id=%d x=%d y=%d class="text__gold text__2x">%d</text>`,
						v.ID, xx/2-8, y+6, v.ID, xx/2-10, y+8, v.Bombard.ID)
				}
				html += svgText(x+3, y+5, "text__1x text__"+team, divName)
				html += svgText(x+3, y+10, "text__0x text__"+team, v.Name)
				html += svgText(xx/2-4, y+13, "text__end text__0x text__tiny", v.GetGuns())
				html += svgEndG()
				if x == 0 {
					x = xx / 2
				} else {
					x = 0
					y += 16
				}
			} else {
				if v.Bombard == nil || v.Bombard.ID == 0 {
					html += svgButton(x, y, xx, 15, "console-corps-button", "", "")
				} else {
					html += svgButton(x, y, xx, 15, "console-corps-disabled", "", "")
					html += fmt.Sprintf(`<circle data-id=%d class=help-button cx=%d cy=%d r=5></circle><text data-id=%d x=%d y=%d class="text__gold text__2x">%d</text>`,
						v.ID, xx/2+15, y+8, v.ID, xx/2+13, y+10, v.Bombard.ID)
				}
				html += svgText(x+3, y+6, "text__1x text__"+team, divName)
				html += svgText(20+x+3, y+12, "text__middle text__0x text__"+team, v.Name)
				html += svgText(xx-2, y+9, "text__end text__0x", v.GetGuns())
				html += svgEndG()
				y += 16
			}
			count++
		}
	}

	html += svgG(100)
	html += fmt.Sprintf(`<rect x=0 y=88 rx=2 ry=2 width=%d height=12 class="carryon-button" data-id=100></rect>`, xx)
	html += "\n"
	if count == 0 {
		html += svgText(xx/2, 97, "text__carryon text__middle", "Nothing to Fire")
	} else {
		html += fmt.Sprintf(`<image xlink:href=/img/bombardment.png x=%d y=0 height=15 width=50></image>`, xx-60)
		html += svgText(xx/2, 97, "text__carryon text__middle", "Cease Fire")
	}
	html += svgEndG()
	g.SetInnerHTML(html)

	svgCallback(100, func(dom.Event) {
		doBB(game)
	})

	svgCallbackQuery("#help", func(dom.Event) {
		loadTemplate("bombardment", "#unit-details", nil)
		doc.QuerySelector("#unit-details").Class().Add("md-show")
		doc.QuerySelector("[name=bombardment]").AddEventListener("click", false, func(evt dom.Event) {
			doc.QuerySelector("#unit-details").Class().Remove("md-show")
		})
	})

	for _, v := range ids {
		svgCallback(v, func(evt dom.Event) {
			el := evt.Target()
			id, _ := strconv.Atoi(el.GetAttribute("data-id"))
			unit := game.GetUnit(team, id)
			// print("unit", team, id, unit)
			if unit.Bombard != nil && unit.Bombard.ID != 0 {
				if w.Confirm("Cancel this Fire Mission ?") {
					go func() {
						done := false
						err := RPC("GameRPC.CancelShot", shared.BombardData{
							Channel: Session.Channel,
							GameID:  game.ID,
							ID:      unit.Bombard.ID,
							Bombard: unit.Bombard,
						}, &done)
						if err != nil {
							print(err.Error())
						}
					}()
				}
			} else {
				doBB3(game, cmd, unit)
			}
		})
	}
}

func doBB3(game *shared.Game, cmd *shared.GameCmd, unit *shared.Unit) {
	w := dom.GetWindow()
	doc := w.Document()
	c := doc.QuerySelector("[name=svg-console]")
	g := c.QuerySelector("[name=g-main]")
	html := ""
	bb := shared.Bombard{}

	consoleCurrentCmd = cmd
	consoleCurrentUnit = unit
	xx := 100
	if Session.Orientation == "Landscape" {
		consoleSetViewBox(game, 150, 100, false)
		xx = 150
	} else {
		consoleSetViewBox(game, 100, 100, false)
	}
	consolePhaseBusy(game, "BB3")
	// print("phaseBB3", game, cmd, unit)

	team := "blue"
	enemy := game.RedPlayers
	enemyTeam := "red"
	if game.Red {
		team = "red"
		enemyTeam = "blue"
		enemy = game.BluePlayers
	}

	html = svgText(0, 10, fmt.Sprintf("text__2x text__%s", team), "Fire!")
	html += svgText(10, 20, fmt.Sprintf("text__1x text__%s", team), unit.Name+" ~ "+unit.GetGuns())
	html += svgText(10, 26, fmt.Sprintf("text__1x text__%s", team), "Select Enemy Player:")
	html += svgHelpBtn()

	html += `<g id=fire>`
	html += fmt.Sprintf(`<rect x=0 y=88 rx=2 ry=2 width=%d height=12 class="fire-button" data-id=100></rect>`, xx)
	html += fmt.Sprintf(`<image xlink:href=/img/bombardment.png x=%d y=0 height=15 width=50></image>`, xx-60)
	html += svgText(xx/2, 97, "text__carryon text__middle", "Fire")
	html += `</g>`

	y := 30
	x := 0
	for _, v := range enemy {
		// print("enemy", enemy)
		html += svgG(v.PlayerID)
		// html += svgText(x+10, y, "text__2x text__"+enemyTeam, v.Username)
		html += svgButton(x, y, xx/2-1, 10, "console-corps-button", "text__1x text__"+enemyTeam, v.Username)
		html += fmt.Sprintf(`<image xlink:href=%s x=%d y=%d height=8 width=8></image>`, v.Avatar, x+(xx/2)-20, y+1)
		html += svgTick(fmt.Sprintf("select-%d", v.PlayerID), "tick hidden", x+(xx/2)-12, y, 10)
		html += svgEndG()
		if x == 0 {
			x = xx / 2
		} else {
			x = 0
			y += 12
		}
	}

	maxRange := unit.GetGunRange()
	html += svgText(20, 74, "text__0x", "Range:")
	html += `<g id=range>`
	x = 0
	if maxRange > 0 {
		rangeBands := (xx - 40) / maxRange
		for r := 1; r <= maxRange; r++ {
			html += fmt.Sprintf(`<rect data-id=%d x=%d y=75 width=%d height=11 class=range-bands></rect>`,
				r, (r-1)*rangeBands+20, rangeBands)
			html += svgText((r*rangeBands-1)+20, 74, "text__0x text__tiny text_end", fmt.Sprintf("%dm", r*400))
		}
	}
	html += `</g>`

	// add a gun model on top of the range band
	html += `<image xlink:href=/img/gun.png x=7 y=73 height=16 width=16></image>`
	g.SetInnerHTML(html)

	svgCallbackQuery("#fire", func(dom.Event) {
		// print("Fire")

		// Get the defending ID
		bb.GameID = game.ID
		bb.UnitID = unit.ID
		bb.TargetID = 0
		bb.TargetUID = 0
		bb.RangeMax = 0
		bb.RangeMin = 0

		for _, v := range enemy {
			elc := doc.QuerySelector(fmt.Sprintf("#select-%d", v.PlayerID)).Class()
			if !elc.Contains("hidden") {
				bb.TargetID = v.PlayerID
				break
			}
		}
		if bb.TargetID == 0 {
			// No target selected yet
			return
		}
		ranges := doc.QuerySelector("#range").QuerySelectorAll("rect")
		for i, v := range ranges {
			if v.Class().Contains("range-selected") {
				// print("range ", i+1, "appears set")
				if i+1 > bb.RangeMax {
					bb.RangeMax = i + 1
				}
				if bb.RangeMin == 0 {
					bb.RangeMin = i + 1
				}
			}
		}
		// print("bb", bb)
		if bb.RangeMax > 0 && bb.TargetID != 0 {
			// print("looks ok")
			go func() {
				newBB := shared.Bombard{}
				err := RPC("GameRPC.Bombard", shared.BombardData{
					Channel: Session.Channel,
					Bombard: &bb,
				}, &newBB)
				if err != nil {
					print(err.Error())
				} else {
					// print("BB fire mission submitted - wait for reply to repaint us")
				}
			}()
		}
	})

	svgCallbackQuery("#range", func(evt dom.Event) {
		el := evt.Target()
		id, _ := strconv.Atoi(el.GetAttribute("data-id"))
		// print("range is set to", id)
		if id > 0 {
			el.Class().Toggle("range-selected")
		} else {
			print("no range on this item")
		}

	})

	svgCallbackQuery("#help", func(dom.Event) {
		loadTemplate("bombardment", "#unit-details", nil)
		doc.QuerySelector("#unit-details").Class().Add("md-show")
		doc.QuerySelector("[name=bombardment]").AddEventListener("click", false, func(evt dom.Event) {
			doc.QuerySelector("#unit-details").Class().Remove("md-show")
		})
	})

	for _, v := range enemy {
		svgCallback(v.PlayerID, func(evt dom.Event) {
			el := evt.Target()
			id, _ := strconv.Atoi(el.GetAttribute("data-id"))
			// print("selected enemy", id)

			for _, v := range enemy {
				elc := doc.QuerySelector(fmt.Sprintf("#select-%d", v.PlayerID)).Class()
				if v.PlayerID == id {
					elc.Remove("hidden")
				} else {
					elc.Add("hidden")
				}
			}
		})
	}
}

func doBBReceive(game *shared.Game, id int, bb string) {
	w := dom.GetWindow()
	doc := w.Document()
	c := doc.QuerySelector("[name=svg-console]")
	g := c.QuerySelector("[name=g-main]")
	html := ""
	xx := 100
	if Session.Orientation == "Landscape" {
		consoleSetViewBox(game, 150, 100, false)
		xx = 150
	} else {
		consoleSetViewBox(game, 100, 100, false)
	}
	consolePhaseBusy(game, "BBReceive")
	// print("phaseBBReceive")

	team := "blue"
	cmds := game.BlueCmd
	if game.Red {
		team = "red"
		cmds = game.RedCmd
	}

	html = svgText(0, 10, fmt.Sprintf("text__2x text__%s", team), fmt.Sprintf("Incoming! (%d)", id))
	html += svgText(0, 18, fmt.Sprintf("text__1x text__%s", team), bb)
	html += svgHelpBtn()

	x := 0
	y := 20
	count := 0
	ids := []int{}
	for _, v := range cmds {
		if v.PlayerID == Session.UserID {
			// is under my command
			html += svgG(v.ID)
			html += svgButton(x, y, xx, 10, "console-corps-button", "text__1x text__"+team, v.Name)
			html += svgEndG()
			count++
			y += 11
			ids = append(ids, v.ID)
		}
	}

	g.SetInnerHTML(html)

	svgCallbackQuery("#help", func(dom.Event) {
		loadTemplate("bombardment", "#unit-details", nil)
		doc.QuerySelector("#unit-details").Class().Add("md-show")
		doc.QuerySelector("[name=bombardment]").AddEventListener("click", false, func(evt dom.Event) {
			doc.QuerySelector("#unit-details").Class().Remove("md-show")
		})
	})

	for _, v := range ids {
		svgCallback(v, func(evt dom.Event) {
			el := evt.Target()
			uid, _ := strconv.Atoi(el.GetAttribute("data-id"))
			cmd := game.GetCmd(team, uid)
			print("click on cmd", cmd)
			doBBReceive2(game, cmd, id, bb)
		})
	}
}

func doBBReceive2(game *shared.Game, cmd *shared.GameCmd, id int, bb string) {
	w := dom.GetWindow()
	doc := w.Document()
	c := doc.QuerySelector("[name=svg-console]")
	g := c.QuerySelector("[name=g-main]")
	html := ""
	xx := 100
	if Session.Orientation == "Landscape" {
		consoleSetViewBox(game, 150, 100, false)
		xx = 150
	} else {
		consoleSetViewBox(game, 100, 100, false)
	}
	consoleCurrentCmd = cmd
	consolePhaseBusy(game, "BBReceive2")

	team := "blue"
	if game.Red {
		team = "red"
	}

	html += svgText(0, 10, fmt.Sprintf("text__2x text__%s", team), fmt.Sprintf("Incoming (%d)", id))
	html += svgText(0, 18, "text__1x text__"+team, bb)
	html += svgHelpBtn()

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

	adv := 0
	first := 0
	second := 0
	right := 0
	left := 0
	res := 0
	x := 0
	y := 0
	selectedElement := 0

	// render all the things
	for _, v := range cmd.Units {
		if v.UType == shared.UnitDiv {
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
				html += svgText(x, y, "text__unit", v.Name)
				html += svgEndG()
				res++
			case shared.RoleAdvance:
				x = 32
				if Session.Orientation == "Landscape" {
					x = 52
				}
				y = 25
				html += svgG(v.ID)
				html += svgText(x, y, "text__unit", v.Name)
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
				html += svgText(x, y, "text__unit", v.Name)
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
				html += svgText(x, y, "text__unit", v.Name)
				html += svgEndG()
				second++
			case shared.RoleRight:
				x = 75
				if Session.Orientation == "Landscape" {
					x = 102
				}
				y = 50
				// html += svgG(v.ID)
				svgID = v.ID
				if Session.Orientation == "Landscape" {
					html += fmt.Sprintf(`<g id=g-%d transform=rotate(33,105,50)>`, v.ID)
				} else {
					html += fmt.Sprintf(`<g id=g-%d transform=rotate(33,80,50)>`, v.ID)
				}
				html += svgText(x, y, "text__unit", v.Name)
				html += svgEndG()
				right++
			case shared.RoleLeft:
				x = -5
				if Session.Orientation == "Landscape" {
					x = 0
				}
				y = 50
				// html += svgG(v.ID)
				svgID = v.ID
				if Session.Orientation == "Landscape" {
					html += fmt.Sprintf(`<g id=g-%d transform=rotate(-33,20,50)>`, v.ID)
				} else {
					html += fmt.Sprintf(`<g id=g-%d transform=rotate(-33,20,50)>`, v.ID)
				}
				html += svgText(x, y, "text__unit", v.Name)
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
		if selectedElement != 0 {
			// print("done", selectedElement)
			// TODO - signal backend that incoming bombardment hits uint X
			// then go back to main page
			go func() {
				done := false
				err := RPC("GameRPC.ComputeBombard", shared.BombardData{
					Channel: Session.Channel,
					GameID:  game.ID,
					ID:      id,
					Bombard: &shared.Bombard{
						TargetUID: selectedElement,
					},
				}, &done)
				if err != nil {
					print(err.Error())
					// } else {
					// print("looks to be done ... wait here till the result comes back")
				}
			}()
		} else {
			print("nothing selected yet")
		}
	})

	for _, v := range cmd.Units {
		if v.UType == shared.UnitDiv {
			svgCallback(v.ID, func(evt dom.Event) {
				el := evt.Target()
				id, _ := strconv.Atoi(el.GetAttribute("data-id"))
				if el.TagName() == "text" {
					// double click to inspect unit
					if id == selectedElement {
						consoleSubunits = cmd.Units
						div := game.GetUnit(team, id)
						div.Summary = div.GetSummary(cmd)
						print("div", div)
						clickDiv(evt)
					} else {
						// deselect all
						m := doc.QuerySelector("[name=g-main]")
						for _, sel := range m.QuerySelectorAll("text") {
							sel.Class().Remove("unit-selected")
						}
						el.Class().Toggle("unit-selected")
						selectedElement = id
					}
				}
			})
		}
	}

	svgCallbackQuery("#help", func(dom.Event) {
		loadTemplate("bombardment", "#unit-details", nil)
		doc.QuerySelector("#unit-details").Class().Add("md-show")
		doc.QuerySelector("[name=bombardment]").AddEventListener("click", false, func(evt dom.Event) {
			doc.QuerySelector("#unit-details").Class().Remove("md-show")
		})
	})
}

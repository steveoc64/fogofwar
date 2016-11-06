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

	consoleSetViewBox(game, 100, 100, false)
	consolePhaseBusy(game, "BB")
	print("phaseBB")

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
		if v.PlayerID == Session.UserID {
			// is under my command
			if v.CanBombard() {
				html += svgG(v.ID)
				html += svgButton(x, y, 100, 10, "console-corps-button", "text__1x text__"+team, v.Name)
				html += svgEndG()
				count++
				ids = append(ids, v.ID)
			}
		}
	}

	html += svgG(100)
	html += `<rect x=0 y=88 rx=2 ry=2 width=100 height=12 class="carryon-button" data-id=100></rect>`
	html += "\n"
	if count == 0 {
		html += svgText(50, 97, "text__carryon text__middle", "Nothing to Fire")
	} else {
		html += `<image xlink:href=/img/bombardment.png x=40 y=0 height=15 width=50></image>`
		html += svgText(50, 97, "text__carryon text__middle", "Cease Fire")
	}
	html += svgEndG()
	g.SetInnerHTML(html)

	svgCallback(100, func(dom.Event) {
		print("cease fire")
		consolePhaseDone(game)
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
			print("click on cmd", cmd)
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

	consoleSetViewBox(game, 100, 100, false)
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
				if v.Bombard == nil {
					html += svgButton(x, y, 48, 15, "console-corps-button", "", "")
				} else {
					html += svgButton(x, y, 48, 15, "console-corps-disabled", "", "")
					html += fmt.Sprintf(`<circle class=help-button cx=%d cy=%d r=5></circle><text x=%d y=%d class="text__gold text__2x">%d</text>`,
						x+42, y+6, x+40, y+8, v.Bombard.ID)
				}
				html += svgText(x+3, y+5, "text__1x text__"+team, divName)
				html += svgText(x+3, y+10, "text__0x text__"+team, v.Name)
				html += svgText(x+46, y+13, "text__end text__0x text__tiny", v.GetGuns())
				html += svgEndG()
				if x == 0 {
					x = 50
				} else {
					x = 0
					y += 16
				}
			} else {
				if v.Bombard == nil {
					html += svgButton(x, y, 100, 15, "console-corps-button", "", "")
				} else {
					html += svgButton(x, y, 100, 15, "console-corps-disabled", "", "")
					html += fmt.Sprintf(`<circle class=help-button cx=%d cy=%d r=5></circle><text x=%d y=%d class="text__gold text__2x">%d</text>`,
						x+65, y+8, x+63, y+10, v.Bombard.ID)
				}
				html += svgText(x+3, y+6, "text__1x text__"+team, divName)
				html += svgText(20+x+3, y+12, "text__middle text__0x text__"+team, v.Name)
				html += svgText(98, y+9, "text__end text__0x", v.GetGuns())
				html += svgEndG()
				y += 16
			}
			count++
		}
	}

	html += svgG(100)
	html += `<rect x=0 y=88 rx=2 ry=2 width=100 height=12 class="carryon-button" data-id=100></rect>`
	html += "\n"
	if count == 0 {
		html += svgText(50, 97, "text__carryon text__middle", "Nothing to Fire")
	} else {
		html += `<image xlink:href=/img/bombardment.png x=40 y=0 height=15 width=50></image>`
		html += svgText(50, 97, "text__carryon text__middle", "Cease Fire")
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
			print("unit", team, id, unit)
			doBB3(game, cmd, unit)
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

	consoleSetViewBox(game, 100, 100, false)
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
	html += `<rect x=0 y=88 rx=2 ry=2 width=100 height=12 class="carryon-button" data-id=100></rect>`
	html += "\n"
	html += `<image xlink:href=/img/bombardment.png x=40 y=0 height=15 width=50></image>`
	html += svgText(50, 97, "text__carryon text__middle", "Fire")
	html += `</g>`

	y := 30
	x := 0
	for _, v := range enemy {
		print("enemy", enemy)
		html += svgG(v.PlayerID)
		// html += svgText(x+10, y, "text__2x text__"+enemyTeam, v.Username)
		html += svgButton(x, y, 49, 10, "console-corps-button", "text__1x text__"+enemyTeam, v.Username)
		html += fmt.Sprintf(`<image xlink:href=%s x=%d y=%d height=8 width=8></image>`, v.Avatar, x+30, y+1)
		html += svgTick(fmt.Sprintf("select-%d", v.PlayerID), "tick hidden", x+38, y, 10)
		html += svgEndG()
		if x == 0 {
			x = 50
		} else {
			x = 0
			y += 12
		}
	}

	maxRange := unit.GetGunRange()
	html += svgText(0, 74, "text__0x", "Range:")
	html += `<g id=range>`
	x = 0
	if maxRange > 0 {
		rangeBands := 100 / maxRange
		for r := 1; r <= maxRange; r++ {
			html += fmt.Sprintf(`<rect data-id=%d x=%d y=75 width=%d height=11 class=range-bands></rect>`,
				r, (r-1)*rangeBands, rangeBands)
			html += svgText(r*rangeBands-1, 74, "text__0x text__tiny text_end", fmt.Sprintf("%dm", r*400))
		}
	}
	html += `</g>`

	// add a gun model on top of the range band
	html += `<image xlink:href=/img/gun.png x=-5 y=76 height=12 width=12></image>`
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

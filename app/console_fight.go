package main

import (
	"fmt"

	"./shared"
	"honnef.co/go/js/dom"
)

func doFight(game *shared.Game, fight *shared.Fight) {
	w := dom.GetWindow()
	doc := w.Document()
	c := doc.QuerySelector("[name=svg-console]")
	html := ""
	xx := 100
	if Session.Orientation == "Landscape" {
		consoleSetViewBox(game, 150, 100, false)
		xx = 150
	} else {
		consoleSetViewBox(game, 100, 100, false)
	}
	consolePhaseBusy(game, "Fight")
	consoleCurrentFight = fight

	// Add a turn summary object
	g := c.QuerySelector("[name=g-main]")

	team := "blue"
	units := fight.Blue
	enemy := fight.Red
	enemyteam := "red"
	if game.Red {
		team = "red"
		units = fight.Red
		enemy = fight.Blue
		enemyteam = "blue"
	}
	print("enemy", enemy, enemyteam)

	html = svgText(4, 10, fmt.Sprintf("text__2x text__%s", team), "Fight -")
	html += svgText(40, 8, "text__1x text__"+team, fight.Name)

	if Session.Orientation == "Landscape" {
		html += fmt.Sprintf(`<image xlink:href=/img/fight.png x=%d y=0 height=15 width=50></image>`, xx-60)
	}
	html += svgHelpBtn()

	html += svgG(100)
	html += fmt.Sprintf(`<rect x=50 y=88 rx=2 ry=2 width=%d height=12 class="carryon-button" data-id=100></rect>`, xx-50)
	html += svgText(50+(xx-50)/2, 97, "text__carryon text__middle", "Done")
	html += svgEndG()

	html += svgG(101)
	html += fmt.Sprintf(`<rect x=0 y=88 rx=2 ry=2 width=%d height=12 class="reorg-button" data-id=100></rect>`, 50)
	html += svgText(25, 97, "text__carryon text__middle", "Add Unit")
	html += svgEndG()

	terrain := ""
	if fight.Rough {
		terrain += "Rough Ground"
	}
	if fight.Woods {
		if terrain != "" {
			terrain += ", "
		}
		terrain += "Woods"
	}
	if fight.Built {
		if terrain != "" {
			terrain += ", "
		}
		terrain += "Buildings"
	}
	if fight.Fort {
		if terrain != "" {
			terrain += ", "
		}
		terrain += "Fort"
	}
	if terrain == "" {
		terrain = "Clear"
	}
	html += svgText(5, 18, "text__1x text__"+team, "Terrain: "+terrain)

	// Now list the bdes in this fight, on our side
	left := 0
	right := 0
	center := 0
	advance := 0
	baseline := 60
	for _, v := range units {
		subs := v.GetSubunits(game.GetCmd(team, v.CmdID))
		for _, u := range subs {
			x := 0
			y := 0
			switch u.Role {
			case shared.RoleReserve:
				// skip this unit
			case shared.RoleAdvance:
				x = xx / 3
				y = baseline + (advance * 6) - 12
				advance++
			case shared.Role1:
				x = xx / 3
				y = baseline + (center * 6)
				center++
			case shared.Role2:
				x = xx / 3
				y = baseline + (center * 6)
				center++
			case shared.RoleRight:
				x = 2 * (xx / 3)
				y = baseline + (right * 6) + 3
				right++
			case shared.RoleLeft:
				x = 0
				y = baseline + (left * 6) + 3
				left++
			}
			print("unit", u, x, y)
			if y > 0 && u.UType != shared.UnitDiv {
				html += svgG(u.ID)
				// html += svgText(x, y, "text__middle text__1x text__"+team, v.Name)
				html += svgButton(x, y, xx/3, 6, "console-corps-button", "text__1x text__"+team, u.Name)
				html += svgEndG()
			}
		}
	}

	// now list the enemy units committed to the fight, but only if we have something committed as well
	if len(units) > 0 {
		left = 0
		right = 0
		center = 0
		advance = 0
		baseline = 30
		for _, v := range enemy {
			subs := v.GetSubunits(game.GetCmd(enemyteam, v.CmdID))
			for _, u := range subs {
				x := 0
				y := 0
				switch u.Role {
				case shared.RoleReserve:
					// skip this unit
				case shared.RoleAdvance:
					x = xx / 3
					y = baseline + (advance * -6) + 12
					advance++
				case shared.Role1:
					x = xx / 3
					y = baseline + (center * -6)
					center++
				case shared.Role2:
					// hide the enemy second line
				case shared.RoleLeft: // mirror image - their left is our right
					x = 2 * (xx / 3)
					y = baseline + (right * -6) - 3
					right++
				case shared.RoleRight: // mirror image - their right is our left
					x = 0
					y = baseline + (left * -6) - 3
					left++
				}
				print("unit", u, x, y)
				if y > 0 && u.UType != shared.UnitDiv {
					html += svgG(u.ID)
					// html += svgText(x, y, "text__middle text__1x text__"+team, v.Name)
					html += svgButton(x, y, xx/3, 6, "console-corps-button", "text__1x text__"+enemyteam, u.Name)
					html += svgEndG()
				}
			}
		}

	}

	g.SetInnerHTML(html)

	svgCallback(100, func(dom.Event) {
		consolePhaseNotBusy(game)
	})
	svgCallback(101, func(dom.Event) {
		doCommitFight(game, fight)
	})

	svgCallbackQuery("#help", func(dom.Event) {
		loadTemplate("fight", "#unit-details", nil)
		doc.QuerySelector("#unit-details").Class().Add("md-show")
		doc.QuerySelector("[name=fight]").AddEventListener("click", false, func(evt dom.Event) {
			doc.QuerySelector("#unit-details").Class().Remove("md-show")
		})
	})

}

func doNewFight(game *shared.Game) {
	w := dom.GetWindow()
	doc := w.Document()
	c := doc.QuerySelector("[name=svg-console]")
	html := ""
	xx := 100
	if Session.Orientation == "Landscape" {
		consoleSetViewBox(game, 150, 100, false)
		xx = 150
	} else {
		consoleSetViewBox(game, 100, 100, false)
	}
	consolePhaseBusy(game, "NewFight")

	// Add a turn summary object
	g := c.QuerySelector("[name=g-main]")

	team := "blue"
	if game.Red {
		team = "red"
	}

	html = svgText(4, 10, fmt.Sprintf("text__2x text__%s", team), "Create New Fight")

	html += svgText(5, 30, "text__2x text__"+team, "Name")

	html += `<rect class="console-corps-button" x=40 y=20 width=100 height=15></rect>`
	html += `<text id=fight-name xml:space="preserve" class="text__2x text__black" x=40 y=30></text>`

	if Session.Orientation == "Landscape" {
		html += fmt.Sprintf(`<image xlink:href=/img/fight.png x=%d y=0 height=15 width=50></image>`, xx-60)
	}
	html += svgHelpBtn()

	html += svgG(100)
	html += fmt.Sprintf(`<rect x=0 y=88 rx=2 ry=2 width=%d height=12 class="carryon-button" data-id=100></rect>`, xx)
	html += "\n"
	html += svgText(xx/2, 97, "text__carryon text__middle", "Add")
	html += svgEndG()

	// Choose the type of terrain

	html += svgG(200)
	html += svgText(3, 50, "text__question", "Rough")
	html += `<rect class=console-check x=40 y=42 rx=2 ry=2 width=10 height=10 data-id=1></rect>`
	html += svgTick("rough", "tick hidden", 40, 42, 10)
	html += svgEndG()

	html += svgG(201)
	html += svgText(3, 60, "text__question", "Woods")
	html += `<rect class=console-check x=40 y=52 rx=2 ry=2 width=10 height=10 data-id=1></rect>`
	html += svgTick("woods", "tick hidden", 40, 52, 10)
	html += svgEndG()

	html += svgG(202)
	html += svgText(3, 70, "text__question", "Buildings")
	html += `<rect class=console-check x=40 y=62 rx=2 ry=2 width=10 height=10 data-id=1></rect>`
	html += svgTick("built", "tick hidden", 40, 62, 10)
	html += svgEndG()

	html += svgG(203)
	html += svgText(3, 80, "text__question", "Fort")
	html += `<rect class=console-check x=40 y=72 rx=2 ry=2 width=10 height=10 data-id=1></rect>`
	html += svgTick("fort", "tick hidden", 40, 72, 10)
	html += svgEndG()

	g.SetInnerHTML(html)

	entryField := doc.QuerySelector("#fight-name").(*dom.BasicHTMLElement)
	entryField.SetInnerHTML("")

	allDone := func() {
		w.RemoveEventListener("keydown", false, keyGrabber)
		keyGrabber = nil
		rough := !doc.QuerySelector("#rough").Class().Contains("hidden")
		woods := !doc.QuerySelector("#woods").Class().Contains("hidden")
		built := !doc.QuerySelector("#built").Class().Contains("hidden")
		fort := !doc.QuerySelector("#fort").Class().Contains("hidden")
		t := entryField.InnerHTML()
		go func() {
			done := false
			err := RPC("GameRPC.NewFight", shared.FightData{
				Channel: Session.Channel,
				Fight: &shared.Fight{
					GameID: game.ID,
					Name:   t,
					Rough:  rough,
					Woods:  woods,
					Built:  built,
					Fort:   fort,
				},
			}, &done)
			if err != nil {
				print(err.Error())
			} else {
				consolePhaseNotBusy(game)
			}
		}()
	}

	svgCallback(100, func(dom.Event) {
		allDone()
	})

	keyGrabber = w.AddEventListener("keydown", false, func(evt dom.Event) {
		k := evt.(*dom.KeyboardEvent)
		// print("global keypress", k.CharCode, k.Key, k.KeyCode)
		t := entryField.InnerHTML()
		switch k.KeyCode {
		case 8:
			t = t[:len(t)-1]
		case 46:
			t = ""
		case 32:
			t += " "
		case 13:
			allDone()
		default:
			if k.KeyCode >= 65 && k.KeyCode <= 90 {
				t = t + k.Key
			}
		}
		entryField.SetInnerHTML(t)
	})

	svgCallback(200, func(dom.Event) {
		el := doc.QuerySelector("#rough")
		if el != nil {
			el.Class().Toggle("hidden")
		}
	})
	svgCallback(201, func(dom.Event) {
		el := doc.QuerySelector("#woods")
		if el != nil {
			el.Class().Toggle("hidden")
		}
	})
	svgCallback(202, func(dom.Event) {
		el := doc.QuerySelector("#built")
		if el != nil {
			el.Class().Toggle("hidden")
		}
	})
	svgCallback(203, func(dom.Event) {
		el := doc.QuerySelector("#fort")
		if el != nil {
			el.Class().Toggle("hidden")
		}
	})

	svgCallbackQuery("#help", func(dom.Event) {
		loadTemplate("fight", "#unit-details", nil)
		doc.QuerySelector("#unit-details").Class().Add("md-show")
		doc.QuerySelector("[name=fight]").AddEventListener("click", false, func(evt dom.Event) {
			doc.QuerySelector("#unit-details").Class().Remove("md-show")
		})
	})
}

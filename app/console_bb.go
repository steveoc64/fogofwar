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
	consolePhaseBusy(game)
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
	consolePhaseBusy(game)
	print("phaseBB2")

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
				html += svgButton(x, y, 48, 15, "console-corps-button", "", "")
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
				html += svgButton(x, y, 100, 15, "console-corps-button", "", "")
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
		print("cease fire")
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

	consoleSetViewBox(game, 100, 100, false)
	consolePhaseBusy(game)
	print("phaseBB3", game, cmd, unit)

	team := "blue"
	enemy := game.RedPlayers
	if game.Red {
		team = "red"
		enemy = game.BluePlayers
	}

	html = svgText(0, 10, fmt.Sprintf("text__2x text__%s", team), "Fire!")
	html += svgText(0, 20, fmt.Sprintf("text__1x text__%s", team), unit.Name+" ~ "+unit.GetGuns())
	html += svgHelpBtn()

	html += svgG(100)
	html += `<rect x=0 y=88 rx=2 ry=2 width=100 height=12 class="carryon-button" data-id=100></rect>`
	html += "\n"
	html += `<image xlink:href=/img/bombardment.png x=40 y=0 height=15 width=50></image>`
	html += svgText(50, 97, "text__carryon text__middle", "Fire")
	html += svgEndG()
	g.SetInnerHTML(html)

	for _, v := range enemy {
		print("enemy", v)
	}

	svgCallback(100, func(dom.Event) {
		print("Fire")
		doBB2(game, cmd)
	})

	svgCallbackQuery("#help", func(dom.Event) {
		loadTemplate("bombardment", "#unit-details", nil)
		doc.QuerySelector("#unit-details").Class().Add("md-show")
		doc.QuerySelector("[name=bombardment]").AddEventListener("click", false, func(evt dom.Event) {
			doc.QuerySelector("#unit-details").Class().Remove("md-show")
		})
	})
}

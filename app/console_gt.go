package main

import (
	"fmt"
	"strconv"

	"./shared"
	"honnef.co/go/js/dom"
)

func doGT1(game *shared.Game) {
	w := dom.GetWindow()
	doc := w.Document()
	c := doc.QuerySelector("[name=svg-console]")
	g := c.QuerySelector("[name=g-main]")

	consoleSetViewBox(game, 100, 100, false)
	consolePhaseBusy(game)
	print("phaseGT1 with", game)

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
	html += svgHelpBtn()

	yoffset := 0
	count := 0
	for _, v := range cmds {
		max, min, gt := v.GTMove()
		print("unit", v.ID, "can move", max, min, gt)
		if v.PlayerID == Session.UserID {
			html += svgG(v.ID)
			if max == 0 {
				html += svgButton(0, 18+(yoffset), 100, 10, "console-corps-button-other", "text__"+team+" text__1x", v.Name)
			} else {
				count++
				html += svgButton(0, 18+(yoffset), 100, 10, "console-corps-button", "text__"+team+" text__1x", v.Name)
			}
			html += svgText(98, 25+yoffset, "text__0x text__end text__"+team, gt)
			html += svgEndG()
			yoffset += 11
		}
	}
	if count > 0 {
		html += svgText(0, 16, "text__1x text__"+team, "Corps that must Move:")
	} else {
		html += svgText(0, 16, "text__1x text__"+team, "No Movement this Turn ...")
	}
	html += svgG(100)
	html += `<rect x=0 y=88 rx=2 ry=2 width=100 height=12 class="carryon-button" data-id=100></rect>`
	html += "\n"
	html += svgText(50, 97, "text__carryon text__middle", "Movement Complete")
	html += svgEndG()
	g.SetInnerHTML(html)

	svgCallback(100, func(dom.Event) {
		print("all done")
		consolePhaseDone(game)
	})

	svgCallbackQuery("#help", func(dom.Event) {
		print("in the help cb")
		loadTemplate("gt-move", "#unit-details", nil)
		doc.QuerySelector("#unit-details").Class().Add("md-show")
		doc.QuerySelector("[name=gt-move]").AddEventListener("click", false, func(evt dom.Event) {
			doc.QuerySelector("#unit-details").Class().Remove("md-show")
		})
	})

	for _, v := range cmds {
		if v.PlayerID == Session.UserID {
			svgCallback(v.ID, func(evt dom.Event) {
				el := evt.Target()
				id, _ := strconv.Atoi(el.GetAttribute("data-id"))
				cmd := game.GetCmd(team, id)
				print("here with id", id)
				print("team", team)
				print("cmd", cmd)
				print("game", game)
				if cmd == nil {
					print("cmd is nil somehow")
				} else {
					max, min, gt := cmd.GTMove()
					print("Move options for ", cmd, max, min, gt)
				}
			})
		}
	}
}

func doGT2(game *shared.Game) {
	// w := dom.GetWindow()
	// doc := w.Document()
	// c := doc.QuerySelector("[name=svg-console]")

	consoleSetViewBox(game, 100, 100, false)
	consolePhaseBusy(game)
	print("phaseGT2")
}

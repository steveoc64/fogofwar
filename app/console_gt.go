package main

import (
	"fmt"
	"strconv"

	"./shared"
	"github.com/go-humble/router"
	"honnef.co/go/js/dom"
)

func doGT1(game *shared.Game) {
	Session.Game = game
	Session.Nav(fmt.Sprintf("/play/%d/move", Session.Game.ID))
}

func playMove(context *router.Context) {
	gameID, _ := strconv.Atoi(context.Params["game"])

	if Session.Game == nil || Session.Game.ID != gameID {
		print("no game loaded")
		Session.Navigate(fmt.Sprintf("/play/%d", gameID))
		return
	}

	w := dom.GetWindow()
	doc := w.Document()
	c := doc.QuerySelector("[name=svg-console]")
	g := c.QuerySelector("[name=g-main]")

	xx := 100
	if Session.Orientation == "Landscape" {
		consoleSetViewBox(150, 100, false)
		xx = 150
	} else {
		consoleSetViewBox(100, 100, false)
	}
	consolePhaseBusy("GT1")
	// print("phaseGT1 with", game)

	team := "blue"
	// teamName := game.BlueTeam
	cmds := Session.Game.BlueCmd
	if Session.Game.Red {
		team = "red"
		// teamName = game.RedTeam
		cmds = Session.Game.RedCmd
	}

	// Create heading with Team Name
	// sz := 2
	// if len(teamName) > 18 {
	// 	sz = 1
	// }
	// html := svgText(0, 10, fmt.Sprintf("text__%dx text__%s", sz, team), teamName)
	html := svgText(0, 10, fmt.Sprintf("text__2x text__%s", team), "March Movement")
	html += svgHelpBtn()

	yoffset := 0
	count := 0
	for _, v := range cmds {
		// max, min, gt := v.GTMove()
		max, _, gt := v.GTMove()
		// print("unit", v.ID, "can move", max, min, gt)
		if v.PlayerID == Session.UserID {
			html += svgG(v.ID)
			if max == 0 {
				html += svgButton(0, 18+(yoffset), xx, 10, "console-corps-disabled", "text__"+team+" text__1x", v.Name)
			} else {
				count++
				html += svgButton(0, 18+(yoffset), xx, 10, "console-corps-button", "text__"+team+" text__1x", v.Name)
			}
			html += svgText(xx-2, 25+yoffset, "text__0x text__end text__"+team, gt)
			html += svgEndG()
			yoffset += 11
		}
	}
	if count > 0 {
		html += svgText(0, 16, "text__1x text__"+team, "Corps that must Move:")
	} else {
		html += svgText(0, 16, "text__1x text__"+team, "No Big Moves this Turn ...")
	}
	html += svgG(100)
	html += fmt.Sprintf(`<rect x=0 y=88 rx=2 ry=2 width=%d height=12 class="carryon-button" data-id=100></rect>`, xx)
	html += "\n"
	html += svgText(xx/2, 97, "text__carryon text__middle", "Movement Complete")
	html += svgEndG()

	html += svgText(5, 85, "text__0x", "plus .. any Cavalry unit 1 grid, any skirmishers ½ grid")

	g.SetInnerHTML(html)

	svgCallback(100, func(dom.Event) {
		print("all done")
		consolePhaseNotBusy()
	})

	svgCallbackQuery("#help", func(dom.Event) {
		loadTemplate("gt-move", "#unit-details", nil)
		doc.QuerySelector("#unit-details").Class().Add("md-show")
		doc.QuerySelector("[name=gt-move]").AddEventListener("click", false, func(evt dom.Event) {
			doc.QuerySelector("#unit-details").Class().Remove("md-show")
		})
	})

	for _, v := range cmds {
		if v.PlayerID == Session.UserID {
			max, _, _ := v.GTMove()
			if max > 0 {
				svgCallback(v.ID, func(evt dom.Event) {
					el := evt.Target()
					id, _ := strconv.Atoi(el.GetAttribute("data-id"))
					cmd := Session.Game.GetCmd(team, id)
					if max > 1 {
						doGTCmd(Session.Game, cmd)
					} else {
						doMap(Session.Game)
					}
				})
			}
		}
	}
}

func doGTCmd(game *shared.Game, cmd *shared.GameCmd) {
	Session.Game = game
	Session.Cmd = cmd
	Session.Nav(fmt.Sprintf("/play/%d/move/corps", Session.Game.ID))
}

func playMoveCorps(context *router.Context) {
	gameID, _ := strconv.Atoi(context.Params["game"])

	if Session.Game == nil || Session.Game.ID != gameID {
		print("no game loaded")
		Session.Navigate(fmt.Sprintf("/play/%d", gameID))
		return
	}

	w := dom.GetWindow()
	doc := w.Document()
	c := doc.QuerySelector("[name=svg-console]")
	g := c.QuerySelector("[name=g-main]")

	xx := 100

	if Session.Orientation == "Landscape" {
		consoleSetViewBox(150, 100, false)
		xx = 150
	} else {
		consoleSetViewBox(100, 100, false)
	}
	consolePhaseBusy("GTCmd")
	// print("phaseGT1 with", game)

	team := "blue"
	teamName := Session.Game.BlueTeam
	if Session.Game.Red {
		team = "red"
		teamName = Session.Game.RedTeam
	}
	html := ""
	max, _, _ := Session.Cmd.GTMove()

	// Create heading with Team Name
	sz := 2
	if len(teamName) > 18 {
		sz = 1
	}
	html += svgText(0, 10, fmt.Sprintf("text__%dx text__%s", sz, team), Session.Cmd.Name)
	html += svgText(15, 16, fmt.Sprintf("text__1x text__%s", team), fmt.Sprintf("Move head of March Column %d grids", max))
	html += svgHelpBtn()

	html += svgG(100)
	html += fmt.Sprintf(`<rect x=0 y=88 rx=2 ry=2 width=%d height=12 class="carryon-button" data-id=100></rect>`, xx)
	html += "\n"
	html += svgText(xx/2, 97, "text__carryon text__middle", "Complete")
	html += svgEndG()

	if max > 1 {
		html += fmt.Sprintf(`<image xlink:href=/img/legal-max.png x=0 y=20 height=25 width=%d></image>`, xx)

		html += svgG(1)
		html += svgText(0, 55, "text__question", "At Destination ?")
		html += `<rect class=console-check x=90 y=47 rx=2 ry=2 width=10 height=10 data-id=1></rect>`
		html += svgTick("destination", "tick hidden", 90, 47, 10)
		html += svgEndG()

		html += svgG(2)
		html += svgText(0, 70, "text__question", "Contact Enemy ?")
		html += `<rect class=console-check x=90 y=62 rx=2 ry=2 width=10 height=10 data-id=2></rect>`
		html += svgTick("contact", "tick hidden", 90, 62, 10)
		html += svgEndG()
	}

	g.SetInnerHTML(html)

	svgCallback(100, func(dom.Event) {
		print("all done")
		if max > 1 {
			go func() {
				newCmd := shared.GameCmd{}

				destination := !doc.QuerySelector("#destination").Class().Contains("hidden")
				contact := !doc.QuerySelector("#contact").Class().Contains("hidden")
				err := RPC("GameRPC.GTMove", shared.GTMoveData{
					Channel:     Session.Channel,
					ID:          Session.Cmd.ID,
					Destination: destination,
					Contact:     contact,
				}, &newCmd)
				if err == nil {
					print("got back new cmd", newCmd)
					Session.Cmd.CX = newCmd.CX
					Session.Cmd.CY = newCmd.CY
					Session.Cmd.DState = newCmd.DState
				}
			}()
		}
		consolePhaseNotBusy()
	})

	if max > 1 {
		svgCallback(1, func(dom.Event) {
			// print("click at destination")
			el := doc.QuerySelector("#destination")
			if el != nil {
				el.Class().Toggle("hidden")
			}
		})

		svgCallback(2, func(dom.Event) {
			// print("click on enemy contact")
			el := doc.QuerySelector("#contact")
			if el != nil {
				el.Class().Toggle("hidden")
			}
		})
	}

	svgCallbackQuery("#help", func(dom.Event) {
		loadTemplate("gt-move", "#unit-details", nil)
		doc.QuerySelector("#unit-details").Class().Add("md-show")
		doc.QuerySelector("[name=gt-move]").AddEventListener("click", false, func(evt dom.Event) {
			doc.QuerySelector("#unit-details").Class().Remove("md-show")
		})
	})
}

package main

import (
	"fmt"
	"strconv"

	"./shared"
	"github.com/go-humble/router"
	"honnef.co/go/js/dom"
)

func play(context *router.Context) {
	Session.Subscribe("Play", _play, context)
	_play("Edit", 0, context)
}

type ConsolePaintData struct {
	Game        *shared.Game
	Orientation string
}

func _play(action string, actionID int, context *router.Context) {
	id, err := strconv.Atoi(context.Params["id"])
	if err != nil {
		print(err.Error())
		return
	}

	switch action {
	default:
		print("play", action, actionID)
	}

	Session.MobileSensitive = true
	Session.OrientationSensitive = true

	w := dom.GetWindow()
	doc := w.Document()

	go func() {
		game := &shared.Game{}
		// TheCmd := &shared.GameCmd{}
		// TheUnit := &shared.Unit{}

		err := RPC("GameRPC.GetPlay", shared.GameRPCData{
			Channel: Session.Channel,
			ID:      id,
		}, game)
		if err != nil || game.ID == 0 {
			dom.GetWindow().Alert("Cannot load game" + err.Error())
			Session.Navigate("/")
		}

		loadTemplate("console", "main", ConsolePaintData{
			Game:        game,
			Orientation: Session.Orientation,
		})

		doTurnSummary(game)

		doc.QuerySelector("[name=console]").AddEventListener("click", false, func(evt dom.Event) {
			if evt.Target().TagName() == "INPUT" {
				btnv := evt.Target().(*dom.HTMLInputElement).Value
				switch btnv {
				case "Order":
					doCorpsOverview(game)
				case "Map":
					doMap(game)
				case "Units":
					doUnits(game)
				case "Game":
					doTurnSummary(game)
					// doGameControl(game)
				}
			}
		})
	}()
}

func isFlipped(game *shared.Game) bool {
	flipped := false

	if game.Red {
		flipped = game.RedFlip
	} else {
		if game.Blue {
			flipped = game.BlueFlip
		}
	}
	return flipped
}

func getPhaseDescription(phase int) string {
	switch phase {
	case 0:
		return ".. Enter Initial Orders for each Corps"
	case 1:
		return "GT Movement"
	case 2:
		return "Bombardment"
	case 3:
		return "Engage/Disengage"
	case 4:
		return "Commander Actions"
	case 50:
		return "Tactical Engagement"
	case 51:
		return "Tactical Action"
	case 52:
		return "Claim Objectives"
	default:
		return fmt.Sprintf("%d ??", phase)
	}
}

func doTurnSummary(game *shared.Game) {
	w := dom.GetWindow()
	doc := w.Document()
	c := doc.QuerySelector("[name=svg-console]")

	// Add a turn summary object
	g := c.QuerySelector("[name=g-main]")

	team := "blue"
	if game.Red {
		team = "red"
	}

	turn := "Pre-Game Setup"
	if game.Turn > 0 {
		turn = fmt.Sprintf("Turn %d of %d", game.Turn, game.TurnLimit)
	}

	html := svgText(2, 15, 2, team, turn)
	html += svgText(2, 40, 1, team, getPhaseDescription(game.Phase))
	if game.Turn > 0 {
		html += svgText(3, 65, 2, team, fmt.Sprintf("Victory Points = %d", game.Phase))
	}

	dispatchOrders := func(evt dom.Event) {
		game.PhaseDONE = true
		paperButtonSet(evt, "Dispatched!")
		go func() {
			done := false
			err := RPC("GameRPC.PhaseDone", shared.PhaseDoneMsg{
				Channel: Session.Channel,
				GameID:  game.ID,
			}, &done)
			if err != nil {
				print(err.Error())
			}
		}()
	}

	// Add a send button, unless we still have things on the TODO list
	if !game.PhaseTODO {
		html += paperButton("done", "Send Orders", 40, 85, 45, 40, 85, dispatchOrders)
	}
	g.SetInnerHTML(html)

	if !game.PhaseTODO {
		paperCallback("done", dispatchOrders)
	}

	// if !game.PhaseTODO {
	// 	if Session.Orientation == "Portrait" {
	// 		html += fmt.Sprintf(`<rect name=done-btn x=40 y=85 rx=2 ry=2 width=45 height=12 class=text__paper></rect>`)
	// 		html += "\n"
	// 		if !game.PhaseDone {
	// 			html += fmt.Sprintf(`<text name=done-text x=45 y=93 class="console-text text__hand">Send Orders</text>`)
	// 			html += "\n"
	// 		}
	// 	} else {
	// 		html += fmt.Sprintf(`<rect name=done-btn x=50 y=85 rx=2 ry=2 width=45 height=12 class=text__paper></rect>`)
	// 		html += "\n"
	// 		if !game.PhaseDone {
	// 			html += fmt.Sprintf(`<text name=done-text x=55 y=93 class="console-text text__hand">Send Orders</text>`)
	// 			html += "\n"
	// 		}
	// 	}
	// }

	// if !game.PhaseTODO {
	// 	doc.QuerySelector("[name=done-rect]").AddEventListener("click", false, func(evt dom.Event) {
	// 		dispatchOrders(evt)
	// 	})
	// 	doc.QuerySelector("[name=done-text]").AddEventListener("click", false, func(evt dom.Event) {
	// 		dispatchOrders(evt)
	// 	})
	// }

}

func doCorpsOverview(game *shared.Game) {
	w := dom.GetWindow()
	doc := w.Document()
	c := doc.QuerySelector("[name=svg-console]")

	// mock the act of completing the TODO list
	game.PhaseTODO = false
	go func() {
		done := false
		err := RPC("GameRPC.PhaseNotDone", shared.PhaseDoneMsg{
			Channel: Session.Channel,
			GameID:  game.ID,
		}, &done)
		if err != nil {
			print(err.Error())
		}
	}()

	// Add a turn summary object
	g := c.QuerySelector("[name=g-main]")
	html := ""

	// Add a buton per Red corps
	for _, corps := range game.RedCmd {
		print("add button for red", corps.Name)
	}
	// Add a buton per Blue cor
	for _, corps := range game.BlueCmd {
		print("add button for blue", corps.Name)
	}
	g.SetInnerHTML(html)
}

// Render the orders
func doOrders(game *shared.Game) {
	print("TODO - doOrders")
}

func doMap(game *shared.Game) {
	print("TODO - doMap")
}

func doUnits(game *shared.Game) {
	print("TODO - doUnits")
}

func doGameControl(game *shared.Game) {
	print("TODO - doGameControl")
}

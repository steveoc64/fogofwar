package main

import (
	"fmt"
	"strconv"

	"./shared"
	"github.com/go-humble/router"
	"honnef.co/go/js/dom"
)

const SVG = "http://www.w3.org/2000/svg"

const SVGStar = `<polygon xmlns="http://www.w3.org/2000/svg" fill="#fdff00" stroke="#605a00" stroke-width="15" points="150,25 179,111 269,111 197,165 223,251 150,200 77,251 103,165 31,111 121,111"/>`

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
					doOrders(game)
				case "Map":
					doMap(game)
				case "Units":
					doUnits(game)
				case "Game":
					doGameControl(game)
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
	// Render the orders

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

	html := fmt.Sprintf(`<text x=0 y=25 class="console-text text__%s text__2x">%s</text>"`, team, turn)
	html += "\n"

	html += fmt.Sprintf(`<text x=0 y=50 class="console-text text__%s">%s</text>`,
		team, getPhaseDescription(game.Phase))
	html += "\n"

	if game.Turn > 0 {
		html += fmt.Sprintf(`<text x=0 y=75 class="console-text text__%s text__2x">Victory Points = %d</text>`,
			team, game.Phase)
		html += "\n"
	}

	// Add a ready button
	html += fmt.Sprintf(`<rect name=done-btn x=70 y=85 rx=2 ry=2 width=45 height=12 class=text__paper></rect>`)
	html += "\n"
	if !game.PhaseDone {
		html += fmt.Sprintf(`<text name=done-text x=75 y=93 class="console-text text__hand">Send Orders</text>`)
		html += "\n"
	}

	g.SetInnerHTML(html)

	dispatchOrders := func(evt dom.Event) {
		print("dispatch orders")
		el := evt.Target()
		tag := el.TagName()
		if tag == "rect" {
			el2 := el.NextElementSibling()
			if el2.TagName() == "text" {
				el2.SetInnerHTML("Dispatched!")
				c := el.Class()
				c.Remove("text__paper")
				c.Add("text__done")
			}
		}
		if tag == "text" {
			el.SetInnerHTML("Dispatched!")
			c := el.PreviousElementSibling().Class()
			c.Remove("text__paper")
			c.Add("text__done")
		}
	}

	doc.QuerySelector("[name=done-btn]").AddEventListener("click", false, func(evt dom.Event) {
		dispatchOrders(evt)
	})
	doc.QuerySelector("[name=done-text]").AddEventListener("click", false, func(evt dom.Event) {
		dispatchOrders(evt)
	})

}

func doOrders(game *shared.Game) {
	// Render the orders

	w := dom.GetWindow()
	doc := w.Document()
	c := doc.QuerySelector("[name=svg-console]")
	print("console", c)

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

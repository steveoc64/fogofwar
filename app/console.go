package main

import (
	"fmt"
	"strconv"

	"./shared"
	"github.com/go-humble/router"
	"honnef.co/go/js/dom"
)

type ConsolePaintData struct {
	Game        *shared.Game
	Orientation string
	Hosting     bool
}

func _play(action string, id int, context *router.Context) {
	switch action {
	case "Phase", "Turn":
		if id == 0 {
			if dom.GetWindow().
				Confirm("Your Game has started ..  Click OK to join to Game") {
				Session.Navigate(fmt.Sprintf("/play/%d", id))
			}
		} else {
			if dom.GetWindow().
				Confirm("Your Game has progressed to the next phase .. we are waiting for you. Click OK to return to Game") {
				Session.Navigate(fmt.Sprintf("/play/%d", id))
			}
		}
	}
}

func play(context *router.Context) {
	id, err := strconv.Atoi(context.Params["id"])
	if err != nil {
		print(err.Error())
		return
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
			Hosting:     game.HostedBy == Session.UserID,
		})

		playMsg := func(action string, actionID int, context *router.Context) {
			print("Msg", action, actionID)
			switch action {
			case "Turn":
				game.Phase = 1
				game.Turn = actionID
				game.PhaseDONE = false
				game.PhaseTODO = true
				doTurnSummary(game)
			case "Phase":
				game.Phase = actionID
				game.PhaseDONE = false
				game.PhaseTODO = true
				doTurnSummary(game)
			case "PhaseWait":
				game.Phase = actionID
				game.PhaseDONE = true
				game.PhaseTODO = false
				doTurnSummary(game)
			}
		}

		gameMsg := func(action string, actionID int, context *router.Context) {
			if actionID == id {
				print("Game update for this game")
				newGame := &shared.Game{}
				err := RPC("GameRPC.GetPlay", shared.GameRPCData{
					Channel: Session.Channel,
					ID:      id,
				}, newGame)
				if err != nil || game.ID == 0 {
					dom.GetWindow().Alert("Exiting this game .. Bye, and thanks for Playing")
					// dom.GetWindow().Alert("Cannot load game" + err.Error())
					Session.Navigate("/")
				}
				game = newGame
			}
		}

		Session.Subscribe("Play", playMsg, context)
		Session.Subscribe("Game", gameMsg, context)

		doTurnSummary(game)

		doc.QuerySelector("[name=console]").AddEventListener("click", false, func(evt dom.Event) {
			if evt.Target().TagName() == "INPUT" {
				btnv := evt.Target().(*dom.HTMLInputElement).Value
				switch btnv {
				case "Orders":
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

		if game.HostedBy == Session.UserID {
			doc.QuerySelector("[name=hosting-users]").AddEventListener("click", false, func(evt dom.Event) {
				print("edit users")
				Session.Navigate(fmt.Sprintf("/game/%d/players", id))
			})
		}
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

func doCorpsOverview(game *shared.Game) {
	w := dom.GetWindow()
	doc := w.Document()
	c := doc.QuerySelector("[name=svg-console]")

	// mock the act of completing the TODO list, on the first phase only
	if game.Phase == 0 {
		game.Phase = -1
		go func() {
			done := false
			err := RPC("GameRPC.PhaseNotDone", shared.PhaseDoneMsg{
				Channel: Session.Channel,
				GameID:  game.ID,
			}, &done)
			if err != nil {
				print(err.Error())
			}
			game.PhaseDONE = false
		}()
	}

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

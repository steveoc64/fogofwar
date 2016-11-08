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

var consoleCurrentPanel = "Game"
var consoleCurrentUnit *shared.Unit
var consoleCurrentCmd *shared.GameCmd
var consoleGame *shared.Game
var incoming = []int{}

func consolePhaseBusy(game *shared.Game, with string) {
	go func() {
		done := false
		err := RPC("GameRPC.PhaseBusy", shared.PhaseDoneMsg{
			Channel: Session.Channel,
			GameID:  game.ID,
		}, &done)
		if err != nil {
			print(err.Error())
		}
		game.PhaseBUSY = true
		consoleCurrentPanel = with
	}()
}

func consolePhaseNotBusy(game *shared.Game) {
	go func() {
		done := false
		err := RPC("GameRPC.PhaseNotBusy", shared.PhaseDoneMsg{
			Channel: Session.Channel,
			GameID:  game.ID,
		}, &done)
		if err != nil {
			print(err.Error())
		}
		game.PhaseBUSY = false
		doTurnSummary(game)
	}()
}

func consolePhaseDone(game *shared.Game) {
	go func() {
		done := false
		err := RPC("GameRPC.PhaseDone", shared.PhaseDoneMsg{
			Channel: Session.Channel,
			GameID:  game.ID,
		}, &done)
		if err != nil {
			print(err.Error())
		}
		game.PhaseDONE = true
		doTurnSummary(game)
	}()
}

func _play(action string, msg *shared.NetData, context *router.Context) {
	switch action {
	case "Phase", "Turn":
		if msg.ID == 0 {
			if dom.GetWindow().
				Confirm("Your Game has started ..  Click OK to join to Game") {
				Session.Navigate(fmt.Sprintf("/play/%d", msg.ID))
			}
		} else {
			if dom.GetWindow().
				Confirm("Your Game has progressed to the next phase .. we are waiting for you. Click OK to return to Game") {
				Session.Navigate(fmt.Sprintf("/play/%d", msg.ID))
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
	incoming = nil

	w := dom.GetWindow()
	doc := w.Document()
	game := consoleGame
	go func() {
		// TheCmd := &shared.GameCmd{}
		// TheUnit := &shared.Unit{}

		newGame := shared.Game{}
		err := RPC("GameRPC.GetPlay", shared.GameRPCData{
			Channel:    Session.Channel,
			ID:         id,
			GetUnits:   true,
			GetBombard: true,
		}, &newGame)
		if err != nil {
			dom.GetWindow().Alert("Cannot load game" + err.Error())
			Session.Navigate("/")
		}
		inc := []int{}
		err = RPC("GameRPC.GetIncoming", shared.GameRPCData{
			Channel: Session.Channel,
			ID:      id,
		}, &inc)
		if err == nil {
			incoming = inc
		}
		consoleGame = &newGame
		game = consoleGame
		team := "blue"
		if game.Red {
			team = "red"
		}

		loadTemplate("console", "main", ConsolePaintData{
			Game:        game,
			Orientation: Session.Orientation,
			Hosting:     game.HostedBy == Session.UserID,
		})

		playMsg := func(action string, msg *shared.NetData, context *router.Context) {
			// print("Msg", action, actionID)
			switch action {
			case "Turn":
				// end of turn - get the data again
				go func() {
					newGame := shared.Game{}
					err := RPC("GameRPC.GetPlay", shared.GameRPCData{
						Channel:  Session.Channel,
						ID:       id,
						GetUnits: true,
					}, &newGame)
					if err != nil {
						print(err.Error())
					}
					consoleGame = &newGame
					game = consoleGame
					game.Phase = 1
					game.Turn = msg.ID
					game.PhaseDONE = false
					game.PhaseTODO = true
					incoming = nil
					doTurnSummary(game)
				}()
			case "Phase":
				game.Phase = msg.ID
				game.PhaseDONE = false
				game.PhaseTODO = true
				incoming = nil
				doTurnSummary(game)
			case "PhaseWait":
				game.Phase = msg.ID
				game.PhaseDONE = true
				game.PhaseTODO = false
				doTurnSummary(game)
			case "Incoming":
				// TODO - rewrite this to use the attached data in the message
				print("we have incoming bombardment", msg.ID)
				incoming = append(incoming, msg.ID)
				game.PhaseTODO = true
				game.PhaseDONE = false
				if !game.PhaseBUSY {
					doTurnSummary(game)
				}
			case "IncomingCancel":

				print("an incoming fire mission has been cancelled - that the Lord", msg.ID)
				for i, v := range incoming {
					if v == msg.ID {
						incoming = append(incoming[:i], incoming[i+1:]...)
						break
					}
				}
				if !game.PhaseBUSY {
					doTurnSummary(game)
				}
			case "Unit":
				print("unit message", msg)
				theUnit := game.GetUnit(team, msg.ID)
				print("affecting unit", theUnit)
				switch msg.Opcode {
				case shared.UnitEventFired:
					theUnit.Ammo = msg.Unit.Ammo
					theUnit.GunsFired = msg.Unit.GunsFired
					if consoleCurrentPanel == "BB2" {
						doBB2(game, consoleCurrentCmd)
					}
				case shared.UnitEventHits:
					theUnit.BayonetsLost = msg.Unit.BayonetsLost
					theUnit.SabresLost = msg.Unit.SabresLost
					theUnit.GunsLost = msg.Unit.GunsLost
					theUnit.CommanderControl = msg.Unit.CommanderControl
				}
			case "BB":
				print("Bombardment target ID has been aquired or dropped for unit", msg.ID)
				go func() {
					newUnit := shared.Unit{}
					err := RPC("GameRPC.GetUnit", shared.GameRPCData{
						Channel: Session.Channel,
						ID:      msg.ID,
					}, &newUnit)
					if err != nil {
						print(err.Error())
					} else {
						// find the unit
						oldUnit := game.GetUnit(team, msg.ID)
						*oldUnit = newUnit
						cmd := game.GetCmd(team, newUnit.CmdID)
						// print("BB data", oldUnit.Bombard)
						doBB2(game, cmd)
					}
				}()
			}
		}

		doTurnSummary(game)

		doDisplayPanel := func(mode string) {
			consoleCurrentPanel = mode
			consoleSetViewBox(game, 100, 100, false)
			switch mode {
			case "Orders":
				doOrders(game)
			case "Map":
				doMap(game)
			case "Units":
				doUnits(game)
			case "Game":
				consolePhaseNotBusy(game)
			}
		}
		doDisplayPanel(consoleCurrentPanel)

		gameMsg := func(action string, msg *shared.NetData, context *router.Context) {
			if msg.ID == id {
				print("Game update for this game")
				newGame := &shared.Game{}
				err := RPC("GameRPC.GetPlay", shared.GameRPCData{
					Channel:  Session.Channel,
					ID:       id,
					GetUnits: true,
				}, newGame)
				if err != nil || game.ID == 0 {
					dom.GetWindow().Alert("Exiting this game .. Bye, and thanks for Playing")
					// dom.GetWindow().Alert("Cannot load game" + err.Error())
					Session.Navigate("/")
				}
				game = newGame
				doDisplayPanel(consoleCurrentPanel)
			}
		}

		Session.Subscribe("Play", playMsg, context)
		Session.Subscribe("Game", gameMsg, context)

		doc.QuerySelector("[name=console]").AddEventListener("click", false, func(evt dom.Event) {
			el := evt.Target()
			if el.TagName() == "INPUT" && el.Class().Contains("button-console") {
				doDisplayPanel(el.(*dom.HTMLInputElement).Value)
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

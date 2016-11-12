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
var consoleCurrentFight *shared.Fight
var consoleGame *shared.Game
var incoming = []int{}
var fights = []*shared.Fight{}

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
		game.PhaseDONE = false
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

		// Init the game state
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
		consoleGame = &newGame
		game = consoleGame
		team := "blue"
		if game.Red {
			team = "red"
		}

		inc := []int{}
		incoming = inc
		err = RPC("GameRPC.GetIncoming", shared.GameRPCData{
			Channel: Session.Channel,
			ID:      id,
		}, &inc)
		if err == nil {
			incoming = inc
		}

		f := []*shared.Fight{}
		fights = f
		err = RPC("GameRPC.GetFights", shared.GameRPCData{
			Channel: Session.Channel,
			ID:      id,
		}, &f)
		if err == nil {
			fights = f
			// print("got fight data", fights)
			for _, ff := range f {
				// mark committed for all units known to be in the fight
				for _, v := range ff.Red {
					u := game.GetUnit("red", v.ID)
					if u != nil {
						u.Committed = true
					}
				}
				for _, v := range ff.Blue {
					u := game.GetUnit("blue", v.ID)
					if u != nil {
						u.Committed = true
					}
				}
			}
		}

		loadTemplate("console", "main", ConsolePaintData{
			Game:        game,
			Orientation: Session.Orientation,
			Hosting:     game.HostedBy == Session.UserID,
		})

		playMsg := func(action string, msg *shared.NetData, context *router.Context) {
			// print("Msg", action, msg)
			switch action {
			case "Turn":
				// end of turn - get the data all over again
				go func() {
					newGame := shared.Game{}
					err := RPC("GameRPC.GetPlay", shared.GameRPCData{
						Channel:  Session.Channel,
						ID:       id,
						GetUnits: true,
					}, &newGame)
					if err != nil {
						print(err.Error())
						Session.Navigate("/")
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
				// The Data contains a list of cmd updates to be applied
				if msg.Cmds != nil {
					// print("cmdupdate array", msg.Cmds)
					for _, v := range *msg.Cmds {
						// print("got", v)
						c := &shared.GameCmd{}
						if v.RedTeam {
							c = game.GetCmd("red", v.ID)
						} else {
							c = game.GetCmd("blue", v.ID)
						}
						if c != nil {
							c.CX = v.CX
							c.CY = v.CY
							c.Seen = v.Seen
						}
					}
				}
				doTurnSummary(game)
			case "PhaseWait":
				game.Phase = msg.ID
				game.PhaseDONE = true
				game.PhaseTODO = false
				doTurnSummary(game)
			case "NewFight":
				game.PhaseDONE = false
				f := msg.Fight
				// print("adding this one", f)
				reds := []*shared.Unit{}
				blues := []*shared.Unit{}
				for _, v := range f.Red {
					reds = append(reds, game.GetUnit("red", v))
				}
				for _, v := range f.Blue {
					blues = append(blues, game.GetUnit("blue", v))
				}
				fights = append(fights, &shared.Fight{
					ID:     f.ID,
					GameID: f.GameID,
					Name:   f.Name,
					Rough:  f.Rough,
					Woods:  f.Woods,
					Built:  f.Built,
					Fort:   f.Fort,
					Red:    reds,
					Blue:   blues,
				})
				// print("fights", fights)
				if !game.PhaseBUSY {
					doTurnSummary(game)
				}
			case "FightUpdate":
				f := msg.Fight
				// print("asked to update fight", msg.ID, f)
				for _, v := range fights {
					if v.ID == msg.ID {
						// print("that would be this one", v)
						reds := []*shared.Unit{}
						blues := []*shared.Unit{}
						for _, v := range f.Red {
							u := game.GetUnit("red", v)
							u.Committed = true
							reds = append(reds, u)
						}
						for _, v := range f.Blue {
							u := game.GetUnit("blue", v)
							u.Committed = true
							blues = append(blues, u)
						}
						v.Red = reds
						v.Blue = blues
						// print("modified to", v)
					}
				}
				if consoleCurrentPanel == "Fight" && consoleCurrentFight != nil {
					doFight(game, consoleCurrentFight)
				}
			case "FightWithdraw":
				for _, v := range fights {
					if v.ID == msg.ID {
						for i, uu := range v.Red {
							if uu.ID == msg.Opcode {
								v.Red = append(v.Red[:i], v.Red[i+1:]...)
								break
							}
						}
						for i, uu := range v.Blue {
							if uu.ID == msg.Opcode {
								v.Blue = append(v.Blue[:i], v.Blue[i+1:]...)
								break
							}
						}
					}
				}
			case "UnitRole":
				// print("A unit has changed role")
				gotsome := false
				for _, cmd := range game.RedCmd {
					for _, unit := range cmd.Units {
						if unit.ID == msg.ID {
							gotsome = true
							unit.Role = msg.Opcode
							break
						}
					}
				}
				for _, cmd := range game.BlueCmd {
					for _, unit := range cmd.Units {
						if unit.ID == msg.ID {
							gotsome = true
							unit.Role = msg.Opcode
							break
						}
					}
				}
				if gotsome && consoleCurrentPanel == "Fight" && consoleCurrentFight != nil {
					doFight(game, consoleCurrentFight)
				}
			case "Incoming":
				// TODO - rewrite this to use the attached data in the message
				// print("we have incoming bombardment", msg.ID, game.PhaseBUSY, game.PhaseDONE, game.PhaseTODO)
				incoming = append(incoming, msg.ID)
				game.PhaseTODO = true
				game.PhaseDONE = false
				if !game.PhaseBUSY {
					doTurnSummary(game)
				}
			case "IncomingCancel":
				for i, v := range incoming {
					if v == msg.ID {
						incoming = append(incoming[:i], incoming[i+1:]...)
						break
					}
				}
				if !game.PhaseBUSY {
					doTurnSummary(game)
				}
				if consoleCurrentPanel == "BBReceive2" {
					consolePhaseNotBusy(game)
				}
			case "Unit":
				// print("unit message", msg.Unit.Description)
				theUnit := game.GetUnit(team, msg.Unit.ID)
				switch msg.Opcode {
				case shared.UnitEventFired:
					theUnit.Ammo = msg.Unit.Ammo
					theUnit.GunsFired = msg.Unit.GunsFired
					if consoleCurrentPanel == "BB2" {
						doBB2(game, consoleCurrentCmd)
					}
				case shared.UnitEventHits:
					print("hit notification for", theUnit)
					theUnit.BayonetsLost = msg.Unit.BayonetsLost
					theUnit.SabresLost = msg.Unit.SabresLost
					theUnit.GunsLost = msg.Unit.GunsLost
					theUnit.CommanderControl = msg.Unit.CommanderControl
					theUnit.MState = msg.Unit.MState
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

		consolePhaseNotBusy(game)
		// doTurnSummary(game)

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
				// print("Game update for this game")
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
				// print("edit users")
				Session.Navigate(fmt.Sprintf("/game/%d/players", id))
			})
		}

	}()
}

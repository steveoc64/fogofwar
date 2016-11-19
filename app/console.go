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

func consolePhaseBusy(with string) {
	if Session.Game == nil || Session.Game.ID == 0 {
		print("ERROR : Game is nil, cant set busy")
		return
	}
	go func() {
		done := false
		err := RPC("GameRPC.PhaseBusy", shared.PhaseDoneMsg{
			Channel: Session.Channel,
			GameID:  Session.Game.ID,
		}, &done)
		if err != nil {
			print(err.Error())
		}
		Session.Game.PhaseBUSY = true
		Session.Game.PhaseDONE = false
		Session.Panel = with
	}()
}

func consolePhaseNotBusy() {
	if Session.Game == nil || Session.Game.ID == 0 {
		return
		// No current game - nothing to do
	}
	go func() {
		done := false
		err := RPC("GameRPC.PhaseNotBusy", shared.PhaseDoneMsg{
			Channel: Session.Channel,
			GameID:  Session.Game.ID,
		}, &done)
		if err != nil {
			print(err.Error())
		}
		Session.Game.PhaseBUSY = false
		doTurnSummary()
	}()
}

func consolePhaseDone() {
	if Session.Game == nil || Session.Game.ID == 0 {
		// no game loaded - nothing to do
		return
	}
	go func() {
		done := false
		err := RPC("GameRPC.PhaseDone", shared.PhaseDoneMsg{
			Channel: Session.Channel,
			GameID:  Session.Game.ID,
		}, &done)
		if err != nil {
			print(err.Error())
		}
		Session.Game.PhaseDONE = true
		doTurnSummary()
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

func refreshGameData(id int) {
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
	Session.Game = &newGame

	// Get the incoming
	inc := []int{}
	Session.Incoming = inc
	err = RPC("GameRPC.GetIncoming", shared.GameRPCData{
		Channel: Session.Channel,
		ID:      id,
	}, &inc)
	if err == nil {
		Session.Incoming = inc
	}

	// Get the fights
	f := []*shared.Fight{}
	err = RPC("GameRPC.GetFights", shared.GameRPCData{
		Channel: Session.Channel,
		ID:      id,
	}, &f)
	Session.Fights = nil
	if err == nil {
		Session.Fights = f
		// print("got fight data", fights)
		for _, ff := range f {
			// mark committed for all units known to be in the fight
			for _, v := range ff.Red {
				u := Session.Game.GetUnit("red", v.ID)
				if u != nil {
					u.Committed = true
				}
			}
			for _, v := range ff.Blue {
				u := Session.Game.GetUnit("blue", v.ID)
				if u != nil {
					u.Committed = true
				}
			}
		}
	}
}

func play(context *router.Context) {
	gameID, err := strconv.Atoi(context.Params["game"])
	if err != nil {
		print(err.Error())
		return
	}

	Session.MobileSensitive = true
	Session.OrientationSensitive = true

	w := dom.GetWindow()
	doc := w.Document()

	go func() {
		// Fetch the Game data if required
		if Session.Game == nil || Session.Game.ID != gameID {
			refreshGameData(gameID)
			// All done - loaded fresh game data, incomings and fights
		}

		team := "blue"
		if Session.Game.Red {
			team = "red"
		}

		loadTemplate("console", "main", ConsolePaintData{
			Game:        Session.Game,
			Orientation: Session.Orientation,
			Hosting:     Session.Game.HostedBy == Session.UserID,
		})

		playMsg := func(action string, msg *shared.NetData, context *router.Context) {
			if msg.GameID != Session.Game.ID {
				print("We are in Game", Session.Game.ID, "and got a msg for game", msg.GameID)
				return
			}
			print("Msg", action, msg)
			switch action {
			case "Turn":
				// end of turn - get the data all over again
				go func() {
					refreshGameData(Session.Game.ID)
					Session.Game.PhaseDONE = false
					Session.Game.PhaseTODO = true
					doTurnSummary()
					// doTurnSummary(Session.Game)
				}()
			case "Phase":
				Session.Game.Phase = msg.ID
				Session.Game.PhaseDONE = false
				Session.Game.PhaseTODO = true
				Session.Incoming = nil
				// The Data contains a list of cmd updates to be applied
				if msg.Cmds != nil {
					// print("cmdupdate array", msg.Cmds)
					for _, v := range *msg.Cmds {
						c := &shared.GameCmd{}
						if v.RedTeam {
							c = Session.Game.GetCmd("red", v.ID)
						} else {
							c = Session.Game.GetCmd("blue", v.ID)
						}
						if c != nil {
							c.CX = v.CX
							c.CY = v.CY
							c.Seen = v.Seen
						}
					}
				}
				doTurnSummary()
			case "PhaseWait":
				Session.Game.Phase = msg.ID
				Session.Game.PhaseDONE = true
				Session.Game.PhaseTODO = false
				doTurnSummary()
			case "NewFight":
				Session.Game.PhaseDONE = false
				f := msg.Fight
				// print("adding this one", f)
				reds := []*shared.Unit{}
				blues := []*shared.Unit{}
				for _, v := range f.Red {
					reds = append(reds, Session.Game.GetUnit("red", v))
				}
				for _, v := range f.Blue {
					blues = append(blues, Session.Game.GetUnit("blue", v))
				}
				Session.Fights = append(Session.Fights, &shared.Fight{
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
				if !Session.Game.PhaseBUSY {
					doTurnSummary()
				}
			case "FightUpdate":
				f := msg.Fight
				// print("asked to update fight", msg.ID, f)
				for _, v := range Session.Fights {
					if v.ID == msg.ID {
						// print("that would be this one", v)
						reds := []*shared.Unit{}
						blues := []*shared.Unit{}
						for _, v := range f.Red {
							u := Session.Game.GetUnit("red", v)
							u.Committed = true
							reds = append(reds, u)
						}
						for _, v := range f.Blue {
							u := Session.Game.GetUnit("blue", v)
							u.Committed = true
							blues = append(blues, u)
						}
						v.Red = reds
						v.Blue = blues
						// print("modified to", v)
					}
				}
				if Session.Panel == "Fight" && Session.Fight != nil {
					// doFight(game, consoleCurrentFight)
					Session.Nav(fmt.Sprintf("/play/%d/fight/%d", Session.Game.ID, Session.Fight.ID))
				}
			case "FightWithdraw":
				for _, v := range Session.Fights {
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
				for _, cmd := range Session.Game.RedCmd {
					for _, unit := range cmd.Units {
						if unit.ID == msg.ID {
							gotsome = true
							unit.Role = msg.Opcode
							break
						}
					}
				}
				for _, cmd := range Session.Game.BlueCmd {
					for _, unit := range cmd.Units {
						if unit.ID == msg.ID {
							gotsome = true
							unit.Role = msg.Opcode
							break
						}
					}
				}
				if gotsome && Session.Panel == "Fight" && Session.Fight != nil {
					// doFight(game, consoleCurrentFight)
					Session.Nav(fmt.Sprintf("/play/%d/fight/%d", Session.Game.ID, Session.Fight.ID))
				}
			case "Incoming":
				// TODO - rewrite this to use the attached data in the message
				// print("we have incoming bombardment", msg.ID, game.PhaseBUSY, game.PhaseDONE, game.PhaseTODO)
				Session.Incoming = append(Session.Incoming, msg.ID)
				Session.Game.PhaseTODO = true
				Session.Game.PhaseDONE = false
				if !Session.Game.PhaseBUSY {
					doTurnSummary()
				}
			case "IncomingCancel":
				for i, v := range Session.Incoming {
					if v == msg.ID {
						Session.Incoming = append(Session.Incoming[:i], Session.Incoming[i+1:]...)
						break
					}
				}
				if !Session.Game.PhaseBUSY {
					doTurnSummary()
				}
				if Session.Panel == "BBReceive2" {
					consolePhaseNotBusy()
				}
			case "Unit":
				// print("unit message", msg.Unit.Description)
				theUnit := Session.Game.GetUnit(team, msg.Unit.ID)
				switch msg.Opcode {
				case shared.UnitEventFired:
					theUnit.Ammo = msg.Unit.Ammo
					theUnit.GunsFired = msg.Unit.GunsFired
					if Session.Panel == "BB2" {
						// doBB2(game, consoleCurrentCmd)
						Session.Nav(fmt.Sprintf("/play/%d/bombard_target/%d", Session.Game.ID, Session.Cmd.ID))
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
						oldUnit := Session.Game.GetUnit(team, msg.ID)
						*oldUnit = newUnit
						Session.Cmd = Session.Game.GetCmd(team, newUnit.CmdID)
						// print("BB data", oldUnit.Bombard)
						// doBB2(Session.Game, cmd)
						Session.Nav(fmt.Sprintf("/play/%d/bombard/unit", Session.Game.ID))
					}
				}()
			}
		}

		consolePhaseNotBusy()
		// doTurnSummary(game)

		doDisplayPanel := func(mode string) {
			// consoleCurrentPanel = mode
			Session.Panel = mode
			consoleSetViewBox(100, 100, false)
			switch mode {
			case "Orders":
				// doOrders(game)
				Session.Nav(fmt.Sprintf("/play/%d/orders", Session.Game.ID))
			case "Map":
				// doMap(game)
				Session.Nav(fmt.Sprintf("/play/%d/map", Session.Game.ID))
			case "Units":
				// doUnits(game)
				Session.Nav(fmt.Sprintf("/play/%d/units", Session.Game.ID))
			case "Game":
				consolePhaseNotBusy()
			}
		}
		doDisplayPanel(Session.Panel)

		gameMsg := func(action string, msg *shared.NetData, context *router.Context) {
			if msg.GameID == gameID {
				print("Game update for this game")
				newGame := &shared.Game{}
				err := RPC("GameRPC.GetPlay", shared.GameRPCData{
					Channel:  Session.Channel,
					ID:       gameID,
					GetUnits: true,
				}, newGame)
				if err != nil || newGame.ID == 0 {
					dom.GetWindow().Alert("Exiting this game .. Bye, and thanks for Playing")
					// dom.GetWindow().Alert("Cannot load game" + err.Error())
					Session.Navigate("/")
				}
				Session.Game = newGame
				doDisplayPanel(Session.Panel)
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

		if Session.Game.HostedBy == Session.UserID {
			doc.QuerySelector("[name=hosting-users]").AddEventListener("click", false, func(evt dom.Event) {
				// print("edit users")
				Session.Navigate(fmt.Sprintf("/game/%d/players", gameID))
			})
		}

	}()
}

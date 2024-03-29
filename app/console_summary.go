package main

import (
	"fmt"
	"strconv"

	"./shared"
	"github.com/go-humble/router"
	"honnef.co/go/js/dom"
)

// func getPhaseDescription(phase int) (string, string, string, string) {
func getPhaseDescription(phase int) (string, string) {
	switch phase {
	case shared.PhaseOrders:
		return "Pre Game Orders", ".. Enter Initial Orders"
	case shared.PhaseGT:
		return "Grand Tactical Phase", ".. March Moves, Orders, Bombardment"
	case shared.PhaseTactical:
		return "Tactical Phase", "Tactical Actions"
	case shared.PhaseObjectives:
		return "Objectives Phase", ".. Claim Objectives, Rally Troops"
		// case shared.PhaseGT1:
		// 	if Session.Orientation == "Portrait" {
		// 		return "March Orders", ".. Move un-engaged units", "Move", "Waiting .."
		// 	} else {
		// 		return "Grand Tactical March", ".. Move un-engaged units", "Move", "Waiting .."
		// 	}
		// case shared.PhaseBB:
		// 	return "Bombardment", ".. Grand Tactical Bombardment", "Fire Missions", "Waiting .."
		// case shared.PhaseGT2:
		// 	return "Extra Movement", ".. Cav and Skirmisher extra Moves", "Move", "Waiting .."
		// case shared.PhaseCommander:
		// 	return "Commander Actions", ".. Corps Commander Actions", "Commander Action", "Waiting .."
		// case shared.PhaseEngage:
		// 	return "Engage/Disengage", ".. Confirm unit contacts", "Engagements", "Waiting .."
		// case shared.PhaseTactical:
		// 	return "Tactical Engagement", ".. Resolve Tactical Engagements", "Tactical Action", "Waiting .."
		// case shared.PhaseObjectives:
		// 	return "Claim Objectives", ".. Confirm Status for all Objectives", "Objectives", "Waiting .."
		// default:
		// 	return "??", "??", "??", "Waiting .."
	}
	return "Error", ".. something went wrong, try reloading the game"
}

func doTurnSummary() {
	Session.Nav(fmt.Sprintf("/play/%d/summary", Session.Game.ID))
}

func playSummary(context *router.Context) {
	gameID, _ := strconv.Atoi(context.Params["game"])

	if Session.Game == nil || Session.Game.ID != gameID {
		print("no game loaded")
		Session.Navigate(fmt.Sprintf("/play/%d", gameID))
		return
	}

	w := dom.GetWindow()
	doc := w.Document()
	c := doc.QuerySelector("[name=svg-console]")
	if c == nil {
		Session.Navigate("/")
	}
	g := c.QuerySelector("[name=g-main]")
	html := ""
	xx := 100
	if Session.Orientation == "Landscape" {
		consoleSetViewBox(150, 100, false)
		xx = 150
	} else {
		consoleSetViewBox(100, 100, false)
	}

	// Add a turn summary object

	team := "blue"
	if Session.Game.Red {
		team = "red"
	}

	// title, phaseName, confirmText, doneText := getPhaseDescription(game.Phase)
	title, phaseName := getPhaseDescription(Session.Game.Phase)
	if Session.Game.Turn > 0 {
		turn := fmt.Sprintf("Turn %d of %d", Session.Game.Turn, Session.Game.TurnLimit)
		html += svgText(xx/2, 12, "text__middle text__2x text__"+team, turn)
	}

	if Session.Game.Phase != shared.PhaseTactical {
		html += svgText(xx/2, 24, "text__middle text__2x text__"+team, title)
	}
	if !Session.Game.PhaseTODO {
		html += svgText(xx-10, 36, "text__end text__1x text__"+team, ".. nothing for us this Turn")
	} else {
		html += svgText(xx-10, 36, "text__end text__1x text__"+team, phaseName)
	}
	if Session.Game.Turn > 1 {
		html += svgText(xx-5, 83, "text__end text__1x text__"+team, fmt.Sprintf("Victory Points = %d", Session.Game.VP))
	}

	html += svgHelpBtn()

	// list coins for incoming fire to be resolved, in GT mode
	if Session.Game.Phase == shared.PhaseGT {
		if len(Session.Incoming) > 0 {
			html += `<g id=incoming>`
			for i, v := range Session.Incoming {
				html += fmt.Sprintf(`<g id=incoming-%d data-id=%d>
<circle data-id=%d class=help-button cx=%d cy=%d r=5></circle>
<text data-id=%d x=%d y=%d class="text__gold text__2x">%d</text>
</g>`, v, v, v, i*10+10, 50, v, i*10+8, 50+2, v)
			}
			html += `</g>`
		}
	}

	// list coins for fights to be resolved, in TAC mode
	if Session.Game.Phase == shared.PhaseTactical {
		if len(Session.Fights) > 0 {
			html += `<g id=fights>`
			x := 0
			y := 15
			for _, v := range Session.Fights {
				svgID = v.ID
				html += fmt.Sprintf(`<g id=fight-%d data-id=%d>`, v.ID, v.ID)
				html += svgButton(x, y, 48, 12, "fight-button", "text__0x", v.Name)
				html += `</g>`

				x += 50
				if x >= xx {
					x = 0
					y += 15
				}
				if y > 80 {
					break
				}
			}
			html += `</g>`
		}
	}

	// print("our state", game.Turn, game.Phase, game.PhaseTODO, game.PhaseDONE)
	// allTheThings := false
	html += svgG(1)
	if Session.Game.PhaseTODO {
		// we have things to do this turn
		if !Session.Game.PhaseDONE {
			// we are yet to do all the things, so add a button that takes us to the page to do all the things
			// html += svgButton(40, 85, 50, 12, "text__paper", "console-text text__hand", confirmText)
			html += svgButton(xx-32, 85, 30, 12, "text__paper", "console-text text__1x text__"+team, "Done")
			// allTheThings = true
		} else {
			// we have done all the things
			// html += svgButton(40, 85, 50, 12, "text__done", "console-text text__hand", doneText)
			html += svgButton(xx-32, 85, 30, 12, "text__done", "console-text text__1x text__"+team, "Wait..")
			// html += paperDoneButton("done", doneText, 40, 85, 50)
		}
	} else {
		// there is nothing for us this turn
		// html += svgButton(40, 85, 50, 12, "text__paper", "console-text text__hand", confirmText)
		html += svgButton(xx-32, 85, 30, 12, "text__done", "console-text text__1x text__"+team, "Wait..")
	}
	html += svgEndG()

	switch Session.Game.Phase {
	case shared.PhaseOrders:
		html += svgG(2)
		html += svgButton(xx-96, 85, 30, 12, "text__paper", "console-text text__1x text__"+team, "Orders")
		html += svgEndG()
		html += svgG(3)
		html += svgButton(xx-64, 85, 30, 12, "text__paper", "console-text text__1x text__"+team, "Units")
		html += svgEndG()
	case shared.PhaseGT:
		html += svgG(4)
		html += svgButton(xx-96, 85, 30, 12, "text__paper", "console-text text__1x text__"+team, "Move")
		html += svgEndG()
		html += svgG(5)
		html += svgButton(xx-64, 85, 30, 12, "text__paper", "console-text text__1x text__"+team, "Fire")
		html += svgEndG()
	case shared.PhaseTactical:
		html += svgG(6)
		html += svgButton(xx-64, 85, 30, 12, "text__paper", "console-text text__1x text__"+team, "New Fight")
		html += svgEndG()
		// html += svgG(7)
		// html += svgButton(xx-64, 85, 30, 12, "text__paper", "console-text text__1x text__"+team, "Commit")
		// html += svgEndG()
	case shared.PhaseObjectives:
	}

	g.SetInnerHTML(html)

	svgCallback(1, func(dom.Event) { consolePhaseDone() })
	svgCallback(2, func(dom.Event) { doPreGameOrders() })
	svgCallback(3, func(dom.Event) { doUnits(Session.Game) })

	if Session.Game.Phase == shared.PhaseGT {
		svgCallback(4, func(dom.Event) { doGT1(Session.Game) })
		svgCallback(5, func(dom.Event) {
			Session.Nav(fmt.Sprintf("/play/%d/bombard", Session.Game.ID))
		})
		svgCallbackQuery("#help", func(dom.Event) {
			loadTemplate("gt-move", "#unit-details", nil)
			doc.QuerySelector("#unit-details").Class().Add("md-show")
			doc.QuerySelector("[name=gt-move]").AddEventListener("click", false, func(evt dom.Event) {
				doc.QuerySelector("#unit-details").Class().Remove("md-show")
			})
		})
		svgCallbackQuery("#incoming", func(evt dom.Event) {
			el := evt.Target()
			id, _ := strconv.Atoi(el.GetAttribute("data-id"))
			if id > 0 {
				go func() {
					bb := ""
					err := RPC("GameRPC.GetIncomingBombard", shared.BombardData{
						Channel: Session.Channel,
						GameID:  Session.Game.ID,
						ID:      id,
					}, &bb)
					if err != nil {
						print(err.Error())
					} else {
						print("got bb", bb)
						doBBReceive(Session.Game, id, bb)
					}

				}()
			}
		})
	}

	if Session.Game.Phase == shared.PhaseTactical {
		svgCallback(6, func(dom.Event) { doNewFight(Session.Game) })
		// svgCallback(7, func(dom.Event) { doCommitFight(game) })
		svgCallbackQuery("#help", func(dom.Event) {
			loadTemplate("fight", "#unit-details", nil)
			doc.QuerySelector("#unit-details").Class().Add("md-show")
			doc.QuerySelector("[name=fight]").AddEventListener("click", false, func(evt dom.Event) {
				doc.QuerySelector("#unit-details").Class().Remove("md-show")
			})
		})
		svgCallbackQuery("#fight", func(evt dom.Event) {
			el := evt.Target()
			id, _ := strconv.Atoi(el.GetAttribute("data-id"))
			if id > 0 {
				go func() {
					fight := &shared.Fight{}
					err := RPC("GameRPC.GetFight", shared.FightData{
						Channel: Session.Channel,
						ID:      id,
					}, &fight)
					if err != nil {
						print(err.Error())
					} else {
						print("got fight", fight)
						Session.Fight = fight
						Session.Nav(fmt.Sprintf("/play/%d/fight/%d", Session.Game.ID, Session.Fight.ID))
						// doFight(game, id, fight)
					}

				}()
			}
		})
		for _, v := range Session.Fights {
			svgCallbackQuery(fmt.Sprintf("#fight-%d", v.ID), func(evt dom.Event) {
				el := evt.Target()
				id, _ := strconv.Atoi(el.GetAttribute("data-id"))
				for _, f := range Session.Fights {
					if id == f.ID {
						// doFight(game, f)
						Session.Fight = f
						Session.Nav(fmt.Sprintf("/play/%d/fight/%d", Session.Game.ID, Session.Fight.ID))
					}
				}
			})
		}
	}
}

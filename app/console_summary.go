package main

import (
	"fmt"
	"strconv"

	"./shared"
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
		return "Tactical Phase", ".. Apply unit actions to Engagements"
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

func doTurnSummary(game *shared.Game) {
	w := dom.GetWindow()
	doc := w.Document()
	c := doc.QuerySelector("[name=svg-console]")
	if c == nil {
		Session.Navigate("/")
	}
	g := c.QuerySelector("[name=g-main]")
	html := ""

	consoleSetViewBox(game, 100, 100, false)

	// Add a turn summary object

	team := "blue"
	if game.Red {
		team = "red"
	}

	// title, phaseName, confirmText, doneText := getPhaseDescription(game.Phase)
	title, phaseName := getPhaseDescription(game.Phase)
	if game.Turn > 0 {
		turn := fmt.Sprintf("Turn %d of %d", game.Turn, game.TurnLimit)
		html += svgText(0, 10, "text__2x text__"+team, turn)
	}

	html += svgText(50, 25, "text__middle text__2x text__"+team, title)
	if !game.PhaseTODO {
		html += svgText(100, 40, "text__end text__1x text__"+team, ".. nothing for us this Turn")
	} else {
		html += svgText(100, 40, "text__end text__1x text__"+team, phaseName)
	}
	if game.Turn > 1 {
		html += svgText(50, 70, "text__middle text__2x text__"+team, fmt.Sprintf("Victory Points = %d", game.VP))
	}

	// list coins for incoming fire to be resolved
	if len(incoming) > 0 {
		html += `<g id=incoming>`
		for i, v := range incoming {
			html += fmt.Sprintf(`<g id=incoming-%d data-id=%d>
<circle data-id=%d class=help-button cx=%d cy=%d r=5></circle>
<text data-id=%d x=%d y=%d class="text__gold text__2x">%d</text>
</g>`, v, v, v, i*10, 50, v, i*10-2, 50+2, v)
		}
		html += `</g>`
	}

	// print("our state", game.Turn, game.Phase, game.PhaseTODO, game.PhaseDONE)
	// allTheThings := false
	html += svgG(1)
	if game.PhaseTODO {
		// we have things to do this turn
		if !game.PhaseDONE {
			// we are yet to do all the things, so add a button that takes us to the page to do all the things
			// html += svgButton(40, 85, 50, 12, "text__paper", "console-text text__hand", confirmText)
			html += svgButton(66, 85, 30, 12, "text__paper", "console-text text__1x text__"+team, "Done")
			// allTheThings = true
		} else {
			// we have done all the things
			// html += svgButton(40, 85, 50, 12, "text__done", "console-text text__hand", doneText)
			html += svgButton(66, 85, 30, 12, "text__done", "console-text text__1x text__"+team, "Wait..")
			// html += paperDoneButton("done", doneText, 40, 85, 50)
		}
	} else {
		// there is nothing for us this turn
		// html += svgButton(40, 85, 50, 12, "text__paper", "console-text text__hand", confirmText)
		html += svgButton(66, 85, 30, 12, "text__done", "console-text text__1x text__"+team, "Wait..")
	}
	html += svgEndG()

	switch game.Phase {
	case shared.PhaseOrders:
		html += svgG(2)
		html += svgButton(0, 85, 30, 12, "text__paper", "console-text text__1x text__"+team, "Orders")
		html += svgEndG()
		html += svgG(3)
		html += svgButton(33, 85, 30, 12, "text__paper", "console-text text__1x text__"+team, "Units")
		html += svgEndG()
	case shared.PhaseGT:
		html += svgG(4)
		html += svgButton(0, 85, 30, 12, "text__paper", "console-text text__1x text__"+team, "Move")
		html += svgEndG()
		html += svgG(5)
		html += svgButton(33, 85, 30, 12, "text__paper", "console-text text__1x text__"+team, "Fire")
		html += svgEndG()
	case shared.PhaseTactical:
		html += svgG(6)
		html += svgButton(0, 85, 30, 12, "text__paper", "console-text text__1x text__"+team, "Commit")
		html += svgEndG()
		html += svgG(7)
		html += svgButton(33, 85, 30, 12, "text__paper", "console-text text__1x text__"+team, "Fight")
		html += svgEndG()
	case shared.PhaseObjectives:
	}

	g.SetInnerHTML(html)

	svgCallback(1, func(dom.Event) { consolePhaseDone(game) })
	svgCallback(2, func(dom.Event) { doPreGameOrders(game) })
	svgCallback(3, func(dom.Event) { doUnits(game) })
	svgCallback(4, func(dom.Event) { doGT1(game) })
	svgCallback(5, func(dom.Event) { doBB(game) })

	svgCallbackQuery("#incoming", func(evt dom.Event) {
		el := evt.Target()
		id, _ := strconv.Atoi(el.GetAttribute("data-id"))
		if id > 0 {
			go func() {
				bb := ""
				err := RPC("GameRPC.GetIncomingBombard", shared.BombardData{
					Channel: Session.Channel,
					GameID:  game.ID,
					ID:      id,
				}, &bb)
				if err != nil {
					print(err.Error())
				} else {
					print("got bb", bb)
					doBBReceive(game, id, bb)
				}

			}()
		}
	})

	// if allTheThings {
	// 	// All the things are yet to be done
	// 	svgCallback(1, func(evt dom.Event) {
	// 		// print("clicked on thing in phase", game.Phase)
	// 		switch game.Phase {
	// 		case shared.PhaseOrders:
	// 			doOrders(game)
	// 		case shared.PhaseGT1:
	// 			doGT1(game)
	// 		case shared.PhaseBB:
	// 			doBB(game)
	// 		case shared.PhaseGT2:
	// 			doGT2(game)
	// 		case shared.PhaseCommander:
	// 			doCommanderAction(game)
	// 		case shared.PhaseEngage:
	// 			doEngage(game)
	// 		case shared.PhaseTactical:
	// 			doTactical(game)
	// 		case shared.PhaseObjectives:
	// 			doObjectives(game)
	// 		}
	// 		// paperButtonSet(evt, doneText)
	// 		// consolePhaseDone(game)
	// 	})
	// }
}

func doEngage(game *shared.Game) {
	// w := dom.GetWindow()
	// doc := w.Document()
	// c := doc.QuerySelector("[name=svg-console]")

	consoleSetViewBox(game, 100, 100, false)
	consolePhaseBusy(game, "Engage")
	print("phaseEngage")
	// dom.GetWindow().Alert("all done")
	consolePhaseDone(game)
}
func doTactical(game *shared.Game) {
	// w := dom.GetWindow()
	// doc := w.Document()
	// c := doc.QuerySelector("[name=svg-console]")

	consoleSetViewBox(game, 100, 100, false)
	consolePhaseBusy(game, "Tactical")
	print("phaseTactical")
	// dom.GetWindow().Alert("all done")
	consolePhaseDone(game)
}
func doObjectives(game *shared.Game) {
	// w := dom.GetWindow()
	// doc := w.Document()
	// c := doc.QuerySelector("[name=svg-console]")

	// consoleSetViewBox(game, 100, 100, false)
	consolePhaseBusy(game, "Objectives")
	print("phaseObjectives")
	// dom.GetWindow().Alert("all done")
	consolePhaseDone(game)
}

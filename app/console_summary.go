package main

import (
	"fmt"

	"./shared"
	"honnef.co/go/js/dom"
)

func getPhaseDescription(phase int) (string, string, string, string) {
	switch phase {
	case 1:
		return "GT Movement", ".. Move un-engaged units", "All Moved", "Waiting .."
	case 2:
		return "Bombardment", ".. Corps Level Bombardment", "Cease Fire", "Waiting .."
	case 3:
		return "Engage/Disengage", ".. Confirm unit contacts", "Confirm", "Waiting .."
	case 4:
		return "Commander Actions", ".. Corps level Commander Actions", "I am Done", "Waiting .."
	case 5:
		return "Tactical Engagement", ".. Resolve Tactical Engagements", "All Done", "Waiting .."
	case 6:
		return "Claim Objectives", ".. Confirm Status for all Objectives", "Confirm", "Waiting .."
	default:
		return "Pre Game Orders", ".. Enter Initial Orders", "Send Orders", "Dispatched"
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

	title, phaseName, confirmText, doneText := getPhaseDescription(game.Phase)
	html := ""
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

	dispatchOrders := func(evt dom.Event) {
		game.PhaseDONE = true
		paperButtonSet(evt, doneText)
		consolePhaseDone(game)
	}

	// print("our state", game.Turn, game.Phase, game.PhaseTODO, game.PhaseDONE)
	allTheThings := false
	if game.Phase == 0 {
		// special case - we are in pre-game, and we must get them to go into the orders tab first
		// this only applies on the special pre-game stuff
	} else {
		html += svgG(1)
		if game.PhaseTODO {
			// we have things to do this turn
			if !game.PhaseDONE {
				// we are yet to do all the things
				html += svgButton(40, 85, 50, 12, "text__paper", "console-text text__hand", confirmText)
				// html += paperButton("done", confirmText, 40, 85, 50, dispatchOrders)
				allTheThings = true
			} else {
				// we have done all the things
				html += svgButton(40, 85, 50, 12, "text__done", "console-text text__hand", doneText)
				// html += paperDoneButton("done", doneText, 40, 85, 50)
			}
		} else {
			// there is nothing for us this turn
			if !game.PhaseDONE {
				// but we are busy doing something with troop orders anyway
				html += svgButton(40, 85, 50, 12, "text__paper", "console-text text__hand", confirmText)
				allTheThings = true
			}
			// html += svgButton(40, 85, 50, 12, "text__done", "console-text text__hand", doneText)
			// html += paperDoneButton("done", doneText, 40, 85, 50)
		}
		html += svgEndG()
	}
	g.SetInnerHTML(html)

	if allTheThings {
		// All the things are yet to be done
		svgCallback(1, dispatchOrders)
		// svgButtonCallback("done", dispatchOrders)
	}
}

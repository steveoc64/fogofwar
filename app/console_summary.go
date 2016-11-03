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
		html += svgText(2, 10, 2, team, turn)
	}

	html += svgText(2, 25, 2, team, title)
	if !game.PhaseTODO {
		html += svgText(2, 40, 1, team, ".. nothing for us this Turn")
	} else {
		html += svgText(2, 40, 1, team, phaseName)
	}
	if game.Turn > 1 {
		html += svgText(3, 70, 2, team, fmt.Sprintf("Victory Points = %d", game.VP))
	}

	dispatchOrders := func(evt dom.Event) {
		game.PhaseDONE = true
		paperButtonSet(evt, doneText)
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

	// print("our state", game.Turn, game.Phase, game.PhaseTODO, game.PhaseDONE)
	if game.Phase == 0 {
		// special case - we are in pre-game, and we must get them to go into the orders tab first
		// this only applies on the special pre-game stuff
	} else {
		if game.PhaseTODO && !game.PhaseDONE {
			// we have things to do this phase, and we havent done them yet
			html += paperButton("done", confirmText, 40, 85, 50, dispatchOrders)
		}
		if !game.PhaseTODO {
			// there is nothing for us to do this phase, so just show the waiting button
			html += paperDoneButton("done", doneText, 40, 85, 50)
		}
	}
	g.SetInnerHTML(html)

	if game.Phase != 0 && (game.PhaseTODO && !game.PhaseDONE) {
		// there are things we have to do this phase, and we havent done them yet
		paperCallback("done", dispatchOrders)
	}
}

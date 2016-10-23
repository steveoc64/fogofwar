package main

import (
	"fmt"
	"strconv"

	"./shared"
	"github.com/go-humble/router"
	"github.com/steveoc64/formulate"
	"honnef.co/go/js/dom"
)

func gameChecklist(context *router.Context) {
	id, err := strconv.Atoi(context.Params["id"])
	if err != nil {
		print(err.Error())
		return
	}
	go func() {
		// Create a new Game Editting Object
		Session.EditGame = &shared.Game{}
		err := RPC("GameRPC.Get", shared.GameRPCData{
			Channel:  Session.Channel,
			ID:       id,
			Red:      true,
			Blue:     true,
			GetUnits: true,
		}, Session.EditGame)
		if err != nil {
			dom.GetWindow().Alert(err.Error())
			return
		}
		game := Session.EditGame
		game.InMode = "Checklist"
		// print("using existing game", game)

		w := dom.GetWindow()
		doc := w.Document()

		form := formulate.EditForm{}

		// Layout the fields

		form.New("fa-check-square-o", "Game Checklist - "+game.Name)

		form.Row(1).
			AddInput(1, "Name", "Name")

		form.Row(1).
			AddCustom(1, "", "TODO", "game-checklist")

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate("/games")
		})

		form.DeleteEvent(func(evt dom.Event) {
			evt.PreventDefault()
			go func() {
				done := false
				err := RPC("GameRPC.Delete", shared.GameRPCData{
					Channel: Session.Channel,
					ID:      id,
				}, &done)
				if err != nil {
					dom.GetWindow().Alert(err.Error())
				} else {
					Session.Navigate("/games")
				}
			}()
		})

		// All done, so render the form
		form.Render("edit-form", "main", game)

		// Load up the checklist from a template, and manually set a listener on each one
		loadTemplate("game-checklist", "[name=TODO]", game)
		for _, ai := range doc.QuerySelectorAll(".action__item") {
			url := ai.(*dom.HTMLDivElement).GetAttribute("url")
			if url != "" {
				ai.AddEventListener("click", false, func(evt dom.Event) {
					url := evt.CurrentTarget().GetAttribute("url")
					Session.Navigate(url)
				})
			}
		}
		// If good to go, then add the good class
		if game.GoodToGo() {
			form.Get("TODO").Class().Add("todo-list-good")
		}

		showDisqus(fmt.Sprintf("game-%d", id), fmt.Sprintf("Game - %06d - %s", game.ID, game.Name))

	}()

}

func gameNew(context *router.Context) {

	// Firstly select a scenario to base the game on

	go func() {
		s1 := []shared.Scenario{}
		s2 := []shared.Scenario{}
		RPC("ScenarioRPC.List", Session.Channel, &s1)
		RPC("ScenarioRPC.ListPublic", Session.Channel, &s2)
		data := append(s1, s2...)

		form := formulate.ListForm{}
		form.New("fa-sitemap", "Choose Scenario To Base Game On :")

		// Define the layout
		form.Column("Author", "AuthorName")
		form.AvatarColumn("Author", "AuthorEmail")
		form.Column("Name", "Name")
		form.Column("Year", "Year")
		form.Column("Description", "Descr")
		form.BoolColumn("Reviewing", "Review")
		form.BoolColumn("Published", "Public")

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Back()
		})

		form.RowEvent(func(key string) {
			print("base it on ", key)
			go func() {
				scenID, err := strconv.Atoi(key)
				newID := 0
				if err == nil {
					err = RPC("ScenarioRPC.CreateGame", shared.ScenarioRPCData{
						Channel: Session.Channel,
						ID:      scenID,
					}, &newID)
					if err == nil {
						print("Created Game", newID)
						Session.Navigate(fmt.Sprintf("/game/%d/checklist", newID))
					}
				}

			}()
		})

		form.Render("select-scenario", "main", data)
	}()

}

func gameEditOverview(context *router.Context) {
	id, err := strconv.Atoi(context.Params["id"])
	if err != nil {
		print(err.Error())
		return
	}

	go func() {
		game := Session.EditGame
		game.InMode = "Overview"

		form := formulate.EditForm{}

		// Layout the fields

		form.New("fa-bookmark", "Edit Game Details - "+game.Name)

		form.Row(5).
			AddDate(1, "Start Date", "StartDate").
			AddDate(1, "Game Ends", "Expires").
			AddNumber(1, "Year", "Year", "1").
			AddNumber(1, "Turn", "Turn", "1").
			AddNumber(1, "Turn Limit", "TurnLimit", "1")

		form.Row(5).
			AddInput(1, "Name", "Name").
			AddInput(4, "Description", "Descr")

		form.Row(1).
			AddTextarea(1, "Notes", "Notes")

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate(fmt.Sprintf("/game/%d", id))
		})

		form.SaveEvent(func(evt dom.Event) {
			evt.PreventDefault()
			form.Bind(game)
			go func() {
				err := RPC("GameRPC.Update", shared.GameRPCData{
					Channel: Session.Channel,
					ID:      id,
					Game:    game,
				}, game)
				if err != nil {
					dom.GetWindow().Alert(err.Error())
				}
			}()
		})

		form.PrintEvent(func(evt dom.Event) {
			dom.GetWindow().Print()
		})

		// All done, so render the form
		form.Render("edit-form", "main", game)
		form.ActionGrid("game-actions", "#action-grid", game, func(url string) {
			print("clicked on", url)
			Session.Navigate(url)
		})
		showDisqus(fmt.Sprintf("game-%d", id), fmt.Sprintf("Game - %06d - %s", game.ID, game.Name))
	}()
}

func gameEditRed(context *router.Context) {
	context.Params["team"] = "Red"
	gameEditTeam(context)
}

func gameEditBlue(context *router.Context) {
	context.Params["team"] = "Blue"
	gameEditTeam(context)
}
func gameEditPlayers(context *router.Context) {
	print("TODO - gameEditPlayers")

}

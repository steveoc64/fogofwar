package main

import (
	"fmt"
	"strconv"

	"./shared"
	"github.com/go-humble/router"
	"github.com/steveoc64/formulate"
	"honnef.co/go/js/dom"
)

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
		game := shared.Game{}
		err := RPC("GameRPC.Get", shared.GameRPCData{
			Channel: Session.Channel,
			ID:      id,
		}, &game)
		if err != nil {
			dom.GetWindow().Alert(err.Error())
			return
		}
		game.InMode = "Overview"

		form := formulate.EditForm{}

		// Layout the fields

		form.New("fa-bookmark", "Edit Game Details - "+game.Name)

		form.Row(5).
			AddDate(1, "Created", "Created").
			AddDate(1, "Expires", "Expires").
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
			form.Bind(&game)
			go func() {
				err := RPC("GameRPC.Update", shared.GameRPCData{
					Channel: Session.Channel,
					ID:      id,
					Game:    &game,
				}, &game)
				if err != nil {
					dom.GetWindow().Alert(err.Error())
				}
			}()
		})

		form.PrintEvent(func(evt dom.Event) {
			dom.GetWindow().Print()
		})

		// All done, so render the form
		form.Render("edit-form", "main", &game)
		form.ActionGrid("game-actions", "#action-grid", &game, func(url string) {
			print("clicked on", url)
			Session.Navigate(url)
		})
		showDisqus(fmt.Sprintf("game-%d", id), fmt.Sprintf("Game - %06d - %s", game.ID, game.Name))
	}()
}

func gameEditRed(context *router.Context) {
	id, err := strconv.Atoi(context.Params["id"])
	if err != nil {
		print(err.Error())
		return
	}

	go func() {
		game := shared.Game{}
		RPC("GameRPC.Get", shared.GameRPCData{
			Channel: Session.Channel,
			ID:      id,
			Red:     true,
		}, &game)
		print("game red", game)

		form := formulate.EditForm{}

		// Layout the fields

		form.New("fa-bookmark", "Red Team Details - "+game.Name)

		form.Row(5).
			AddDate(1, "Created", "Created").
			AddDate(1, "Expires", "Expires").
			AddNumber(1, "Year", "Year", "1").
			AddNumber(1, "Turn", "Turn", "1").
			AddNumber(1, "Turn Limit", "TurnLimit", "1")

		form.Row(1).
			AddInput(1, "Name", "Name")

		form.Row(1).
			AddInput(1, "Red Team", "RedTeam")

		form.Row(1).
			AddTextarea(1, "Red Briefing", "RedBrief")

		form.Row(1).
			AddDisplay(1, "# Red Players", "NumRedPlayers")

		form.Row(1).
			AddCustom(1, "Commands", "Commands", "")

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate(fmt.Sprintf("/game/%d", id))
		})

		form.SaveEvent(func(evt dom.Event) {
			evt.PreventDefault()
			form.Bind(&game)
			go func() {
				RPC("GameRPC.UpdateRed", shared.GameRPCData{
					Channel: Session.Channel,
					ID:      id,
					Game:    &game,
				}, &game)
				// Session.Navigate("/games")
			}()
		})

		form.PrintEvent(func(evt dom.Event) {
			dom.GetWindow().Print()
		})

		// All done, so render the form
		form.Render("edit-form", "main", &game)
		form.ActionGrid("game-actions", "#action-grid", &game, func(url string) {
			print("clicked on", url)
			Session.Navigate(url)
		})

		// Add a button bar for all the commands in this team
		w := dom.GetWindow()
		doc := w.Document()
		div := form.Get("Commands")
		div.SetInnerHTML("")
		bbar := doc.CreateElement("DIV")
		bbar.Class().Add("button-bar")
		for _, v := range game.RedCmd {
			btn := doc.CreateElement("INPUT").(*dom.HTMLInputElement)
			btn.Class().SetString("button button-outline")
			btn.Value = v.Name
			btn.SetAttribute("data-cmd-id", fmt.Sprintf("%d", v.ID))
			bbar.AppendChild(btn)

			btn.AddEventListener("click", false, func(evt dom.Event) {
				b := evt.Target()
				k, _ := strconv.Atoi(b.GetAttribute("data-cmd-id"))
				print("clicked on red command ", k)
			})
		}
		div.AppendChild(bbar)

		showDisqus(fmt.Sprintf("game-%d", id), fmt.Sprintf("Game - %06d - %s", game.ID, game.Name))
	}()
}

func gameEditBlue(context *router.Context) {
	id, err := strconv.Atoi(context.Params["id"])
	if err != nil {
		print(err.Error())
		return
	}

	go func() {
		game := shared.Game{}
		RPC("GameRPC.Get", shared.GameRPCData{
			Channel: Session.Channel,
			ID:      id,
			Blue:    true,
		}, &game)
		print("game blue", game)

		form := formulate.EditForm{}

		// Layout the fields

		form.New("fa-bookmark", "Blue Team Details - "+game.Name)

		form.Row(5).
			AddDate(1, "Created", "Created").
			AddDate(1, "Expires", "Expires").
			AddNumber(1, "Year", "Year", "1").
			AddNumber(1, "Turn", "Turn", "1").
			AddNumber(1, "Turn Limit", "TurnLimit", "1")

		form.Row(1).
			AddInput(1, "Name", "Name")

		form.Row(1).
			AddInput(1, "Blue Team", "BlueTeam")

		form.Row(1).
			AddTextarea(1, "Blue Briefing", "BlueBrief")

		form.Row(1).
			AddDisplay(1, "# Blue Players", "NumBluePlayers")

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate(fmt.Sprintf("/game/%d", id))
		})

		form.SaveEvent(func(evt dom.Event) {
			evt.PreventDefault()
			form.Bind(&game)

			go func() {
				RPC("GameRPC.UpdateBlue", shared.GameRPCData{
					Channel: Session.Channel,
					ID:      id,
					Game:    &game,
				}, &game)
				// Session.Navigate("/games")
			}()
		})

		form.PrintEvent(func(evt dom.Event) {
			dom.GetWindow().Print()
		})

		// All done, so render the form
		form.Render("edit-form", "main", &game)
		form.ActionGrid("game-actions", "#action-grid", &game, func(url string) {
			print("clicked on", url)
			Session.Navigate(url)
		})

		// Add a button bar for all the commands in this team
		w := dom.GetWindow()
		doc := w.Document()
		div := form.Get("Commands")
		div.SetInnerHTML("")
		bbar := doc.CreateElement("DIV")
		bbar.Class().Add("button-bar")
		for _, v := range game.BlueCmd {
			btn := doc.CreateElement("INPUT").(*dom.HTMLInputElement)
			btn.Class().SetString("button button-outline")
			btn.Value = v.Name
			btn.SetAttribute("data-cmd-id", fmt.Sprintf("%d", v.ID))
			bbar.AppendChild(btn)

			btn.AddEventListener("click", false, func(evt dom.Event) {
				b := evt.Target()
				k, _ := strconv.Atoi(b.GetAttribute("data-cmd-id"))
				print("clicked on blue command ", k)
			})
		}
		div.AppendChild(bbar)

		showDisqus(fmt.Sprintf("game-%d", id), fmt.Sprintf("Game - %06d - %s", game.ID, game.Name))
	}()
}

func gameEditPlayers(context *router.Context) {
	id, err := strconv.Atoi(context.Params["id"])
	if err != nil {
		print(err.Error())
		return
	}

	go func() {
		game := shared.Game{}
		RPC("GameRPC.Get", shared.GameRPCData{
			Channel: Session.Channel,
			ID:      id,
		}, &game)
		print("game players", game)

		form := formulate.EditForm{}

		form.New("fa-user", "Allocate Players For Game - "+game.Name)

		form.Row(5).
			AddDate(1, "Created", "Created").
			AddDate(1, "Expires", "Expires").
			AddNumber(1, "Year", "Year", "1").
			AddNumber(1, "Turn", "Turn", "1").
			AddNumber(1, "Turn Limit", "TurnLimit", "1")

		form.Row(1).
			AddInput(1, "Name", "Name")

		form.Row(2).
			AddInput(1, "Red Team", "RedTeam").
			AddInput(1, "Blue Team", "BlueTeam")

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate(fmt.Sprintf("/game/%d", id))
		})

		form.PrintEvent(func(evt dom.Event) {
			dom.GetWindow().Print()
		})

		// All done, so render the form
		form.Render("edit-form", "main", &game)
		form.ActionGrid("game-actions", "#action-grid", &game, func(url string) {
			print("clicked on", url)
			Session.Navigate(url)
		})

		showDisqus(fmt.Sprintf("game-%d", id), fmt.Sprintf("Game - %06d - %s", game.ID, game.Name))
	}()
}

func gameChecklist(context *router.Context) {
	print("TODO - gameChecklist")

	id, err := strconv.Atoi(context.Params["id"])
	if err != nil {
		print(err.Error())
		return
	}

	go func() {
		game := shared.Game{}
		err := RPC("GameRPC.Get", shared.GameRPCData{
			Channel: Session.Channel,
			ID:      id,
		}, &game)
		if err != nil {
			dom.GetWindow().Alert(err.Error())
			return
		}
		game.InMode = "Checklist"

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
		form.Render("edit-form", "main", &game)

		// Load up the checklist from a template, and manually set a listener on each one
		loadTemplate("game-checklist", "[name=TODO]", &game)
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
		// form.Get("TODO").Class().Add("todo-list-good")

		// form.ActionGrid("game-actions", "#action-grid", &game, func(url string) {
		// 	print("clicked on", url)
		// 	Session.Navigate(url)
		// })

		// showDisqus(fmt.Sprintf("game-%d", id), fmt.Sprintf("Game - %06d - %s", game.ID, game.Name))

	}()

}

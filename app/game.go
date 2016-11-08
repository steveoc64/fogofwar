package main

import (
	"fmt"
	"strconv"

	"./shared"
	"github.com/go-humble/locstor"
	"github.com/go-humble/router"
	"github.com/steveoc64/formulate"
	"honnef.co/go/js/dom"
)

func gameChecklist(context *router.Context) {
	Session.Subscribe("Game", _gameChecklist, context)
	Session.Subscribe("Play", _play, context)
	_gameChecklist("Edit", nil, context)
}

func _gameChecklist(action string, msg *shared.NetData, context *router.Context) {
	id, err := strconv.Atoi(context.Params["id"])
	if err != nil {
		print(err.Error())
		return
	}

	switch action {
	case "Update":
		if msg.ID != id {
			return
		}
		break
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
		locstor.SetItem("game_id", fmt.Sprintf("%d", game.ID))
		game.InMode = "Checklist"
		game.Mobile = Session.Mobile()
		// print("using existing game", game)

		w := dom.GetWindow()
		doc := w.Document()

		form := formulate.EditForm{}

		// Layout the fields

		title := "Game Hosting Checklist"
		if !Session.Mobile() {
			title += " - " + game.Name

		}
		form.New("fa-check-square-o", title)

		form.Row(1).
			AddCustom(1, "", "TODO", "game-checklist")

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate("/games")
		})

		if !game.Started {
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
		}

		// All done, so render the form
		form.Render("edit-form", "main", game)

		// Load up the checklist from a template, and manually set a listener on each one
		loadTemplate("game-checklist", "[name=TODO]", game)
		for _, ai := range doc.QuerySelectorAll(".action__item") {
			url := ai.(*dom.HTMLDivElement).GetAttribute("url")
			if url != "" {
				ai.AddEventListener("click", false, func(evt dom.Event) {
					url := evt.CurrentTarget().GetAttribute("url")
					if url == "Start" {
						print("Start Game")
						go func() {
							done := false
							err := RPC("GameRPC.Start", shared.GameRPCData{
								Channel: Session.Channel,
								ID:      id,
							}, &done)
							if err != nil {
								dom.GetWindow().Alert("Error starting game: " + err.Error())
							} else {
								Session.Navigate(fmt.Sprintf("/play/%d", id))
							}
						}()
					} else {
						Session.Navigate(url)
					}
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
		form.AvatarColumn("", "AuthorEmail")
		form.Column("Name", "Name")
		form.Column("Year", "Year")
		form.Column("Description", "Descr")

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
		game.Mobile = Session.Mobile()

		form := formulate.EditForm{}

		// Layout the fields

		form.New("fa-bookmark", "Edit Game Details - "+game.Name)

		if Session.Mobile() {
			form.Row(2).
				AddDate(1, "Start Date", "StartDate").
				AddDate(1, "Game Ends", "Expires")
			form.Row(3).
				AddNumber(1, "Year", "Year", "1").
				AddNumber(1, "Turn", "Turn", "1").
				AddNumber(1, "Turn Limit", "TurnLimit", "1")

			form.Row(1).
				AddInput(1, "Name", "Name")

			form.Row(1).
				AddTextarea(1, "Description", "Descr")

			form.Row(1).
				AddBigTextarea(1, "Notes", "Notes")
		} else {
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
		}

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate(fmt.Sprintf("/game/%d", id))
		})

		form.SaveEvent(func(evt dom.Event) {
			evt.PreventDefault()
			form.Bind(game)
			go func() {
				done := false
				err := RPC("GameRPC.Update", shared.GameRPCData{
					Channel: Session.Channel,
					ID:      id,
					Game:    game,
				}, &done)
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
	Session.Subscribe("Game", _gameEditPlayers, context)
	Session.Subscribe("Play", _play, context)
	_gameEditPlayers("Edit", nil, context)
}

func _gameEditPlayers(action string, msg *shared.NetData, context *router.Context) {
	id, err := strconv.Atoi(context.Params["id"])
	if err != nil {
		print(err.Error())
		return
	}

	if action == "Update" {
		if msg.ID != id {
			return
		}
		game := &shared.Game{}
		Session.EditGame = &shared.Game{}
		err := RPC("GameRPC.Get", shared.GameRPCData{
			Channel:  Session.Channel,
			ID:       id,
			Red:      true,
			Blue:     true,
			GetUnits: true,
		}, &game)
		if err != nil {
			dom.GetWindow().Alert(err.Error())
			return
		}
		Session.EditGame = game
		locstor.SetItem("game_id", fmt.Sprintf("%d", game.ID))
	}

	go func() {

		game := &shared.Game{}
		err = RPC("GameRPC.Get", shared.GameRPCData{
			Channel:  Session.Channel,
			ID:       id,
			Red:      true,
			Blue:     true,
			GetUnits: true,
		}, &game)
		if err != nil {
			dom.GetWindow().Alert(err.Error())
			return
		}
		Session.EditGame = game

		game.InMode = "Players"
		game.Mobile = Session.Mobile()
		form := formulate.EditForm{}

		// Layout the fields
		form.New("fa-user", "Players for Game - "+game.Name)

		form.Row(1).
			AddCustom(1, "", "PlayerList", "")

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate(fmt.Sprintf("/game/%d", id))
		})

		form.Render("edit-form", "main", game)
		loadTemplate("game-edit-player", "[name=PlayerList]", game)

		form.ActionGrid("game-actions", "#action-grid", game, func(url string) {
			print("clicked on", url)
			Session.Navigate(url)
		})

		form.OnEvent("PlayerList", "keydown", func(evt dom.Event) {
			k := evt.(*dom.KeyboardEvent)
			el := evt.Target()
			// tag := el.TagName()
			if k.KeyCode == 13 {
				evt.PreventDefault()
				td := el.ParentElement()
				if td.TagName() == "TD" {
					thisTR := td.ParentElement()
					thisTBODY := thisTR.ParentElement()
					nextTR := thisTR.NextElementSibling()
					if nextTR != nil {
						nextInput := nextTR.QuerySelector(".edit__player")
						if nextInput == nil {
							// must be a header
							nextTR = nextTR.NextElementSibling()
							if nextTR == nil {
								print("looks like we hit the end - jump back to the first field")
								nextInput = thisTBODY.QuerySelector(".edit__player")
							} else {
								if nextTR.TagName() != "TR" {
									nextInput = thisTBODY.QuerySelector(".edit__player")
								} else {
									nextInput = nextTR.QuerySelector(".edit__player")
								}
							}
						}
						if nextInput != nil {
							nextInput.(*dom.HTMLInputElement).Focus()
							nextInput.(*dom.HTMLInputElement).Select()
						}
					}
				}
			}
		})

		form.OnEvent("PlayerList", "change", func(evt dom.Event) {
			el := evt.Target()
			if el.TagName() == "INPUT" {
				key, _ := strconv.Atoi(el.GetAttribute("data-id"))
				team := el.GetAttribute("data-team")
				thePlayer := el.(*dom.HTMLInputElement).Value
				TheCmd := game.GetCmd(team, key)

				go func() {
					if thePlayer == "" {
						TheCmd.PlayerID = 0
						TheCmd.PlayerName = ""
					} else {
						theID := 0
						err := RPC("UserRPC.GetIDByName", shared.UserRPCData{
							Channel:  Session.Channel,
							Username: thePlayer,
						}, &theID)
						TheCmd.PlayerID = theID

						if err != nil {
							dom.GetWindow().Alert("Sorry, that username does not exist - try again !")
							TheCmd.PlayerName = ""
							TheCmd.PlayerID = 0
						} else {
							if TheCmd.PlayerID == 0 {
								TheCmd.PlayerName = ""
							} else {
								TheCmd.PlayerName = thePlayer
							}
							// print("assign cmd to player", TheCmd, thePlayer)
						}
					}
					// Now update the command
					done := false
					err := RPC("GameRPC.SetCmdPlayer", shared.GameCmdRPCData{
						Channel:  Session.Channel,
						ID:       key,
						PlayerID: TheCmd.PlayerID,
						Team:     team,
					}, &done)
					if err == nil {
						// print("new player set")
						gravatar := ""
						err = RPC("UserRPC.GetAvatar", shared.AvatarRequest{
							Channel:  Session.Channel,
							Username: thePlayer,
							Size:     64,
						}, &gravatar)
						if err == nil {
							el := form.Get(fmt.Sprintf("avatar-%d", key)).(*dom.HTMLImageElement)
							el.Src = gravatar
						}
					}
				}()
			}
		})

	}()
	// showDisqus(fmt.Sprintf("game-%d", id), fmt.Sprintf("Game - %06d - %s", game.ID, game.Name))

}

func gameEditHosting(context *router.Context) {
	id, err := strconv.Atoi(context.Params["id"])
	if err != nil {
		print(err.Error())
		return
	}

	go func() {

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

		// Layout the fields
		form := formulate.EditForm{}
		form.New("fa-user", "Game In Progress Options - "+game.Name)

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate(fmt.Sprintf("/game/%d", id))
		})

		if Session.Mobile() {
			form.Row(2).
				AddDate(1, "Start Date", "StartDate").
				AddDate(1, "Game Ends", "Expires")
			form.Row(3).
				AddNumber(1, "Year", "Year", "1").
				AddNumber(1, "Turn", "Turn", "1").
				AddNumber(1, "Turn Limit", "TurnLimit", "1")
			form.Row(1).
				AddInput(1, "Name", "Name")
		} else {
			form.Row(5).
				AddDate(1, "Start Date", "StartDate").
				AddDate(1, "Game Ends", "Expires").
				AddNumber(1, "Year", "Year", "1").
				AddNumber(1, "Turn", "Turn", "1").
				AddNumber(1, "Turn Limit", "TurnLimit", "1")
			form.Row(5).
				AddInput(1, "Name", "Name").
				AddInput(4, "Description", "Descr")

		}

		// form.DisplayMode = true

		form.Render("edit-form", "main", game)
		form.ActionGrid("game-hosting-actions", "#action-grid", game, func(url string) {
			switch url {
			case "Goto":
				Session.Navigate(fmt.Sprintf("/play/%d", game.ID))
			case "Pause":
				print("TODO - pause the game")
			case "Phase":
				print("TODO - back one phase")
			case "Turn":
				print("TODO - back one turn")
			case "Rewind":
				print("TODO - back to start")
			case "End":
				print("TODO - end of game")
			}
		})

	}()
	// showDisqus(fmt.Sprintf("game-%d", id), fmt.Sprintf("Game - %06d - %s", game.ID, game.Name))

}

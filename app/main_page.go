package main

import (
	"fmt"

	"./shared"
	"github.com/go-humble/router"
	"github.com/steveoc64/formulate"
	"honnef.co/go/js/dom"
)

func mainPage(context *router.Context) {
	Session.Subscribe("Game", _mainPage, context)
	go _mainPage("Main", 0, context)
}

func _mainPage(action string, id int, context *router.Context) {

	switch action {
	case "Main", "Invite", "Update":
		break
	default:
		return
	}
	go func() {

		Session.MobileSensitive = true

		invites := []shared.Game{}
		RPC("GameRPC.ListInvites", shared.GameRPCData{
			Channel: Session.Channel,
		}, &invites)
		formInvite := formulate.ListForm{}
		formInvite.New("fa-bookmark-o", "Game Invites")

		// Define the layout
		formInvite.Column("Hosted By", "HostName")
		formInvite.AvatarColumn("", "HostEmail")
		formInvite.Column("Game", "Name")
		formInvite.Column("Year", "Year")
		formInvite.Column("Players", "GetPlayers")
		formInvite.Column("Turn", "Turn")
		formInvite.Column("Turn Limit", "TurnLimit")
		if !Session.Mobile() {
			formInvite.DateColumn("Start Date", "StartDate")
			formInvite.DateColumn("End Date", "Expires")
		}

		formInvite.RowEvent(func(key string) {
			Session.Navigate("/game/invite/" + key)
		})

		// formulate.MainContainer("wide-container")
		// formInvite.Render("game-invites-list", "#main-container", &invites)
		formInvite.Render("game-invites-list", "main", &invites)

		games := []shared.Game{}
		err := RPC("GameRPC.List", shared.GameRPCData{
			Channel: Session.Channel,
		}, &games)
		if err != nil {
			dom.GetWindow().Alert("Error: " + err.Error())
			return
		}
		form := formulate.ListForm{}
		title := "My Hosted Games"
		if !Session.Mobile() {
			title += " - "
			if len(games) >= Session.MaxGames {
				if Session.MaxGames == 1 {
					title += "(1 Game Slot on Free Account)"
				} else {
					title += fmt.Sprintf("(All %d Slots are Used)", Session.MaxGames)
				}
			} else if len(games) == 0 {
				if Session.MaxGames == 1 {
					title += "(1 Free Slot Only)"
				} else {
					title += fmt.Sprintf("(%d Free Slots)", Session.MaxGames)
				}
			} else {
				title += fmt.Sprintf("(Using %d of %d Slots)", len(games), Session.MaxGames)
			}
		}
		pTitle := fmt.Sprintf("Players/(Max %d)", Session.MaxPlayers)

		form.New("fa-bookmark", title)

		// Define the layout
		form.Column("Game", "Name")
		form.Column(pTitle, "GetPlayers")
		form.Column("Turn", "Turn")
		form.Column("Turn Limit", "TurnLimit")
		if Session.Rank > 9 && !Session.Mobile() {
			form.DateColumn("Created", "Created")
		}
		form.DateColumn("Start Date", "StartDate")
		if !Session.Mobile() {
			form.DateColumn("Game Ends", "Expires")
		}
		form.IconColumn("Status", "GetStatusIcon")

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate("/")
		})

		// form.NewRowEvent(func(evt dom.Event) {
		// 	evt.PreventDefault()
		// 	Session.Navigate("/game/add")
		// })

		form.RowEvent(func(key string) {
			Session.Navigate(fmt.Sprintf("/game/%s", key))
		})

		// formulate.AppendDiv("hosted-games").Class().SetString("wide-container")
		// formulate.AppendDiv("hosted-games")
		formulate.InsertDiv("hosted-games", ".data-container", "#action-grid")
		form.Render("game-list", "#hosted-games", games)

		// print("add action grid")
		form.ActionGrid("main-actions", "#action-grid", Session, func(url string) {
			if url == "manual" {
				loc := dom.GetWindow().Location()
				dom.GetWindow().Open(loc.Origin+"/manual", "actionfront-manual", "")
			}
			Session.Navigate(url)
		})

	}()

}

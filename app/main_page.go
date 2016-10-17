package main

import (
	"fmt"

	"./shared"
	"github.com/go-humble/router"
	"github.com/steveoc64/formulate"
	"honnef.co/go/js/dom"
)

func mainPage(context *router.Context) {

	go func() {
		games := []shared.Game{}
		err := RPC("GameRPC.List", shared.GameRPCData{
			Channel: Session.Channel,
		}, &games)
		if err != nil {
			dom.GetWindow().Alert("Error: " + err.Error())
			return
		}
		form := formulate.ListForm{}
		title := "My Hosted Games - "
		if len(games) >= Session.MaxGames {
			if Session.MaxGames == 1 {
				title += "(Max of 1 Game on Free Account)"
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
		pTitle := fmt.Sprintf("Players/(Max %d)", Session.MaxPlayers)

		form.New("fa-bookmark", title)

		// Define the layout
		form.Column("Game", "Name")
		form.Column(pTitle, "GetPlayers")
		form.Column("Turn", "Turn")
		form.Column("Turn Limit", "TurnLimit")
		form.DateColumn("Created", "Created")
		form.DateColumn("Expires", "Expires")

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
			Session.Navigate("/game/" + key)
		})

		formulate.MainContainer("wide-container")
		form.Render("game-list", "#main-container", games)

		invites := []shared.Game{}
		RPC("GameRPC.ListInvites", shared.GameRPCData{
			Channel: Session.Channel,
		}, &invites)
		formInvite := formulate.ListForm{}
		formInvite.New("fa-bookmark-o", "Game Invites")

		// Define the layout
		formInvite.Column("Hosted By", "HostName")
		formInvite.AvatarColumn("Host", "HostEmail")
		formInvite.Column("Game", "Name")
		formInvite.Column("Players", "GetPlayers")
		formInvite.Column("Turn", "Turn")
		formInvite.Column("Turn Limit", "TurnLimit")
		formInvite.DateColumn("Expires", "Expires")

		formulate.AppendDiv("game-invites").Class().SetString("wide-container")
		formInvite.Render("game-invites-list", "#game-invites", &invites)

		// print("add action grid")
		form.ActionGrid("main-actions", "#action-grid", Session, func(url string) {
			// print("clicked on", url)
			Session.Navigate(url)
		})

	}()

}

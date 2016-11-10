package main

import (
	"fmt"

	"./shared"
	"github.com/go-humble/router"
	"github.com/gopherjs/gopherjs/js"
	"github.com/steveoc64/formulate"
	"honnef.co/go/js/dom"
)

func mainPage(context *router.Context) {
	Session.Subscribe("Game", _mainPage, context)
	Session.Subscribe("Play", _play, context)
	go _mainPage("Main", nil, context)
}

var tileClicker func(*js.Object)
var keyGrabber func(*js.Object)

func _mainPage(action string, msg *shared.NetData, context *router.Context) {

	if keyGrabber != nil {
		dom.GetWindow().RemoveEventListener("keypress", false, keyGrabber)
		keyGrabber = nil
	}

	switch action {
	case "Main", "Invite", "Update", "Start", "Stop":
		break
	default:
		return
	}
	go func() {

		Session.MobileSensitive = true
		w := dom.GetWindow()
		doc := w.Document()
		// zap the main and init the actiongrid
		doc.QuerySelector("main").SetInnerHTML(`<div class="data-container"><div id="action-grid" class="no-print"></div>`)

		games := []shared.Game{}
		RPC("GameRPC.PlayList", shared.GameRPCData{
			Channel: Session.Channel,
		}, &games)

		if len(games) > 0 {

			form := formulate.ListForm{}
			form.New("fa-fort-awesome", "Games in Progress")

			// Define the layout
			form.Column("Hosted By", "HostName")
			form.AvatarColumn("", "HostEmail")
			form.Column("Game", "Name")
			form.Column("Year", "Year")
			form.Column("Players", "GetPlayers")
			form.Column("Turn", "Turn")
			form.Column("Turn Limit", "TurnLimit")
			if !Session.Mobile() {
				form.DateColumn("Start Date", "StartDate")
				form.DateColumn("End Date", "Expires")
			}

			form.RowEvent(func(key string) {
				Session.Navigate("/play/" + key)
			})

			// formulate.MainContainer("wide-container")
			// formInvite.Render("game-invites-list", "#main-container", &invites)
			if doc.QuerySelector(".data-container") == nil {
				return
			}
			formulate.InsertDiv("progress-games", ".data-container", "#action-grid")
			if doc.QuerySelector("#progress-games") == nil {
				return
			}
			form.RenderNoContainer("game-inprogress-list", "#progress-games", &games)
		}

		invites := []shared.Game{}
		RPC("GameRPC.ListInvites", shared.GameRPCData{
			Channel: Session.Channel,
		}, &invites)

		if len(invites) > 0 {

			formInvite := formulate.ListForm{}
			formInvite.New("fa-bookmark-o", "Game Invites")

			// Define the layout
			formInvite.Column("Hosted By", "HostName")
			formInvite.AvatarColumn("", "HostEmail")
			formInvite.Column("Game", "Name")
			formInvite.Column("Year", "Year")
			formInvite.Column("Players", "GetPlayers")
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
			if doc.QuerySelector(".data-container") == nil {
				// print("computing main when we shouldnt be .. quitting")
				return
			}
			formulate.InsertDiv("game-invites", ".data-container", "#action-grid")
			if doc.QuerySelector("#game-invites") == nil {
				return
			}
			formInvite.RenderNoContainer("game-invites-list", "#game-invites", &invites)
		}

		myGames := []shared.Game{}
		err := RPC("GameRPC.List", shared.GameRPCData{
			Channel: Session.Channel,
		}, &myGames)
		if err != nil {
			dom.GetWindow().Alert("Error: " + err.Error())
			return
		}
		if len(myGames) > 0 {

			form := formulate.ListForm{}
			title := "My Hosted Games"
			if !Session.Mobile() {
				title += " - "
				if len(myGames) >= Session.MaxGames {
					if Session.MaxGames == 1 {
						title += "(1 Game Slot on Free Account)"
					} else {
						title += fmt.Sprintf("(All %d Slots are Used)", Session.MaxGames)
					}
				} else if len(myGames) == 0 {
					if Session.MaxGames == 1 {
						title += "(1 Free Slot Only)"
					} else {
						title += fmt.Sprintf("(%d Free Slots)", Session.MaxGames)
					}
				} else {
					title += fmt.Sprintf("(Using %d of %d Slots)", len(myGames), Session.MaxGames)
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
			if doc.QuerySelector(".data-container") == nil {
				return
			}
			formulate.InsertDiv("hosted-games", ".data-container", "#action-grid")
			if doc.QuerySelector("#hosted-games") == nil {
				return
			}
			form.RenderNoContainer("game-list", "#hosted-games", myGames)
		}

		// print("add action grid")
		formulate.ActionGrid("main-actions", "#action-grid", Session, func(url string) {
			if url == "manual" {
				loc := dom.GetWindow().Location()
				dom.GetWindow().Open(loc.Origin+"/manual", "actionfront-manual", "")
			}
			Session.Navigate(url)
		})

	}()

}

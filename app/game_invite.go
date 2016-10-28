package main

import (
	"fmt"
	"strconv"

	"./shared"
	"github.com/go-humble/router"
	"github.com/steveoc64/formulate"
	"honnef.co/go/js/dom"
)

func gameInvite(context *router.Context) {
	print("TODO - gameInvite")

	id, err := strconv.Atoi(context.Params["id"])
	if err != nil {
		print(err.Error())
		return
	}

	go func() {
		game := shared.Game{}
		TheCmd := &shared.GameCmd{}

		RPC("GameRPC.GetInvite", shared.GameRPCData{
			Channel:  Session.Channel,
			ID:       id,
			GetUnits: true,
		}, &game)
		print("you got game", game)

		form := formulate.EditForm{}
		form.New("fa-bookmark-o", "Game Invite - "+game.Name)

		// Layout the fields

		lbl := "# Players"
		if Session.Mobile() {
			lbl = "Players"
		}
		form.Row(1).
			AddDisplay(1, "Your Team", "Team")

		form.Row(4).
			AddDisplay(3, "Red Team", "RedTeam").
			AddDisplay(1, lbl, "NumRedPlayers")

		form.Row(4).
			AddDisplay(3, "Blue Team", "BlueTeam").
			AddDisplay(1, lbl, "NumBluePlayers")

		if game.Red {
			form.Row(1).
				AddDisplayArea(1, "Red Team Briefing", "RedBrief")
		}
		if game.Blue {
			form.Row(1).
				AddDisplayArea(1, "Blue Team Briefing", "BlueBrief")
		}

		form.Row(1).
			AddCustom(1, "Red Commands", "RedCommands", "hidden")

		form.Row(1).
			AddCustom(1, "Blue Commands", "BlueCommands", "hidden")

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate("/")
		})

		form.PrintEvent(func(evt dom.Event) {
			dom.GetWindow().Print()
		})

		// All done, so render the form
		form.Render("edit-form", "main", &game)
		redRow := "row-4"
		blueRow := "row-5"
		form.Get(redRow).Class().Add("hidden")
		form.Get(blueRow).Class().Add("hidden")
		form.ActionGrid("game-invite-actions", "#action-grid", game, func(url string) {
			print("action url", url)
		})

		w := dom.GetWindow()
		doc := w.Document()

		drawUnitList := func() {
			print("asked to render a unit list")
		}

		if game.Red {
			bbar := doc.CreateElement("DIV")
			bbar.Class().Add("button-bar-left")

			for _, v := range game.RedCmd {
				btn := doc.CreateElement("INPUT").(*dom.HTMLInputElement)
				if !v.Cull && v.PlayerID == Session.UserID {
					btn.Class().SetString("button button-primary")
					btn.Value = v.Name
					btn.SetAttribute("data-cmd-id", fmt.Sprintf("%d", v.ID))
					btn.SetAttribute("type", "button")
					bbar.AppendChild(btn)

					btn.AddEventListener("click", false, func(evt dom.Event) {
						b := evt.Target()
						print("clicked on unit", b.(*dom.HTMLInputElement).Value)
						k, _ := strconv.Atoi(b.GetAttribute("data-cmd-id"))
						print("with id", k)
						if k > 0 {
							TheCmd = game.GetCmd("Red", k)
							print("which is", TheCmd)
							// Draw up the units
							drawUnitList()
						}
					})
				}
			}
			div := form.Get("RedCommands")
			div.SetInnerHTML("")
			div.AppendChild(bbar)
			div.Class().Remove("hidden")
			form.Get(redRow).Class().Remove("hidden")
		}

		if game.Blue {
			form.Get("BlueCommands").Class().Remove("hidden")
		}

	}()

}

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
	Session.Subscribe("Game", _gameInvite, context)
	_gameInvite("Edit", 0, context)
}

func _gameInvite(action string, actionID int, context *router.Context) {
	id, err := strconv.Atoi(context.Params["id"])
	if err != nil {
		print(err.Error())
		return
	}

	switch action {
	case "Update":
		if actionID != id {
			// not for us
			return
		}
	}

	w := dom.GetWindow()
	doc := w.Document()

	go func() {
		game := shared.Game{}
		TheCmd := &shared.GameCmd{}

		rerr := RPC("GameRPC.GetInvite", shared.GameRPCData{
			Channel:  Session.Channel,
			ID:       id,
			GetUnits: true,
		}, &game)
		if rerr != nil || game.ID == 0 {
			Session.Navigate("/")
		}

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
			AddCustom(1, "Red Corps Level Commands", "RedCommands", "hidden")

		form.Row(1).
			AddCustom(1, "Blue Corps Level Commands", "BlueCommands", "hidden")

		form.Row(1).
			AddCustom(1, "", "ViewUnits", "hidden")
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
		start := 3
		if game.Red {
			start++
		}
		if game.Blue {
			start++
		}
		redRow := fmt.Sprintf("row-%d", start)
		blueRow := fmt.Sprintf("row-%d", start+1)
		oobRow := fmt.Sprintf("row-%d", start+2)

		form.Get(redRow).Class().Add("hidden")
		form.Get(blueRow).Class().Add("hidden")
		form.Get(oobRow).Class().Add("hidden")
		loadTemplate("view-units", "[name=ViewUnits]", nil)
		form.ActionGrid("game-invite-actions", "#action-grid", game, func(url string) {
			print("action url", url)
			switch url {
			case "Overview":
				loadTemplate("game-overview", "#game-overview", &game)
				doc.QuerySelector("#game-overview").AddEventListener("click", false, func(evt dom.Event) {
					doc.QuerySelector("#game-overview").Class().Remove("md-show")
				})
				doc.QuerySelector("#game-overview").Class().Add("md-show")
			case "Players":
				loadTemplate("game-players", "#game-players", &game)
				doc.QuerySelector("#game-players").AddEventListener("click", false, func(evt dom.Event) {
					doc.QuerySelector("#game-players").Class().Remove("md-show")
				})
				doc.QuerySelector("#game-players").Class().Add("md-show")
			case "Accept":
				loadTemplate("game-accept", "#game-accept", &game)
				doc.QuerySelector("#game-accept").AddEventListener("click", false, func(evt dom.Event) {
					doc.QuerySelector("#game-accept").Class().Remove("md-show")
					go func() {
						done := false
						RPC("GameRPC.AcceptInvite", shared.GameRPCData{
							Channel: Session.Channel,
							ID:      game.ID,
						}, &done)
					}()
				})
				doc.QuerySelector("#game-accept").Class().Add("md-show")
			case "Decline":
				loadTemplate("game-decline", "#game-decline", &game)
				doc.QuerySelector("#game-decline").AddEventListener("click", false, func(evt dom.Event) {
					doc.QuerySelector("#game-decline").Class().Remove("md-show")
				})
				doc.QuerySelector("[name=really-decline]").AddEventListener("click", false, func(evt dom.Event) {
					doc.QuerySelector("#game-decline").Class().Remove("md-show")
					go func() {
						done := false
						RPC("GameRPC.DeclineInvite", shared.GameRPCData{
							Channel: Session.Channel,
							ID:      game.ID,
						}, &done)
						Session.Navigate("/")
					}()
				})
				doc.QuerySelector("#game-decline").Class().Add("md-show")
			}

		})

		form.AppendDiv("unit-details", "md-modal md-effect-1 unit-inspection")
		form.AppendDiv("game-overview", "md-modal md-effect-1 unit-inspection")
		form.AppendDiv("game-players", "md-modal md-effect-1 unit-inspection")
		form.AppendDiv("game-accept", "md-modal md-effect-1 unit-inspection")
		form.AppendDiv("game-decline", "md-modal md-effect-1 unit-inspection")
		form.AppendDiv("overlay", "md-overlay")

		drawUnitList := func() {
			// print("asked to render a unit list of", TheCmd)
			form.Get(oobRow).Class().Remove("hidden")
			tbody := form.Get("UnitList").(*dom.HTMLTableSectionElement)
			tbody.SetInnerHTML("")
			team := ""
			if TheCmd.RedTeam {
				team = "Red"
			}
			if TheCmd.BlueTeam {
				team = "Blue"
			}

			for _, v := range TheCmd.Units {
				row := tbody.InsertRow(-1)
				row.SetClass("data-row")
				row.SetAttribute("key", fmt.Sprintf("%d", v.ID))
				row.SetAttribute("data-team", team)

				// Add columns depending on type
				if v.UType == 1 {
					cell := row.InsertCell(-1)
					cell.SetClass("compressed")
					cell.Class().Add("highlight")
					cell.Class().Add("commander")
					cell.SetInnerHTML(v.Name)

					cell = row.InsertCell(-1)
					cell.SetClass("compressed")
					cell.Class().Add("highlight")
					cell.Class().Add("commander")
					cell.SetInnerHTML(v.CommanderName)

					cell = row.InsertCell(-1)
					cell.SetClass("compressed")
					cell.Class().Add("highlight")
					cell.Class().Add("commander")
					cell.SetInnerHTML(Session.Lookup.CmdRating[v.Rating-1].Name)

					cell = row.InsertCell(-1)
					cell.SetClass("compressed")
					cell.Class().Add("highlight")

					// Add the Unit Condition column
					cell = row.InsertCell(-1)
					cell.SetClass("compressed")
					cell.Class().Add("highlight")
					cell.Class().Add("commander")
					cell.SetInnerHTML(v.Nation)
				} else { // is a regular unit
					cell := row.InsertCell(-1)
					cell.SetClass("compressed")
					cell.SetInnerHTML("&nbsp;&nbsp;" + v.Name)

					cell = row.InsertCell(-1)
					cell.SetClass("compressed")
					cell.SetAttribute("name", fmt.Sprintf("bases-%d", v.ID))
					cell.SetInnerHTML(v.GetBases())

					cell = row.InsertCell(-1)
					cell.SetClass("compressed")
					if v.UType == 4 {
						cell.SetInnerHTML("Gun Crew")
					} else {
						cell.SetInnerHTML(Session.Lookup.UnitRating[v.Rating-1].Name)
					}

					// Add the Unit Condition column
					cell = row.InsertCell(-1)
					cell.SetClass("compressed")
					cell.SetAttribute("name", fmt.Sprintf("condition-%d", v.ID))
					cell.SetInnerHTML(Session.Lookup.Condition[v.Condition-1].Name)

					// Add the Unit details column
					cell = row.InsertCell(-1)
					cell.SetClass("compressed")
					cell.SetAttribute("name", fmt.Sprintf("descr-%d", v.ID))
					addMe := ""
					switch v.UType {
					case 2:
						addMe = fmt.Sprintf("%d Bayonets:<br>\n", v.Bayonets-v.BayonetsLost)
					case 3:
						addMe = fmt.Sprintf("%d Sabres:<br>\n", v.Sabres-v.SabresLost)
					case 4:
						addMe = fmt.Sprintf("%d Guns:<br>\n", v.Guns-v.GunsLost)
					}
					cell.SetInnerHTML(addMe + breakLine(v.Descr))
				}

			}
			// showSummary(TheCmd)
			form.Get("ViewUnits").Class().Remove("hidden")
		}

		// blueBar := &dom.HTMLDivElement{}
		// redBar := &dom.HTMLDivElement{}
		var redBar *dom.HTMLDivElement
		var blueBar *dom.HTMLDivElement

		showCommands := func(team string) {
			bbar := doc.CreateElement("DIV").(*dom.HTMLDivElement)
			bbar.Class().Add("button-bar-left")

			cmds := game.RedCmd
			if team == "Blue" {
				cmds = game.BlueCmd
				blueBar = bbar
			} else {
				redBar = bbar
			}

			for _, v := range cmds {
				btn := doc.CreateElement("INPUT").(*dom.HTMLInputElement)
				if !v.Cull && v.PlayerID == Session.UserID {
					btn.Class().SetString("button button-outline")
					btn.Value = v.Name
					btn.SetAttribute("data-cmd-id", fmt.Sprintf("%d", v.ID))
					btn.SetAttribute("data-team", team)
					btn.SetAttribute("type", "button")
					bbar.AppendChild(btn)

					btn.AddEventListener("click", false, func(evt dom.Event) {
						b := evt.Target()
						// print("clicked on unit", b.(*dom.HTMLInputElement).Value)
						keystr := b.GetAttribute("data-cmd-id")
						k, _ := strconv.Atoi(keystr)
						team := b.GetAttribute("data-team")
						// unset them all, set this one to primary
						scanBar := redBar
						if team == "Blue" {
							scanBar = blueBar
						}
						for _, v := range scanBar.QuerySelectorAll(".button") {
							if v.GetAttribute("data-cmd-id") == keystr {
								v.Class().Add("button-primary")
								v.Class().Remove("button-outline")
							} else {
								v.Class().Remove("button-primary")
								v.Class().Add("button-outline")
							}
						}
						// print("with id", k, team)
						if k > 0 {
							TheCmd = game.GetCmd(team, k)
							// print("which is", TheCmd)
							// Draw up the units
							drawUnitList()
						}
					})
				}
			}
			div := form.Get(fmt.Sprintf("%sCommands", team))
			div.SetInnerHTML("")
			div.AppendChild(bbar)
			div.Class().Remove("hidden")
			if team == "Red" {
				form.Get(redRow).Class().Remove("hidden")
			}
			if team == "Blue" {
				form.Get(blueRow).Class().Remove("hidden")
			}
		}

		if game.Red {
			print("show red commands")
			showCommands("Red")
		}

		if game.Blue {
			print("show blue commands")
			showCommands("Blue")
		}

		// Click handler on the unitlist
		form.OnEvent("UnitList", "click", func(evt dom.Event) {
			td := evt.Target()
			tag := td.TagName()
			// print("clicked on", tag)
			if tag == "TD" {
				tr := td.ParentElement()
				key, _ := strconv.Atoi(tr.GetAttribute("key"))
				team := tr.GetAttribute("data-team")
				// print("clicked on row with key", key)
				unit := game.GetUnit(team, key)
				// print("unit is", unit)
				if unit.UType == 1 {
					unit.Summary = unit.GetSummary(TheCmd)
				}
				loadTemplate("unit-details", "#unit-details", unit)
				doc.QuerySelector("#unit-details").AddEventListener("click", false, func(evt dom.Event) {
					// print("clicke on the unit details")
					doc.QuerySelector("#unit-details").Class().Remove("md-show")
				})
				doc.QuerySelector("#unit-details").Class().Add("md-show")
			}
		})

		showDisqus(fmt.Sprintf("game-%d", id), fmt.Sprintf("Game - %06d - %s", game.ID, game.Name))

	}()

}

func gameInviteOverview(context *router.Context) {
	print("TODO - gameInviteOverview")

}

func gameInviteTable(context *router.Context) {
	print("TODO - gameInviteTable")
}

func gameInvitePlayers(context *router.Context) {
	print("TODO - gameInvitePlayers")
}

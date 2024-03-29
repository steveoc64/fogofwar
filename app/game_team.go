package main

import (
	"fmt"
	"math/rand"
	"strconv"
	"strings"

	"./shared"
	"github.com/go-humble/router"
	"github.com/steveoc64/formulate"
	"honnef.co/go/js/dom"
)

func breakLine(s string) string {
	r := strings.Replace(s, ") ", ")<br>\n", -1)
	r = strings.Replace(s, "] ", "]<br>\n", -1)
	r = strings.Replace(s, " ~ ", "<br>\n", -1)
	r = strings.Replace(r, " and ", "<br>\nand ", -1)
	// r = strings.Replace(r, ", ", "<br>\n", -1)
	return r
}

func gameEditTeam(context *router.Context) {
	Session.Subscribe("Game", _gameEditTeam, context)
	Session.Subscribe("Play", _play, context)
	go _gameEditTeam("Edit", nil, context)
}

func _gameEditTeam(action string, msg *shared.NetData, context *router.Context) {
	id, err := strconv.Atoi(context.Params["id"])
	if err != nil {
		print(err.Error())
		return
	}
	team := context.Params["team"]
	Session.MobileSensitive = true

	go func() {
		w := dom.GetWindow()
		doc := w.Document()

		switch action {
		case "Update":
			if id == msg.ID {
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
				break
			}
			print("this update is not for us ..")
			return
		}

		// print("here with game", game)
		game := Session.EditGame
		if game.ID == 0 {
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
			game = Session.EditGame
		}
		game.InMode = "Team"
		game.Mobile = Session.Mobile()
		form := formulate.EditForm{}

		// Layout the fields

		form.New("fa-flag-o", fmt.Sprintf("%s Team Details - %s ", team, game.Name))

		if Session.Mobile() {
			form.Row(4).
				AddFocusInput(3, "", fmt.Sprintf("%sTeam", team)).
				AddCheck(1, "FlipMap", fmt.Sprintf("%sFlip", team))

			form.Row(1).
				AddDisplayArea(1, "", fmt.Sprintf("%sBrief", team))
				// TODO - add btn to view briefing fullscreen

			form.Row(1).
				AddCustom(1, "", "Commands", "")

			form.Row(6).
				AddCheck(1, "Include", "Included").
				AddInput(3, "Player", "AssignToPlayer").
				AddNumber(2, "Turn", "StartTurn", "1")

			form.Row(1).
				AddCustom(1, "", "ViewUnits", "")
		} else {
			form.Row(6).
				AddFocusInput(4, fmt.Sprintf("%s Team", team), fmt.Sprintf("%sTeam", team)).
				AddDisplay(1, "# Players", fmt.Sprintf("Num%sPlayers", team)).
				AddCheck(1, "Flip Map", fmt.Sprintf("%sFlip", team))

			form.Row(1).
				AddTextarea(1, "Briefing", fmt.Sprintf("%sBrief", team))

			form.Row(1).
				AddCustom(1, "Commands", "Commands", "")

			// form.Row(1).
			// 	AddCustom(1, "", "ToggleCmd", "hidden")

			form.Row(6).
				AddCheck(1, "Include", "Included").
				AddInput(3, "Assign to Player", "AssignToPlayer").
				AddNumber(2, "Arrives on Turn", "StartTurn", "1")

			form.Row(1).
				AddCustom(1, "", "ViewUnits", "")
		}

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate(fmt.Sprintf("/game/%d", id))
		})

		form.SaveEvent(func(evt dom.Event) {
			evt.PreventDefault()
			form.Bind(game)
			Session.TeamsChanged = true
			Session.SynchEditGame()
			// go func() {
			// 	done := false
			// 	err := RPC("GameRPC.UpdateTeams", shared.GameRPCData{
			// 		Channel: Session.Channel,
			// 		ID:      id,
			// 		Game:    game,
			// 	}, &done)
			// 	if err != nil {
			// 		dom.GetWindow().Alert(err.Error())
			// 	} else {
			// 		game.CheckForces = true
			// 	}
			// 	// Session.Navigate("/games")
			// }()
		})

		form.PrintEvent(func(evt dom.Event) {
			dom.GetWindow().Print()
		})

		// All done, so render the form
		form.Render("edit-form", "main", game)
		form.ActionGrid("game-actions", "#action-grid", game, func(url string) {
			// print("clicked on", url)
			Session.Navigate(url)
		})
		form.AppendDiv("unit-details", "md-modal md-effect-1 unit-inspection")
		form.AppendDiv("overlay", "md-overlay")
		assignToRow := "row-3"
		form.Hide(assignToRow)
		form.Hide("row-4")

		// loadTemplate("unit-details", "#unit-details", nil)

		// Create the ViewUnits panel, and set to hidden
		viewUnits := form.Get("ViewUnits")
		loadTemplate("view-units", "[name=ViewUnits]", nil)
		viewUnits.Class().Add("hidden")

		TheCmd := &shared.GameCmd{}
		TheUnit := &shared.Unit{}
		showSummary := func(cmd *shared.GameCmd) {
			cmd.CalcTotals()
			cmdsummary := fmt.Sprintf("<h3>%s ~ %s</h3><h4>Commander: %s</h4>", cmd.Name, cmd.Nation, cmd.CommanderName)

			totals := fmt.Sprintf("This Unit has a total of %d Commands, %d Bayonets, %d Sabres and %d Guns",
				cmd.Cmdrs,
				cmd.Bayonets,
				cmd.Sabres,
				cmd.Guns)

			// form.Get("Summary").SetInnerHTML(cmdsummary + cmd.Descr + player + turn + totals)
			form.Get("Summary").SetInnerHTML(cmdsummary + cmd.Descr + totals)
		}

		drawUnitList := func() {
			viewUnits.Class().Remove("hidden")
			tbody := form.Get("UnitList").(*dom.HTMLTableSectionElement)
			tbody.SetInnerHTML("")

			for unitIndex, v := range TheCmd.Units {
				row := tbody.InsertRow(-1)
				row.SetClass("data-row")
				row.SetAttribute("key", fmt.Sprintf("%d", v.ID))

				// Add columns depending on type
				if v.UType == shared.UnitDiv {
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

					// Add the Unit Condition column
					cell = row.InsertCell(-1)
					cell.SetClass("compressed")
					cell.Class().Add("highlight")
					cell.Class().Add("commander")
					cell.SetInnerHTML(v.Nation)
					cell.SetInnerHTML(fmt.Sprintf(`%s<br>
<i data-unit=%d data-dir="down" class="fa fa-chevron-circle-down fa-lg"></i>&nbsp;&nbsp;&nbsp;
<i data-unit=%d data-dir="up" class="fa fa-chevron-circle-up fa-lg"></i>`,
						v.Nation, unitIndex, unitIndex))
					cell.AddEventListener("click", false, func(evt dom.Event) {
						t := evt.Target()
						switch t.TagName() {
						case "I":
							x := 1
							if t.GetAttribute("data-dir") == "up" {
								x = -1
							}
							// Get the command associated with this ID
							u, _ := strconv.Atoi(t.GetAttribute("data-unit"))
							doIt := false
							for i, v := range TheCmd.Units {
								if i == u { // Got the Division, so next set are all childs of this
									doIt = true
									continue
								}
								if doIt && v.UType == shared.UnitDiv { // Into another Division now, so we are done
									break
								}
								if doIt {
									// This unit is a valid child of the selected Division
									v.Condition += x
									if v.Condition < 1 {
										v.Condition = 1
									}
									if v.Condition > 5 {
										v.Condition = 5
									}
									// now re-draw the condition field of the affected thing
									theCell := doc.QuerySelector(fmt.Sprintf("[name=condition-%d]", v.ID))
									theCell.SetInnerHTML(Session.Lookup.Condition[v.Condition-1].Name)
								}
							}
							// print("clicked on ", t.TagName())
						} // end of switch statement

					})

					// Add the Unit details column
					cell = row.InsertCell(-1)
					cell.SetClass("compressed")
					cell.Class().Add("highlight")
					cell.SetInnerHTML(fmt.Sprintf(`
<i data-unit=%d data-dir="down" class="fa fa-chevron-circle-down fa-lg"></i> Adjust 
<i data-unit=%d data-dir="up" class="fa fa-chevron-circle-up fa-lg"></i>`,
						unitIndex, unitIndex))
					cell.AddEventListener("click", false, func(evt dom.Event) {
						t := evt.Target()
						if t.TagName() == "I" {
							x := 1
							if t.GetAttribute("data-dir") == "up" {
								x = -1
							}
							// Get the command associated with this ID
							u, _ := strconv.Atoi(t.GetAttribute("data-unit"))
							doIt := false

							for i, v := range TheCmd.Units {
								if i == u { // Got the Division, so next set are all childs of this
									doIt = true
									continue
								}
								if doIt && v.UType == shared.UnitDiv { // Into another Division now, so we are done
									break
								}
								theCell := doc.QuerySelector(fmt.Sprintf("[name=descr-%d]", v.ID))
								r := 1
								if doIt {
									Session.TeamsChanged = true
									// This unit is a valid child of the selected Division
									// Increment or decrement the losses in 1% increments
									switch v.UType {
									case shared.UnitBde, shared.UnitSpecial:
										r = x * (rand.Intn(6) + 1)
										v.BayonetsLost += ((r * v.Bayonets) / 100)
										if v.BayonetsLost < 0 {
											v.BayonetsLost = 0
										}
										if v.BayonetsLost >= v.Bayonets-150 {
											v.BayonetsLost = v.Bayonets - 150
										}
										theCell.SetInnerHTML(fmt.Sprintf("%d Bayonets:<br>\n%s",
											v.Bayonets-v.BayonetsLost,
											breakLine(v.Descr)))
									case shared.UnitCav:
										r = x * (rand.Intn(3) + 1)
										v.SabresLost += ((r * v.Sabres) / 100)
										if v.SabresLost < 0 {
											v.SabresLost = 0
										}
										if v.SabresLost >= (v.Sabres - 50) {
											v.SabresLost = v.Sabres - 50
										}
										theCell.SetInnerHTML(fmt.Sprintf("%d Sabres:<br>\n%s",
											v.Sabres-v.SabresLost,
											breakLine(v.Descr)))
									case shared.UnitGun:
										v.GunsLost += x
										if v.GunsLost < 0 {
											v.GunsLost = 0
										}
										if v.GunsLost >= v.Guns {
											v.GunsLost = v.Guns - 1
										}
										theCell.SetInnerHTML(fmt.Sprintf("%d Guns:<br>\n%s",
											v.Guns-v.GunsLost,
											breakLine(v.Descr)))
									}
									theCell = doc.QuerySelector(fmt.Sprintf("[name=bases-%d]", v.ID))
									theCell.SetInnerHTML(v.GetBases())
								}
							}

							showSummary(TheCmd)
						} // on click - if I
					}) // on click event handler

				} else {
					cell := row.InsertCell(-1)
					cell.SetClass("compressed")
					cell.SetInnerHTML("&nbsp;&nbsp;" + v.Name)

					cell = row.InsertCell(-1)
					cell.SetClass("compressed")
					cell.SetAttribute("name", fmt.Sprintf("bases-%d", v.ID))
					cell.SetInnerHTML(v.GetBases())

					cell = row.InsertCell(-1)
					cell.SetClass("compressed")
					if v.UType == shared.UnitGun {
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
					case shared.UnitBde:
						addMe = fmt.Sprintf("%d Bayonets:<br>\n", v.Bayonets-v.BayonetsLost)
					case shared.UnitCav:
						addMe = fmt.Sprintf("%d Sabres:<br>\n", v.Sabres-v.SabresLost)
					case shared.UnitGun:
						addMe = fmt.Sprintf("%d Guns:<br>\n", v.Guns-v.GunsLost)
					}
					if Session.SubMobile() {
						cell.SetInnerHTML(addMe)
					} else {
						cell.SetInnerHTML(addMe + breakLine(v.Descr))
					}
				}

			}
			showSummary(TheCmd)
		}
		// Add a button bar for all the commands in this team

		div := form.Get("Commands")
		div.SetInnerHTML("")

		bbar := doc.CreateElement("DIV")
		bbar.Class().Add("button-bar-left")

		theCmds := game.RedCmd
		if team == "Blue" {
			theCmds = game.BlueCmd
		}
		for _, v := range theCmds {
			btn := doc.CreateElement("INPUT").(*dom.HTMLInputElement)
			if v.Cull {
				btn.Class().SetString("button button-clear")
			} else {
				btn.Class().SetString("button button-outline")
			}
			btn.Value = v.Name
			btn.SetAttribute("data-cmd-id", fmt.Sprintf("%d", v.ID))
			btn.SetAttribute("type", "button")
			bbar.AppendChild(btn)

			btn.AddEventListener("click", false, func(evt dom.Event) {
				b := evt.Target()
				doit := true
				if b.Class().Contains("button-primary") {
					b.Class().Remove("button-primary")
					b.Class().Add("button-outline")
					form.Hide("row-4")
					doit = false
				}
				if b.Class().Contains("button-clear") {
					if !form.Get("row-4").Class().Contains("hidden") {
						form.Hide("row-4")
						doit = false
					} else {
						form.Get("row-4").Class().Remove("hidden")
					}
				}
				if doit {

					// reset all bbar buttons to outline mode
					for _, v := range bbar.QuerySelectorAll(".button") {
						if !v.Class().Contains("button-clear") {
							v.Class().SetString("button button-outline")
						} else {
							print("here with clear click")
						}

					}
					if !b.Class().Contains("button-clear") {
						b.Class().SetString("button button-primary")
					}
					k, _ := strconv.Atoi(b.GetAttribute("data-cmd-id"))
					if k > 0 {
						TheCmd = game.GetCmd(team, k)

						// Fill in the start turn
						form.Get("StartTurn").(*dom.HTMLInputElement).Value = fmt.Sprintf("%d", TheCmd.StartTurn)

						// Fill in the username
						form.Get("AssignToPlayer").(*dom.HTMLInputElement).Value = TheCmd.PlayerName

						// Draw up the units

						drawUnitList()
						form.Get(assignToRow).Class().Remove("hidden")
						checkIcon := form.Get("Included").(*dom.HTMLInputElement)
						checkIcon.Checked = !TheCmd.Cull
						form.Get("row-4").Class().Remove("hidden")
					}
				}
			})
		}
		div.AppendChild(bbar)

		// div = form.Get("ToggleCmd")
		// div.SetInnerHTML("")

		// player := fmt.Sprintf(`<label for="cmd-player">Assign to Player</label><input name="cmd-player" placeholder="PlayerID">  `)
		// turn := fmt.Sprintf(`<label for="cmd-turn">Arrives on Turn</label><input name="cmd-turn" value="1" type="number" step="1" min="1"><br>`)
		// div.SetInnerHTML(`<i name="cmd-include" class="fa fa-check-square-o fa-lg"> Included in this Game</i><br>` + player + turn)

		form.OnEvent("AssignToPlayer", "change", func(evt dom.Event) {
			print("player changed")
			Session.TeamsChanged = true
			go func() {
				thePlayer := evt.Target().(*dom.HTMLInputElement).Value
				if thePlayer == "" {
					TheCmd.PlayerID = 0
					TheCmd.PlayerName = ""
				} else {
					err := RPC("UserRPC.GetIDByName", shared.UserRPCData{
						Channel:  Session.Channel,
						Username: thePlayer,
					}, &TheCmd.PlayerID)
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
			}()
		})

		form.OnEvent("StartTurn", "change", func(evt dom.Event) {
			TheCmd.StartTurn, _ = strconv.Atoi(evt.Target().(*dom.HTMLInputElement).Value)
			Session.TeamsChanged = true
		})

		// click on a cmd button = load the cmd and draw thi unit list
		form.OnEvent("Included", "change", func(evt dom.Event) {
			// print("included has changed")
			Session.TeamsChanged = true
			if TheCmd != nil {
				checkIcon := form.Get("Included").(*dom.HTMLInputElement)
				TheCmd.Cull = !checkIcon.Checked
				// print("set TheCmd.Cull", TheCmd.Cull, TheCmd)

				// clear the other fields if excluded
				if TheCmd.Cull {
					form.Get("AssignToPlayer").(*dom.HTMLInputElement).Value = ""
					form.Get("StartTurn").(*dom.HTMLInputElement).Value = ""
				} else {
					form.Get("StartTurn").(*dom.HTMLInputElement).Value = "1"
					form.Focus("AssignToPlayer")
				}

				for _, v := range form.Get("Commands").QuerySelectorAll(".button") {
					theID, _ := strconv.Atoi(v.GetAttribute("data-cmd-id"))
					if theID == TheCmd.ID {
						// print("got a matching button")
						if TheCmd.Cull {
							v.Class().Remove("button-primary")
							v.Class().Add("button-clear")
						} else {
							v.Class().Add("button-primary")
							v.Class().Remove("button-clear")
						}
						break
					}
				}
			}
		})

		// Click handler on the unitlist
		form.OnEvent("UnitList", "click", func(evt dom.Event) {
			td := evt.Target()
			tag := td.TagName()
			// print("clicked on", tag)
			if tag == "TD" {
				tr := td.ParentElement()
				key, _ := strconv.Atoi(tr.GetAttribute("key"))
				// print("clicked on row with key", key)
				unit := game.GetUnit(team, key)
				// print("unit is", unit)
				if unit.UType == shared.UnitDiv {
					unit.Summary = unit.GetSummary(TheCmd)
				}
				loadTemplate("unit-details", "#unit-details", unit)
				TheUnit = unit
				doc.QuerySelector("#unit-details").AddEventListener("click", false, func(evt dom.Event) {
					// print("clicke on the unit details")
					unit := TheUnit
					el := evt.Target()
					// print("clicked on a ", el.TagName())
					if el.TagName() == "INPUT" {
						value := el.(*dom.HTMLInputElement).Value
						switch unit.UType {
						case shared.UnitDiv:
							doc.QuerySelector("#unit-details").Class().Remove("md-show")
						case shared.UnitBde, shared.UnitSpecial:
							switch value {
							case "Valour":
								loadTemplate("unit-valour", "[name=unitcard]", unit)
								return
							case "Discipline":
								loadTemplate("unit-discipline", "[name=unitcard]", unit)
								return
							default:
								doc.QuerySelector("#unit-details").Class().Remove("md-show")
							}
						case shared.UnitCav:
							// print("in cav with", value)
							switch value {
							case "Honours":
								// print("here with Honours")
								loadTemplate("unit-cav-details", "[name=unitcard]", unit)
								return
							default:
								doc.QuerySelector("#unit-details").Class().Remove("md-show")
							}
						case shared.UnitGun:
							switch value {
							case "Gunnery Chart":
								loadTemplate("unit-gunnery", "[name=unitcard]", unit)
								return
							default:
								doc.QuerySelector("#unit-details").Class().Remove("md-show")
							}
						}
					} // tag input
				})
				doc.QuerySelector("#unit-details").Class().Add("md-show")
			}
		})

		showDisqus(fmt.Sprintf("game-%d", id), fmt.Sprintf("Game - %06d - %s", game.ID, game.Name))
	}()
}

func unitInspection(context *router.Context) {
	print("TODO - unitInspection")
}

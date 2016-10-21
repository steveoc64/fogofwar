package main

import (
	"fmt"
	"math/rand"
	"strconv"

	"./shared"
	"github.com/go-humble/router"
	"github.com/steveoc64/formulate"
	"honnef.co/go/js/dom"
)

func gameEditTeam(context *router.Context) {
	id, err := strconv.Atoi(context.Params["id"])
	if err != nil {
		print(err.Error())
		return
	}
	team := context.Params["team"]

	go func() {
		w := dom.GetWindow()
		doc := w.Document()

		game := shared.Game{}
		RPC("GameRPC.Get", shared.GameRPCData{
			Channel:  Session.Channel,
			ID:       id,
			Red:      team == "Red",
			Blue:     team == "Blue",
			GetUnits: true,
		}, &game)
		// print("game red", game)

		form := formulate.EditForm{}

		// Layout the fields

		form.New("fa-flag-o", fmt.Sprintf("%s Team Details - %s ", team, game.Name))

		form.Row(6).
			AddInput(5, fmt.Sprintf("%s Team", team), fmt.Sprintf("%sTeam", team)).
			AddDisplay(1, "# Players", fmt.Sprintf("Num%sPlayers", team))

		form.Row(1).
			AddTextarea(1, "Briefing", fmt.Sprintf("%sBrief", team))

		form.Row(1).
			AddCustom(1, "Commands", "Commands", "")

		form.Row(1).
			AddCustom(1, "", "ViewUnits", "")

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate(fmt.Sprintf("/game/%d", id))
		})

		form.SaveEvent(func(evt dom.Event) {
			evt.PreventDefault()
			form.Bind(&game)
			go func() {
				RPC("GameRPC.Update"+team, shared.GameRPCData{
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
			// print("clicked on", url)
			Session.Navigate(url)
		})

		// Create the ViewUnits panel, and set to hidden
		viewUnits := form.Get("ViewUnits")
		loadTemplate("view-units", "[name=ViewUnits]", nil)
		viewUnits.Class().Add("hidden")

		TheCmd := &shared.GameCmd{}

		drawUnitList := func() {
			viewUnits.Class().Remove("hidden")
			tbody := form.Get("UnitList").(*dom.HTMLTableSectionElement)
			tbody.SetInnerHTML("")

			totalBayonets := 0
			totalSabres := 0
			totalGuns := 0
			totalCmdrs := 0

			for unitIndex, v := range TheCmd.Units {
				totalBayonets += v.Bayonets - v.BayonetsLost
				totalSabres += v.Sabres - v.SabresLost
				totalGuns += v.Guns - v.GunsLost
				if v.UType == 1 {
					totalCmdrs += 1
				}
				row := tbody.InsertRow(-1)
				row.SetClass("data-row")
				row.SetAttribute("key", fmt.Sprintf("%d", v.ID))

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

					// Add the Unit Condition column
					cell = row.InsertCell(-1)
					cell.SetClass("compressed")
					cell.Class().Add("highlight")
					cell.Class().Add("commander")
					cell.SetInnerHTML(v.Nation)
					cell.SetInnerHTML(fmt.Sprintf(`
<i data-unit=%d data-dir="down" class="fa fa-chevron-circle-down"></i> %s 
<i data-unit=%d data-dir="up" class="fa fa-chevron-circle-up"></i>`,
						unitIndex, v.Nation, unitIndex))
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
								if doIt && v.UType == 1 { // Into another Division now, so we are done
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
						}
					})

					// Add the Unit details column
					cell = row.InsertCell(-1)
					cell.SetClass("compressed")
					cell.Class().Add("highlight")
					cell.SetInnerHTML(fmt.Sprintf(`
<i data-unit=%d data-dir="down" class="fa fa-chevron-circle-down"></i> Adjust 
<i data-unit=%d data-dir="up" class="fa fa-chevron-circle-up"></i>`,
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
							totalBayonets := 0
							totalSabres := 0
							totalGuns := 0
							totalCmdrs := 0

							for i, v := range TheCmd.Units {
								if v.UType == 1 {
									totalCmdrs += 1
								}

								if i == u { // Got the Division, so next set are all childs of this
									doIt = true
									continue
								}
								if doIt && v.UType == 1 { // Into another Division now, so we are done
									break
								}
								theCell := doc.QuerySelector(fmt.Sprintf("[name=descr-%d]", v.ID))
								r := 1
								if doIt {
									// This unit is a valid child of the selected Division
									// Increment or decrement the losses in 1% increments
									switch v.UType {
									case 2:
										r = x * (rand.Intn(6) + 1)
										v.BayonetsLost += ((r * v.Bayonets) / 100)
										if v.BayonetsLost < 0 {
											v.BayonetsLost = 0
										}
										if v.BayonetsLost >= v.Bayonets-150 {
											v.BayonetsLost = v.Bayonets - 150
										}
										theCell.SetInnerHTML(fmt.Sprintf("%d Bayonets:\n%s", v.Bayonets-v.BayonetsLost, v.Descr))
									case 3:
										r = x * (rand.Intn(3) + 1)
										v.SabresLost += ((r * v.Sabres) / 100)
										if v.SabresLost < 0 {
											v.SabresLost = 0
										}
										if v.SabresLost >= (v.Sabres - 50) {
											v.SabresLost = v.Sabres - 50
										}
										theCell.SetInnerHTML(fmt.Sprintf("%d Sabres:\n%s", v.Sabres-v.SabresLost, v.Descr))
									case 4:
										v.GunsLost += x
										if v.GunsLost < 0 {
											v.GunsLost = 0
										}
										if v.GunsLost >= v.Guns {
											v.GunsLost = v.Guns - 1
										}
										theCell.SetInnerHTML(fmt.Sprintf("%d Guns:\n%s", v.Guns-v.GunsLost, v.Descr))
									}
									theCell = doc.QuerySelector(fmt.Sprintf("[name=bases-%d]", v.ID))
									theCell.SetInnerHTML(v.GetBases())
								}
								totalBayonets += v.Bayonets - v.BayonetsLost
								totalSabres += v.Sabres - v.SabresLost
								totalGuns += v.Guns - v.GunsLost
							}

							form.Get("Summary").
								SetInnerHTML(fmt.Sprintf("This Unit has a total of %d Commands, %d Bayonets, %d Sabres and %d Guns",
									totalCmdrs,
									totalBayonets,
									totalSabres,
									totalGuns))
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
						addMe = fmt.Sprintf("%d Bayonets:\n", v.Bayonets-v.BayonetsLost)
					case 3:
						addMe = fmt.Sprintf("%d Sabres:\n", v.Sabres-v.SabresLost)
					case 4:
						addMe = fmt.Sprintf("%d Guns:\n", v.Guns-v.GunsLost)
					}
					cell.SetInnerHTML(addMe + v.Descr)
				}

			}

			form.Get("Summary").
				SetInnerHTML(fmt.Sprintf("This Unit has a total of %d Commands, %d Bayonets, %d Sabres and %d Guns",
					totalCmdrs,
					totalBayonets,
					totalSabres,
					totalGuns))
		}

		// Add a button bar for all the commands in this team

		div := form.Get("Commands")
		div.SetInnerHTML("")
		bbar := doc.CreateElement("DIV")
		bbar.Class().Add("button-bar")
		theCmds := game.RedCmd
		if team == "Blue" {
			theCmds = game.BlueCmd
		}
		for _, v := range theCmds {
			btn := doc.CreateElement("INPUT").(*dom.HTMLInputElement)
			btn.Class().SetString("button button-outline")
			btn.Value = v.Name
			btn.SetAttribute("data-cmd-id", fmt.Sprintf("%d", v.ID))
			btn.SetAttribute("type", "button")
			bbar.AppendChild(btn)

			btn.AddEventListener("click", false, func(evt dom.Event) {
				b := evt.Target()
				// reset all bbar buttons to outline mode
				for _, v := range bbar.QuerySelectorAll(".button") {
					v.Class().SetString("button button-outline")
				}
				b.Class().SetString("button button-primary")
				k, _ := strconv.Atoi(b.GetAttribute("data-cmd-id"))
				if k > 0 {
					TheCmd = game.GetCmd(team, k)
					drawUnitList()
				}
			})
		}
		div.AppendChild(bbar)

		showDisqus(fmt.Sprintf("game-%d", id), fmt.Sprintf("Game - %06d - %s", game.ID, game.Name))
	}()
}

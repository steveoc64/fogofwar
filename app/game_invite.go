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
	Session.Subscribe("Play", _play, context)
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
	case "Start":
		dom.GetWindow().Alert("Game has started .. click to begin")
		Session.Navigate(fmt.Sprintf("/play/%d", id))
		return
	}

	w := dom.GetWindow()
	doc := w.Document()

	go func() {
		game := shared.Game{}
		TheCmd := &shared.GameCmd{}
		TheUnit := &shared.Unit{}

		rerr := RPC("GameRPC.GetInvite", shared.GameRPCData{
			Channel:  Session.Channel,
			ID:       id,
			GetUnits: true,
		}, &game)
		if rerr != nil || game.ID == 0 {
			dom.GetWindow().Alert("Looks like you are no longer registered to be playing in this game ...")
			Session.Navigate("/")
		}

		form := formulate.EditForm{}
		title := "Game Invite - " + game.Name
		if game.Accepted {
			title += " (Accepted)"

		}
		form.New("fa-bookmark-o", title)

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

		flipped := false
		if game.Red {
			form.Row(1).
				AddDisplayArea(1, "Red Team Briefing", "RedBrief")
			flipped = game.RedFlip
		}
		if game.Blue {
			form.Row(1).
				AddDisplayArea(1, "Blue Team Briefing", "BlueBrief")
			flipped = game.BlueFlip
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

		scaleImages := func() {
			gridInches := fmt.Sprintf("%d", game.GridSize)
			for _, v := range []string{"rough", "woods", "building", "fort", "river", "river1", "river2", "objective",
				"1-clear", "1-rough", "1-woods", "1-building", "1-fort"} {
				// print("rescale", v)
				el := doc.QuerySelector("#tile-" + v)
				el.SetAttribute("height", gridInches)
				el.SetAttribute("width", gridInches)
				el = doc.QuerySelector("#tile-" + v + "-img")
				el.SetAttribute("height", gridInches)
				el.SetAttribute("width", gridInches)
			}
		}

		drawTiles := func() {
			game.CalcKm()
			form.Get("svg-map").SetAttribute("viewBox", fmt.Sprintf("0 0 %d %d", game.TableX*12, game.TableY*12))
			rect := form.Get("map-rect")
			rect.SetAttribute("height", fmt.Sprintf("%d", game.TableY*12))
			rect.SetAttribute("width", fmt.Sprintf("%d", game.TableX*12))

			tileSet := form.Get("map-tileset")
			if flipped {
				tileSet.SetAttribute("transform", fmt.Sprintf("rotate(180 %d %d)", game.TableX*6, game.TableY*6))
				for _, v := range tileSet.QuerySelectorAll("text") {
					x, _ := strconv.Atoi(v.GetAttribute("x"))
					y, _ := strconv.Atoi(v.GetAttribute("y"))
					// Black Magic here .. the offsets work, but its hard to understand why
					v.SetAttribute("transform", fmt.Sprintf("rotate(180 %d %d)", x+1, y-2))
				}
			}

			// print("call to draw tiles", game.Tiles, game.GridX, game.GridY, game.GridSize)
			tileSet.SetInnerHTML("")
			if game.GridSize > 0 {
				newHTML := ""
				i := 0
				// print("tiles is", game.Tiles)
				if len(game.Tiles) > 0 {
					for y := 0; y < game.GridY; y++ {
						for x := 0; x < game.GridX; x++ {
							t := game.Tiles[i]
							if t == nil {
								print("aww snap - t is nil !!")
								break
							} else {
								newHTML += fmt.Sprintf(`<rect x="%d" y="%d" width="%d" height="%d" class="map-tile %s" gx="%d" gy="%d" name="tile-%d-%d" data-index="%d"/>`,
									x*game.GridSize, y*game.GridSize, // x and y in inches
									game.GridSize, game.GridSize, // width and height in inches
									t.GetCSS(),    // self-computed CSS content type
									x, y, x, y, i) // coords in terms of grid position, and offset into the parent array
							}
							i++
						}
					}
				}
				team := "red"
				for i, v := range game.RedCmd {
					if v.StartX != -1 && !v.Cull {
						newHTML += fmt.Sprintf(`<rect x="%d" y="%d" width="%d" height="%d" class="map-tile %s" gx="%d" gy="%d" name="red-%d" data-id="%d"/>`,
							v.StartX*game.GridSize, v.StartY*game.GridSize, // x and y in inches
							game.GridSize, game.GridSize, // width and height in inches
							v.GetCSS(), // self-computed CSS content type
							v.StartX, v.StartY, i, v.ID)
						xcoord := v.StartX*game.GridSize + 1
						ycoord := v.StartY*game.GridSize + game.GridSize - 1
						tt := ""
						if flipped {
							tt = fmt.Sprintf("transform=\"rotate(180 %d %d)\"",
								v.StartX*game.GridSize+game.GridSize/2,
								v.StartY*game.GridSize+game.GridSize/2)
						}
						newHTML += fmt.Sprintf(`<text %s x="%d" y="%d" class="unitname-%s" data-id="%d">%s</text>`,
							tt, xcoord, ycoord,
							team, v.ID, v.Name)
					}
				}
				team = "blue"
				for i, v := range game.BlueCmd {
					if v.StartX != -1 && !v.Cull {
						newHTML += fmt.Sprintf(`<rect x="%d" y="%d" width="%d" height="%d" class="map-tile %s" gx="%d" gy="%d" name="blue-%d" data-id="%d"/>`,
							v.StartX*game.GridSize, v.StartY*game.GridSize, // x and y in inches
							game.GridSize, game.GridSize, // width and height in inches
							v.GetCSS(), // self-computed CSS content type
							v.StartX, v.StartY, i, v.ID)
						xcoord := v.StartX*game.GridSize + 1
						ycoord := v.StartY*game.GridSize + game.GridSize - 1
						tt := ""
						if flipped {
							tt = fmt.Sprintf("transform=\"rotate(180 %d %d)\"",
								v.StartX*game.GridSize+game.GridSize/2,
								v.StartY*game.GridSize+game.GridSize/2)
						}
						newHTML += fmt.Sprintf(`<text %s x="%d" y="%d" class="unitname-%s" data-id="%d">%s</text>`,
							tt, xcoord, ycoord,
							team, v.ID, v.Name)
					}
				}
				// add objective tiles on top of everything else !!
				for i, v := range game.Objectives {
					print("gen svg for obj", v, flipped)
					newHTML += fmt.Sprintf(`<rect x="%d" y="%d" width="%d" height="%d" class="map-tile %s" gx="%d" gy="%d" data-id="%d"/>`,
						v.X*game.GridSize, v.Y*game.GridSize, // x and y in inches
						game.GridSize, game.GridSize, // width and height in inches
						v.GetCSS(), // self-computed CSS content type
						v.X, v.Y, i)
					ycoord := v.Y + 1
					if ycoord >= game.GridY {
						ycoord -= 2
					}
					if ycoord < 0 {
						ycoord = 0
					}
					xcoord := v.X*game.GridSize + (game.GridSize / 2)
					ycoord = ycoord*game.GridSize + (game.GridSize / 2)
					tt := ""
					if flipped {
						tt = fmt.Sprintf("transform=\"rotate(180 %d %d)\"",
							xcoord,
							ycoord)
					}
					newHTML += fmt.Sprintf(`<text %s x="%d" y="%d" class="objective-name" data-id="%d">%s</text>`,
						tt,
						xcoord, ycoord, i, v.Name)
				}

				// print("setting newHTML", newHTML)
				tileSet.SetInnerHTML(newHTML)

				// Add click handlers on the tiles

			}
		}

		handleMapClick := func(el *dom.BasicHTMLElement) {
			cl := el.Class()
			if cl.Contains("tile-objective") || cl.Contains("objective-name") {
				obj, _ := strconv.Atoi(el.GetAttribute("data-id"))
				TheObjective := game.Objectives[obj]
				html := fmt.Sprintf("Objective: %s, Victory Points ", TheObjective.Name)
				if game.Red {
					html += fmt.Sprintf("Red: %d + %d per turn",
						TheObjective.RedVP, TheObjective.VPPerTurn)
				}
				if game.Blue {
					html += fmt.Sprintf("Blue: %d + %d per turn",
						TheObjective.BlueVP, TheObjective.VPPerTurn)
				}
				form.Get("tile-description").SetInnerHTML(html)
			} else if cl.Contains("tile-blue") || cl.Contains("unitname-blue") {
				uid, _ := strconv.Atoi(el.GetAttribute("data-id"))
				cmd := game.GetCmd("Blue", uid)
				cmd.CalcTotals()
				html := fmt.Sprintf("<b>Player: %s</b><br><b>%s</b> Nation: %s. Commander: %s<br>Summary: %d Commands with %s<br>\n",
					cmd.PlayerName, cmd.Name, cmd.Nation, cmd.CommanderName, cmd.Cmdrs, cmd.Summarize())
				form.Get("tile-description").SetInnerHTML(html)
			} else if cl.Contains("tile-red") || cl.Contains("unitname-red") {
				uid, _ := strconv.Atoi(el.GetAttribute("data-id"))
				cmd := game.GetCmd("Red", uid)
				cmd.CalcTotals()
				html := fmt.Sprintf("<b>Player: %s</b><br><b>%s</b> Nation: %s. Commander: %s<br>Summary: %d Commands with %s<br>\n",
					cmd.PlayerName, cmd.Name, cmd.Nation, cmd.CommanderName, cmd.Cmdrs, cmd.Summarize())
				form.Get("tile-description").SetInnerHTML(html)
			} else {
				html := ""
				if cl.Contains("tile-content-0-0") {
					html = "Clear Terrain"
				}
				if cl.Contains("tile-content-0-1") {
					html = "Rough Ground"
				}
				if cl.Contains("tile-content-0-2") {
					html = "Woods"
				}
				if cl.Contains("tile-content-0-3") {
					html = "Built Up Area"
				}
				if cl.Contains("tile-content-0-4") {
					html = "Fortified Position"
				}
				if cl.Contains("tile-content-0-5") {
					html = "River"
				}
				if cl.Contains("tile-content-0-6") {
					html = "River"
				}
				if cl.Contains("tile-content-0-7") {
					html = "River"
				}

				if cl.Contains("tile-content-1-0") {
					html = "High Ground - Clear"
				}
				if cl.Contains("tile-content-1-1") {
					html = "High Ground - Rough"
				}
				if cl.Contains("tile-content-1-2") {
					html = "High Ground - Woods"
				}
				if cl.Contains("tile-content-1-3") {
					html = "High Ground - Built Up Area"
				}
				if cl.Contains("tile-content-1-4") {
					html = "High Ground - Fortified Position"
				}

				form.Get("tile-description").SetInnerHTML(html)
			}
		}

		loadTemplate("view-units", "[name=ViewUnits]", nil)
		form.ActionGrid("game-invite-actions", "#action-grid", game, func(url string) {
			// print("action url", url)
			switch url {
			case "Overview":
				loadTemplate("game-overview", "#game-overview", &game)
				doc.QuerySelector("#game-overview").AddEventListener("click", false, func(evt dom.Event) {
					if evt.Target().TagName() == "INPUT" {
						doc.QuerySelector("#game-overview").Class().Remove("md-show")
					}
				})
				doc.QuerySelector("#game-overview").Class().Add("md-show")
			case "Players":
				loadTemplate("game-players", "#game-players", &game)
				doc.QuerySelector("#game-players").AddEventListener("click", false, func(evt dom.Event) {
					if evt.Target().TagName() == "INPUT" {
						doc.QuerySelector("#game-players").Class().Remove("md-show")
					}
				})
				doc.QuerySelector("#game-players").Class().Add("md-show")
			case "Table":
				loadTemplate("game-map", "#game-map", &game)
				doc.QuerySelector("#game-map").AddEventListener("click", false, func(evt dom.Event) {
					el := evt.Target()
					tag := el.TagName()
					switch tag {
					case "INPUT":
						doc.QuerySelector("#game-map").Class().Remove("md-show")
					case "rect", "RECT", "text", "TEXT":
						print("clicked on a tile of class", el.GetAttribute("class"))
						handleMapClick(el.(*dom.BasicHTMLElement))
					default:
						print("clicked on", tag)
					}
				})
				drawTiles()
				scaleImages()
				doc.QuerySelector("#game-map").Class().Add("md-show")

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
		form.AppendDiv("game-map", "md-modal md-effect-1 game-map")
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
						if b.Class().Contains("button-primary") {
							b.Class().Remove("button-primary")
							b.Class().Add("button-outline")
							form.Get("UnitList").SetInnerHTML("")
							form.Hide(oobRow)
						} else {

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
			// print("show red commands")
			showCommands("Red")
		}

		if game.Blue {
			// print("show blue commands")
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
				TheUnit = unit
				// print("unit is", unit)
				if unit.UType == 1 {
					unit.Summary = unit.GetSummary(TheCmd)
				}
				loadTemplate("unit-details", "#unit-details", unit)
				inspection := doc.QuerySelector("#unit-details").QuerySelector(".inspection")
				inspection.AddEventListener("click", false, func(evt dom.Event) {
					// print("clicke on the unit details")
					unit := TheUnit
					el := evt.Target()
					// print("clicked on a ", el.TagName())
					if el.TagName() == "INPUT" {
						value := el.(*dom.HTMLInputElement).Value
						// print("with value", value)
						// print("on utype", unit.UType)
						switch unit.UType {
						case 1:
							doc.QuerySelector("#unit-details").Class().Remove("md-show")
						case 2, 5:
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
						case 3:
							// print("in cav with", value)
							switch value {
							case "Honours":
								// print("here with Honours")
								loadTemplate("unit-cav-details", "[name=unitcard]", unit)
								return
							default:
								doc.QuerySelector("#unit-details").Class().Remove("md-show")
							}
						case 4:
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

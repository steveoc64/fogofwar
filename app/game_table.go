package main

import (
	"fmt"
	"strconv"
	"strings"

	"./shared"
	"github.com/go-humble/router"
	"github.com/steveoc64/formulate"
	"honnef.co/go/js/dom"
)

var AllowedGridSizes = []shared.GridSize{
	{0, `No Grid : Use A Custom Ground Scale (2 Bn in line per Qtr Mile)`},
	{4, `4" Grid : Micro scale : 1"=100m : 1" Base = ½Bn, or 60mm frontage = Full Bn`},
	{6, `6" Grid : 15mm scale  : 1"=75m : 40mm frontage Base = ½Bn`},
	{8, `8" Grid : 28mm scale :  1"=50m : 60mm frontage Base = ½Bn`},
	{12, `1' Grid : Le Grande Scale : 1"=33m : 40mm frontage Base = Company`},
}

var AllowedGridSizesMobile = []shared.GridSize{
	{0, `No Grid : Custom Ground Scale`},
	{4, `4" Grid : Micro scale : 1"=100m : 1" Bases`},
	{6, `6" Grid : 15mm scale  : 1"=75m : 40mm Bases`},
	{8, `8" Grid : 28mm scale :  1"=50m : 60mm Bases`},
	{12, `1' Grid : Big Scale : 1"=33m : 80mm Bases`},
}

func gameEditTable(context *router.Context) {
	id, err := strconv.Atoi(context.Params["id"])
	if err != nil {
		print(err.Error())
		return
	}

	defaultMode := context.Params["mode"]
	// print("defaultMode", defaultMode)

	go func() {
		Session.MobileSensitive = true
		game := Session.EditGame
		game.Mobile = Session.Mobile()
		// print("in here with tile 0", game.Tiles[0])
		game.InMode = "Table"

		if len(game.Tiles) == 0 {
			// print("No tiles - create a new set")
			game.InitTiles()
			// print("but after inittiles its", game)
			// } else {
			// game.XYTiles()
		}

		form := formulate.EditForm{}

		// Layout the fields

		if Session.Mobile() {
			if Session.SubMobile() {
				form.New("fa-bookmark", "Table Layout")
			} else {
				form.New("fa-bookmark", "Table Layout - "+game.Name)
			}
		} else {
			form.New("fa-bookmark", "Game Table Layout - "+game.Name)
		}

		if Session.Mobile() {
			if Session.SubMobile() {
				form.Row(2).
					AddNumber(1, "Width in Feet", "TableX", "1").
					AddDisplay(1, "= Scale m Wide", "KmX")
				form.Row(2).
					AddNumber(1, "Depth in Feet", "TableY", "1").
					AddDisplay(1, "= Scale m Deep", "KmY")

				form.Row(1).
					AddSelect(1, "", "GridSize", Session.Lookup.GridSizesMobile, "ID", "Name", 1, game.GridSize)
			} else {
				form.Row(4).
					AddNumber(1, "Width in Feet", "TableX", "1").
					AddDisplay(1, "= Scale m Wide", "KmX").
					AddNumber(1, "Depth in Feet", "TableY", "1").
					AddDisplay(1, "= Scale m Deep", "KmY")
				form.Row(1).
					AddSelect(1, "Grid", "GridSize", Session.Lookup.GridSizes, "ID", "Name", 1, game.GridSize)
			}

		} else {
			form.Row(10).
				AddNumber(1, "Width in Feet", "TableX", "1").
				AddDisplay(1, "= Scale m Wide", "KmX").
				AddNumber(1, "Depth in Feet", "TableY", "1").
				AddDisplay(1, "= Scale m Deep", "KmY").
				AddSelect(6, "Grid Size / Figure Basing Guide", "GridSize", Session.Lookup.GridSizes, "ID", "Name", 1, game.GridSize)
		}

		form.Row(1).
			AddCustom(1, "", "Map", "satellite-bg")

		form.Row(1).
			AddCustom(1, "", "ActionButtons", "button-bar-left")

		if Session.Mobile() {
			form.Row(7).
				AddInput(3, "Objective", "ObjectiveName").
				AddNumber(1, "VP", "VPPerTurn", "1").
				AddNumber(1, "Red", "RedVP", "1").
				AddNumber(1, "Blue", "BlueVP", "1").
				AddButton(1, "x", "DeleteObj")
		} else {
			form.Row(7).
				AddInput(3, "Objective", "ObjectiveName").
				AddNumber(1, "VP Per Turn", "VPPerTurn", "1").
				AddNumber(1, "VP Red", "RedVP", "1").
				AddNumber(1, "VP Blue", "BlueVP", "1").
				AddButton(1, "Delete", "DeleteObj")
		}

		form.Row(1).
			AddCustom(1, "", "ModeButtons", "button-bar-left")

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate(fmt.Sprintf("/game/%d", id))
		})

		// form.SaveEvent(func(evt dom.Event) {
		// 	evt.PreventDefault()
		// 	print("TODO - save the map")
		// })

		form.PrintEvent(func(evt dom.Event) {
			dom.GetWindow().Print()
		})

		// All done, so render the form
		form.Render("edit-form", "main", game)
		loadTemplate("game-table-svg", "[name=Map]", game)
		form.Get("TableX").SetAttribute("max", "16")
		form.Get("TableY").SetAttribute("max", "8")

		w := dom.GetWindow()
		doc := w.Document()
		bbar := form.Get("ModeButtons")
		abar := form.Get("ActionButtons")
		bbar.SetInnerHTML("")
		if Session.Mobile() {
			abar.SetInnerHTML("")
		} else {
			abar.SetInnerHTML(`NOTE: The Satellite image above is presented as an approximate guide to how the real world should look at the 6" grid table scale. Each Grid Square is Quarter Mile.<br>`)
		}
		editMode := "" // This is the sub-thing within the mode, ie in mode terrain, editmode = rough, woods, etc
		modeSet := defaultMode
		oldModeSet := ""
		flipped := false
		TheCmd := &shared.GameCmd{}
		TheObj := &shared.GameObjective{}
		currentObjX := -1
		currentObjY := -1

		// if modeSet == "objective" {
		// 	form.Get("row-3").Class().Remove("hidden")
		// } else {
		// 	form.Get("row-3").Class().Add("hidden")
		// }

		objRow := "row-3"
		if Session.Mobile() {
			objRow = "row-4"
			if Session.SubMobile() {
				objRow = "row-5"
			}
		}
		print("objRow", objRow)
		form.Get(objRow).Class().Add("hidden")

		// Scroll to the map
		scrollToMap := func() {
			// mapLoc := form.Get("Map").GetBoundingClientRect()
			// print("maploc is", mapLoc)
			w.Scroll(0, 220)
		}

		// Redraw the mode buttons
		drawActionBtns := func() {
			// print("draw action btns and editmode is", editMode)
			btns := abar.QuerySelectorAll(".button")
			for _, v := range btns {
				f := v.(*dom.HTMLInputElement).Value

				if f == editMode {
					v.Class().Remove("button-outline")
					v.Class().Add("button-primary")
				} else {
					v.Class().Add("button-outline")
					v.Class().Remove("button-primary")
				}
			}
		}

		tileSet := form.Get("map-tileset")
		drawTiles := func() {
			// print("call to draw tiles", modeSet, editMode, game.Tiles)
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

				// add objective tiles on top !!
				if modeSet == "objective" {
					for i, v := range game.Objectives {
						// print("gen svg for obj", v)
						newHTML += fmt.Sprintf(`<rect x="%d" y="%d" width="%d" height="%d" class="map-tile %s" gx="%d" gy="%d" name="objective-%d"/>`,
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
								xcoord, ycoord)
						}
						newHTML += fmt.Sprintf(`<text %s x="%d" y="%d" class="objective-name">%s</text>`,
							tt,
							xcoord, ycoord, v.Name)
					}
				}
				// add unit tiles on top
				if modeSet == "red" || modeSet == "blue" {
					team := "red"
					for i, v := range game.RedCmd {
						if v.StartX != -1 && !v.Cull {
							newHTML += fmt.Sprintf(`<rect x="%d" y="%d" width="%d" height="%d" class="map-tile %s" gx="%d" gy="%d" name="red-%d" data-id="%d"/>`,
								v.StartX*game.GridSize, v.StartY*game.GridSize, // x and y in inches
								game.GridSize, game.GridSize, // width and height in inches
								v.GetCSS(), // self-computed CSS content type
								v.StartX, v.StartY, i, v.ID)
							if modeSet == "red" {
								xcoord := v.StartX*game.GridSize + 1
								ycoord := v.StartY*game.GridSize + game.GridSize - 1
								tt := ""
								if flipped {
									tt = fmt.Sprintf("transform=\"rotate(180 %d %d)\"",
										v.StartX*game.GridSize+game.GridSize/2,
										v.StartY*game.GridSize+game.GridSize/2)
								}
								newHTML += fmt.Sprintf(`<text %s x="%d" y="%d" class="unitname-%s">%s</text>`,
									tt, xcoord, ycoord,
									team,
									v.Name)
							}
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
							if modeSet == "blue" {
								xcoord := v.StartX*game.GridSize + 1
								ycoord := v.StartY*game.GridSize + game.GridSize - 1
								tt := ""
								if flipped {
									tt = fmt.Sprintf("transform=\"rotate(180 %d %d)\"",
										v.StartX*game.GridSize+game.GridSize/2,
										v.StartY*game.GridSize+game.GridSize/2)
								}
								newHTML += fmt.Sprintf(`<text %s x="%d" y="%d" class="unitname-%s">%s</text>`,
									tt, xcoord, ycoord,
									team,
									v.Name)
							}
						}
					}

				}
				// print("setting newHTML", newHTML)
				tileSet.SetInnerHTML(newHTML)
			}
		}

		// Create an action button
		actionBtn := func(name string) {
			btn := doc.CreateElement("INPUT").(*dom.HTMLInputElement)
			btn.Class().SetString("button button-outline")
			btn.SetAttribute("type", "button")
			btn.Value = name
			btn.AddEventListener("click", false, func(evt dom.Event) {
				// print("editmode now set to", editMode)
				editMode = evt.Target().(*dom.HTMLInputElement).Value
				drawActionBtns()
				scrollToMap()
			})
			abar.AppendChild(btn)
		}

		// Create a unit button
		unitBtn := func(cmd *shared.GameCmd) {
			btn := doc.CreateElement("INPUT").(*dom.HTMLInputElement)
			if cmd.StartX == -1 {
				btn.Class().SetString("button button-clear")
			} else {
				btn.Class().SetString("button button-outline")
			}
			btn.SetAttribute("type", "button")
			team := "Red"
			if cmd.BlueTeam {
				team = "Blue"
			}
			btn.SetAttribute("data-team", team)
			btn.SetAttribute("data-id", fmt.Sprintf("%d", cmd.ID))
			btn.Value = cmd.Name
			btn.AddEventListener("click", false, func(evt dom.Event) {
				// print("editmode now set to", editMode)
				btn := evt.Target().(*dom.HTMLInputElement)
				editMode = btn.Value
				team := btn.GetAttribute("data-team")
				id, _ := strconv.Atoi(btn.GetAttribute("data-id"))
				TheCmd = game.GetCmd(team, id)
				print("selected Cmd", team, id, TheCmd)
				btn.Class().SetString("button button-primary")
				scrollToMap()
			})
			abar.AppendChild(btn)
		}

		// Add an edit field to the abar
		// editField := func(span int, div *dom.HTMLDivElement, title, name, theType string) *dom.HTMLDivElement {
		// 	col := doc.CreateElement("DIV").(*dom.HTMLDivElement)
		// 	col.SetAttribute("data-field-span", fmt.Sprintf("%d", span))
		// 	el := doc.CreateElement("INPUT").(*dom.HTMLInputElement)
		// 	el.SetAttribute("name", name)
		// 	el.Placeholder = title
		// 	el.Type = theType
		// 	col.AppendChild(el)
		// 	div.AppendChild(col)
		// 	return div
		// }
		// labelField := func(span int, div *dom.HTMLDivElement, lbl string) *dom.HTMLDivElement {
		// 	col := doc.CreateElement("DIV").(*dom.HTMLDivElement)
		// 	col.SetAttribute("data-field-span", fmt.Sprintf("%d", span))
		// 	col.SetInnerHTML(lbl)
		// 	div.AppendChild(col)
		// 	return div
		// }

		setMode := func() {
			// print("doing a setmode of", modeSet)
			switch modeSet {
			case "terrain":
				form.Get(objRow).Class().Add("hidden")
				actionBtn("Clear")
				actionBtn("Rough")
				actionBtn("Woods")
				actionBtn("Built")
				actionBtn("Fort")
				actionBtn("River -")
				actionBtn("River /")
				actionBtn(`River \`)
				actionBtn("Higher")
				actionBtn("Lower")
			case "red":
				form.Get(objRow).Class().Add("hidden")
				TheCmd = &shared.GameCmd{}
				for _, v := range game.RedCmd {
					if !v.Cull {
						unitBtn(v)
					}
				}
			case "blue":
				form.Get(objRow).Class().Add("hidden")
				TheCmd = &shared.GameCmd{}
				for _, v := range game.BlueCmd {
					if !v.Cull {
						unitBtn(v)
					}
				}
			case "objective":
				// form.Get("row-3").Class().Remove("hidden")
				form.Get(objRow).Class().Remove("hidden")
				// Create a set of fields for the objective details
				if oldModeSet != modeSet {
					// if Session.Mobile() {
					// 	abar.SetInnerHTML("")
					// } else {
					// 	abar.SetInnerHTML("Click on a Tile to set an Objective, and then fill in the defails")
					// }
					// ddc := doc.CreateElement("DIV").(*dom.HTMLDivElement)
					// ddc.Class().Add("row")
					// ddc.Class().Add("hidden")
					// ddc.SetID("objective-fields")

					// dd := doc.CreateElement("DIV").(*dom.HTMLDivElement)
					// dd.Class().Add("row")

					// if Session.Mobile() {
					// 	dd.SetAttribute("data-row-span", "6")
					// } else {
					// 	dd.SetAttribute("data-row-span", "12")
					// }
					// dd = editField(6, dd, "Name", "obj-name", "text")
					// // dd = labelField(3, dd, "VP Per Turn / Red / Blue")
					// dd = editField(2, dd, "VP Per Turn", "obj-vpperturn", "number")
					// dd = editField(2, dd, "Red VP", "obj-redvp", "number")
					// dd = editField(2, dd, "Blue VP", "obj-bluevp", "number")
					// col := doc.CreateElement("DIV").(*dom.HTMLDivElement)
					// col.SetAttribute("data-field-span", "1")
					// col.SetInnerHTML(`<i class="fa fa-close">`)
					// col.SetID("delete-obj")
					// dd.AppendChild(col)
					// ddc.AppendChild(dd)
					// abar.AppendChild(ddc)
					// col.AddEventListener("click", false, func(evt dom.Event) {
					// 	if dom.GetWindow().Confirm("Remove this Objective ?") {
					// 		game.RemoveObjective(currentObjX, currentObjY)
					// 		doc.QuerySelector("#objective-fields").Class().Add("hidden")
					// 		currentObjX = -1
					// 		currentObjY = -1
					// 		drawTiles()
					// 	}
					// })

					// abar.AddEventListener("change", false, func(evt dom.Event) {
					// 	// print("one of the objective properties has changed !!")
					// 	// print("X Y of the objective is", currentObjX, currentObjY)
					// 	o := game.GetObjective(currentObjX, currentObjY)
					// 	if o != nil {
					// 		o.Name = abar.QuerySelector("[name=obj-name]").(*dom.HTMLInputElement).Value
					// 		o.VPPerTurn, _ = strconv.Atoi(abar.QuerySelector("[name=obj-vpperturn]").(*dom.HTMLInputElement).Value)
					// 		o.RedVP, _ = strconv.Atoi(abar.QuerySelector("[name=obj-redvp]").(*dom.HTMLInputElement).Value)
					// 		o.BlueVP, _ = strconv.Atoi(abar.QuerySelector("[name=obj-bluevp]").(*dom.HTMLInputElement).Value)
					// 		// print("set into o", o)
					// 		// print("and in the game object, its now", game)

					// 	}
					// })
					print("drawing the tiles again !!")
					drawTiles() // do it again, to ensure that the objective tiles are displayed correctly
				}
				// case "Zones":
				// 	actionBtn("Neutral")
				// 	actionBtn("Red")
				// 	actionBtn("Blue")
			}
		}

		// Add a button to the buttonbar, with event handlers
		modeButton := func(name string) {
			btn := doc.CreateElement("INPUT").(*dom.HTMLInputElement)
			if strings.ToLower(name) == strings.ToLower(modeSet) {
				btn.Class().SetString("button button-primary")
			} else {
				btn.Class().SetString("button button-outline")
			}
			btn.SetAttribute("type", "button")
			btn.Value = name
			btn.AddEventListener("click", false, func(evt dom.Event) {
				abar.SetInnerHTML("")
				oldModeSet = modeSet
				modeSet = evt.Target().(*dom.HTMLInputElement).Value
				setMode()
				abar.Class().Remove("hidden")

				// set all buttons in this bar to button-outline, except for me, and im button-primary
				for _, v := range bbar.QuerySelectorAll(".button") {
					if v.(*dom.HTMLInputElement).Value == modeSet {
						v.Class().Add("button-primary")
						v.Class().Remove("button-outline")
					} else {
						v.Class().Remove("button-primary")
						v.Class().Add("button-outline")
					}
				}
			})
			bbar.AppendChild(btn)
		}

		// Add a button to the buttonbar, with event handlers
		saveButton := func(name string) {
			btn := doc.CreateElement("INPUT").(*dom.HTMLInputElement)
			btn.Class().SetString("button button-clear")
			btn.SetAttribute("type", "button")
			btn.SetAttribute("name", "save-button")
			btn.Value = name
			btn.AddEventListener("click", false, func(evt dom.Event) {
				Session.TilesChanged = true
				Session.SynchEditGame()
				// // print("clicked on the save button")
				// go func() {
				// 	err := RPC("GameRPC.SaveTiles", shared.GameRPCData{
				// 		Channel: Session.Channel,
				// 		ID:      id,
				// 		Game:    game,
				// 	}, &game.CheckTable)
				// 	if err != nil {
				// 		dom.GetWindow().Alert(err.Error())
				// 	} else {
				// 		b := evt.Target()
				// 		c := b.Class()
				// 		c.Remove("button-primary")
				// 		c.Add("button-clear")
				// 	}
				// }()
			})
			bbar.AppendChild(btn)
		}

		// Add a button to the buttonbar, to restore the map
		restoreButton := func(name string) {
			btn := doc.CreateElement("INPUT").(*dom.HTMLInputElement)
			btn.Class().SetString("button button-clear")
			btn.SetAttribute("type", "button")
			btn.SetAttribute("name", "restore-button")
			btn.Value = name
			btn.AddEventListener("click", false, func(evt dom.Event) {
				// print("clicked on the restore button")
				if dom.GetWindow().Confirm("Restoring from file will discard any changes since the last save.\nReally restore the Map from file ?") {
					Session.TilesChanged = false
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
						} else {
							print("reloaded game and tiles", Session.EditGame)
							Session.Reload(context)
						}
					}()

				}
			})
			bbar.AppendChild(btn)
		}

		// Add a flip button to the button bar
		flipButton := func() {
			btn := doc.CreateElement("I")
			btn.Class().SetString("fa fa-refresh fa-2x")
			btn.SetAttribute("name", "flip-button")
			btn.AddEventListener("click", false, func(evt dom.Event) {
				print("flip")
				flipped = !flipped
				tileset := form.Get("map-tileset")

				if flipped {
					tileset.SetAttribute("transform", fmt.Sprintf("rotate(180 %d %d)", game.TableX*6, game.TableY*6))
					for _, v := range tileset.QuerySelectorAll("text") {
						x, _ := strconv.Atoi(v.GetAttribute("x"))
						y, _ := strconv.Atoi(v.GetAttribute("y"))

						// Adjust X,Y back to be the centre of the grid we are going to rotate around
						if v.Class().Contains("objective") {
							// then the x and y are ok as is
						} else {
							// unit text is drawn offset to the right by half a grid and then 1 inch more
							x = x + game.GridSize/2 - 1
							// unit text is drawn offset down 1 grid, and then up an inch
							y = y - game.GridSize/2 + 1
						}
						v.SetAttribute("transform", fmt.Sprintf("rotate(180 %d %d)", x, y))
					}

				} else {
					tileset.RemoveAttribute("transform")
					for _, v := range tileset.QuerySelectorAll("text") {
						v.RemoveAttribute("transform")
					}

				}
			})
			bbar.AppendChild(btn)
		}

		// Create the mode buttons
		modeButton("terrain")
		modeButton("objective")
		modeButton("red")
		modeButton("blue")
		// modeButton("Zones")
		saveButton("Save Map")
		restoreButton("Restore Map")
		flipButton()
		setMode()

		// Add a reset all button

		form.ActionGrid("game-actions", "#action-grid", game, func(url string) {
			// print("clicked on", url)
			Session.Navigate(url)
		})

		resizeMap := func() {
			form.Bind(game)
			if game.TableX < 1 {
				game.TableX = 1
			}
			if game.TableY < 1 {
				game.TableY = 1
			}

			if game.TableX > 16 {
				game.TableX = 16
			}
			if game.TableY > 6 {
				game.TableY = 6
			}

			game.CalcKm()
			form.Get("svg-map").SetAttribute("viewBox", fmt.Sprintf("0 0 %d %d", game.TableX*12, game.TableY*12))
			rect := form.Get("map-rect")
			rect.SetAttribute("height", fmt.Sprintf("%d", game.TableY*12))
			rect.SetAttribute("width", fmt.Sprintf("%d", game.TableX*12))
			// if !Session.Mobile() {
			form.Get("KmX").(*dom.HTMLInputElement).Value = fmt.Sprintf("%d", game.KmX)
			form.Get("KmY").(*dom.HTMLInputElement).Value = fmt.Sprintf("%d", game.KmY)
			// }
			game.ResizeTiles()
			drawTiles()
			b := form.Get("save-button")
			c := b.Class()
			c.Remove("button-clear")
			c.Add("button-primary")
		}

		scaleImages := func() {
			gridInches := fmt.Sprintf("%d", game.GridSize)
			for _, v := range []string{"rough", "woods", "building", "fort", "river", "river1", "river2", "objective"} {
				// print("rescale", v)
				el := doc.QuerySelector("#tile-" + v)
				el.SetAttribute("height", gridInches)
				el.SetAttribute("width", gridInches)
				el = doc.QuerySelector("#tile-" + v + "-img")
				el.SetAttribute("height", gridInches)
				el.SetAttribute("width", gridInches)
			}
		}

		initMap := func() {
			if game.TableX < 1 {
				game.TableX = 1
			}
			if game.TableY < 1 {
				game.TableY = 1
			}
			game.TileX = game.GridX
			game.TileY = game.GridY

			game.CalcKm()
			form.Get("svg-map").SetAttribute("viewBox", fmt.Sprintf("0 0 %d %d", game.TableX*12, game.TableY*12))
			rect := form.Get("map-rect")
			rect.SetAttribute("height", fmt.Sprintf("%d", game.TableY*12))
			rect.SetAttribute("width", fmt.Sprintf("%d", game.TableX*12))
			// if !Session.Mobile() {
			form.Get("KmX").(*dom.HTMLInputElement).Value = fmt.Sprintf("%d", game.KmX)
			form.Get("KmY").(*dom.HTMLInputElement).Value = fmt.Sprintf("%d", game.KmY)
			// }
			drawTiles()
			scaleImages()
		}

		// Resize the SVG rect whenever the table dimensions change
		form.OnEvent("TableX", "change", func(evt dom.Event) {
			resizeMap()
		})

		form.OnEvent("TableY", "change", func(evt dom.Event) {
			resizeMap()
		})

		form.OnEvent("GridSize", "change", func(evt dom.Event) {
			resizeMap()
			scaleImages()
		})

		setObjectiveFields := func(theObj *shared.GameObjective) {
			// abar.QuerySelector("[name=obj-name]").(*dom.HTMLInputElement).Value = theObj.Name
			// abar.QuerySelector("[name=obj-vpperturn]").(*dom.HTMLInputElement).Value = fmt.Sprintf("%d", theObj.VPPerTurn)
			// abar.QuerySelector("[name=obj-redvp]").(*dom.HTMLInputElement).Value = fmt.Sprintf("%d", theObj.RedVP)
			// abar.QuerySelector("[name=obj-bluevp]").(*dom.HTMLInputElement).Value = fmt.Sprintf("%d", theObj.BlueVP)
			form.Get("ObjectiveName").(*dom.HTMLInputElement).Value = theObj.Name
			form.Get("VPPerTurn").(*dom.HTMLInputElement).Value = fmt.Sprintf("%d", theObj.VPPerTurn)
			form.Get("RedVP").(*dom.HTMLInputElement).Value = fmt.Sprintf("%d", theObj.RedVP)
			form.Get("BlueVP").(*dom.HTMLInputElement).Value = fmt.Sprintf("%d", theObj.BlueVP)
			currentObjX = theObj.X
			currentObjY = theObj.Y
		}

		// click on a tile and apply editmode
		form.OnEvent("map-tileset", "click", func(evt dom.Event) {
			t := evt.Target()
			if t.TagName() == "rect" {
				i, _ := strconv.Atoi(t.GetAttribute("data-index"))
				theTile := game.GetTile(i)
				// print("Clicked on tile", *theTile, i)
				tClass := t.Class()
				changed := false

				switch modeSet {
				case "terrain":
					tClass.Remove(theTile.GetCSS())
					theTile.ApplyTerrain(editMode)
					tClass.Add(theTile.GetCSS())
					changed = true
				case "red", "blue":
					print("clicked on unit tile", i, TheCmd)
					tName := t.GetAttribute("name")
					print("tile name", tName)
					TheCmd.StartX = theTile.X
					TheCmd.StartY = theTile.Y
					drawTiles()
				case "objective":
					// print("click on tile in objective mode")
					// doc.QuerySelector("#objective-fields").Class().Remove("hidden")
					form.Get(objRow).Class().Remove("hidden")
					tName := t.GetAttribute("name")
					if strings.HasPrefix(tName, "objective-") {
						// Clicked on existing objective
						i, _ = strconv.Atoi(tName[10:])
						if i >= len(game.Objectives) {
							print("something went a bit wrong there - index out of range", i, len(game.Objectives))
						} else {
							// print("looks like a valid objective", i)
							TheObj = game.Objectives[i]
							print("which gives", TheObj)
							setObjectiveFields(TheObj)
						}
					} else {
						// Clicked on terrain tile with no existing objective
						// print("the tile is", theTile)
						TheObj = game.AddObjective(theTile.X, theTile.Y)
						// print("got", theObj)
						setObjectiveFields(TheObj)
					}
					changed = true
					drawTiles()
					form.Focus("ObjectiveName")
					// case "Zones":
					// 	print("click on tile in zone mode")
				}
				if changed {
					Session.TilesChanged = true
					b := form.Get("save-button")
					c := b.Class()
					c.Remove("button-clear")
					c.Add("button-primary")
				}
			}
		})

		bbar.AddEventListener("click", false, func(evt dom.Event) {
			evt.PreventDefault()
			if evt.Target().TagName() == "INPUT" {
				drawTiles()
			}
		})

		form.OnEvent("DeleteObj", "click", func(evt dom.Event) {
			if dom.GetWindow().Confirm("Remove this Objective ?") {
				game.RemoveObjective(currentObjX, currentObjY)
				form.Get(objRow).Class().Add("hidden")
				currentObjX = -1
				currentObjY = -1
				drawTiles()
				Session.TilesChanged = true
			}
		})

		form.OnEvent("ObjectiveName", "change", func(evt dom.Event) {
			print("name has changed, and theObj is", TheObj)
			TheObj.Name = evt.Target().(*dom.HTMLInputElement).Value
			drawTiles()
			Session.TilesChanged = true
		})

		form.OnEvent("VPPerTurn", "change", func(evt dom.Event) {
			TheObj.VPPerTurn, _ = strconv.Atoi(evt.Target().(*dom.HTMLInputElement).Value)
			Session.TilesChanged = true
		})

		form.OnEvent("RedVP", "change", func(evt dom.Event) {
			TheObj.RedVP, _ = strconv.Atoi(evt.Target().(*dom.HTMLInputElement).Value)
			Session.TilesChanged = true
		})

		form.OnEvent("BlueVP", "change", func(evt dom.Event) {
			TheObj.BlueVP, _ = strconv.Atoi(evt.Target().(*dom.HTMLInputElement).Value)
			Session.TilesChanged = true
		})

		showDisqus(fmt.Sprintf("game-%d", id), fmt.Sprintf("Game - %06d - %s", game.ID, game.Name))
		initMap()
		// drawTiles()
	}()
}

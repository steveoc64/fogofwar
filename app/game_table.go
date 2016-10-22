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

func gameEditTable(context *router.Context) {
	id, err := strconv.Atoi(context.Params["id"])
	if err != nil {
		print(err.Error())
		return
	}

	go func() {
		game := Session.EditGame
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

		form.New("fa-bookmark", "Game Table Layout - "+game.Name)

		form.Row(10).
			AddNumber(1, "Width in Feet", "TableX", "1").
			AddDisplay(1, "= Km Wide", "KmX").
			AddNumber(1, "Depth in Feet", "TableY", "1").
			AddDisplay(1, "= Km Deep", "KmY").
			AddSelect(6, "Grid Size / Figure Basing Guide", "GridSize", Session.Lookup.GridSizes, "ID", "Name", 1, game.GridSize)

		form.Row(1).
			AddCustom(1, "", "Map", "satellite-bg")

		form.Row(1).
			AddCustom(1, "", "ActionButtons", "button-bar-left")

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
		abar.SetInnerHTML(`NOTE: The Satellite image above is presented as an approximate guide to how the real world should look at the 6" grid table scale. Each Grid Square is Quarter Mile.`)
		editMode := ""
		modeSet := ""
		currentObjX := -1
		currentObjY := -1

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
			// print("call to draw tiles", game.Tiles)
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
				if modeSet == "Objective" {
					for i, v := range game.Objectives {
						// print("gen svg for obj", v)
						newHTML += fmt.Sprintf(`<rect x="%d" y="%d" width="%d" height="%d" class="map-tile %s" gx="%d" gy="%d" name="objective-%d"/>`,
							v.X*game.GridSize, v.Y*game.GridSize, // x and y in inches
							game.GridSize, game.GridSize, // width and height in inches
							v.GetCSS(), // self-computed CSS content type
							v.X, v.Y, i)
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
			})
			abar.AppendChild(btn)
		}

		// Add an edit field to the abar
		editField := func(span int, div *dom.HTMLDivElement, title, name, theType string) {
			col := doc.CreateElement("DIV").(*dom.HTMLDivElement)
			col.SetAttribute("data-field-span", fmt.Sprintf("%d", span))
			el := doc.CreateElement("INPUT").(*dom.HTMLInputElement)
			el.SetAttribute("name", name)
			el.Placeholder = title
			el.Type = theType
			col.AppendChild(el)
			div.AppendChild(col)
		}
		labelField := func(span int, div *dom.HTMLDivElement, lbl string) {
			col := doc.CreateElement("DIV").(*dom.HTMLDivElement)
			col.SetAttribute("data-field-span", fmt.Sprintf("%d", span))
			col.SetInnerHTML(lbl)
			div.AppendChild(col)
		}

		// Add a button to the buttonbar, with event handlers
		modeButton := func(name string) {
			btn := doc.CreateElement("INPUT").(*dom.HTMLInputElement)
			btn.Class().SetString("button button-outline")
			btn.SetAttribute("type", "button")
			btn.Value = name
			btn.AddEventListener("click", false, func(evt dom.Event) {
				abar.SetInnerHTML("")
				oldModeSet := modeSet
				modeSet = evt.Target().(*dom.HTMLInputElement).Value
				switch modeSet {
				case "Terrain":
					actionBtn("Clear")
					actionBtn("Rough")
					actionBtn("Woods")
					actionBtn("Built")
					actionBtn("Fort")
					actionBtn("Water -")
					actionBtn("Water /")
					actionBtn(`Water \`)
					actionBtn("Higher")
					actionBtn("Lower")
				case "Objective":
					// Create a set of fields for the objective details
					if oldModeSet != modeSet {
						abar.SetInnerHTML("Click on a Tile to set an Objective, and then fill in the defails")
						dd := doc.CreateElement("DIV").(*dom.HTMLDivElement)
						dd.Class().Add("row")
						dd.Class().Add("hidden")
						dd.SetID("objective-fields")
						dd.SetAttribute("data-row-span", "12")
						editField(6, dd, "Name", "obj-name", "text")
						labelField(3, dd, "VP Per Turn / Red / Blue")
						editField(1, dd, "VP Per Turn", "obj-vpperturn", "number")
						editField(1, dd, "Red VP", "obj-redvp", "number")
						editField(1, dd, "Blue VP", "obj-bluevp", "number")
						col := doc.CreateElement("DIV").(*dom.HTMLDivElement)
						col.SetAttribute("data-field-span", "1")
						col.SetInnerHTML(`<i class="fa fa-close">`)
						col.SetID("delete-obj")
						dd.AppendChild(col)
						abar.AppendChild(dd)
						col.AddEventListener("click", false, func(evt dom.Event) {
							if dom.GetWindow().Confirm("Remove this Objective ?") {
								game.RemoveObjective(currentObjX, currentObjY)
								doc.QuerySelector("#objective-fields").Class().Add("hidden")
								currentObjX = -1
								currentObjY = -1
								drawTiles()
							}
						})

						abar.AddEventListener("change", false, func(evt dom.Event) {
							// print("one of the objective properties has changed !!")
							// print("X Y of the objective is", currentObjX, currentObjY)
							o := game.GetObjective(currentObjX, currentObjY)
							if o != nil {
								o.Name = abar.QuerySelector("[name=obj-name]").(*dom.HTMLInputElement).Value
								o.VPPerTurn, _ = strconv.Atoi(abar.QuerySelector("[name=obj-vpperturn]").(*dom.HTMLInputElement).Value)
								o.RedVP, _ = strconv.Atoi(abar.QuerySelector("[name=obj-redvp]").(*dom.HTMLInputElement).Value)
								o.BlueVP, _ = strconv.Atoi(abar.QuerySelector("[name=obj-bluevp]").(*dom.HTMLInputElement).Value)
								// print("set into o", o)
								// print("and in the game object, its now", game)

							}
						})
					}
					// case "Zones":
					// 	actionBtn("Neutral")
					// 	actionBtn("Red")
					// 	actionBtn("Blue")
				}
				abar.Class().Remove("hidden")
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
				// print("clicked on the save button")
				go func() {
					err := RPC("GameRPC.SaveTiles", shared.GameRPCData{
						Channel: Session.Channel,
						ID:      id,
						Game:    game,
					}, &game.CheckTable)
					if err != nil {
						dom.GetWindow().Alert(err.Error())
					} else {
						b := evt.Target()
						c := b.Class()
						c.Remove("button-primary")
						c.Add("button-clear")
					}
				}()
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
				if dom.GetWindow().Confirm("Restore the Map from file ?") {
					Session.Reload(context)
				}
			})
			bbar.AppendChild(btn)
		}

		// Create the mode buttons
		modeButton("Terrain")
		modeButton("Objective")
		// modeButton("Zones")
		saveButton("Save Map")
		restoreButton("Restore Map")

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
			form.Get("KmX").(*dom.HTMLInputElement).Value = fmt.Sprintf("%d", game.KmX)
			form.Get("KmY").(*dom.HTMLInputElement).Value = fmt.Sprintf("%d", game.KmY)
			game.ResizeTiles()
			drawTiles()
			b := form.Get("save-button")
			c := b.Class()
			c.Remove("button-clear")
			c.Add("button-primary")
		}

		scaleImages := func() {
			gridInches := fmt.Sprintf("%d", game.GridSize)
			for _, v := range []string{"rough", "woods", "building", "fort", "water", "water1", "water2"} {
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
			form.Get("KmX").(*dom.HTMLInputElement).Value = fmt.Sprintf("%d", game.KmX)
			form.Get("KmY").(*dom.HTMLInputElement).Value = fmt.Sprintf("%d", game.KmY)
			drawTiles()
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
			abar.QuerySelector("[name=obj-name]").(*dom.HTMLInputElement).Value = theObj.Name
			abar.QuerySelector("[name=obj-vpperturn]").(*dom.HTMLInputElement).Value = fmt.Sprintf("%d", theObj.VPPerTurn)
			abar.QuerySelector("[name=obj-redvp]").(*dom.HTMLInputElement).Value = fmt.Sprintf("%d", theObj.RedVP)
			abar.QuerySelector("[name=obj-bluevp]").(*dom.HTMLInputElement).Value = fmt.Sprintf("%d", theObj.BlueVP)
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
				case "Terrain":
					tClass.Remove(theTile.GetCSS())
					theTile.ApplyTerrain(editMode)
					tClass.Add(theTile.GetCSS())
					changed = true
				case "Objective":
					// print("click on tile in objective mode")
					doc.QuerySelector("#objective-fields").Class().Remove("hidden")
					tName := t.GetAttribute("name")
					if strings.HasPrefix(tName, "objective-") {
						// Clicked on existing objective
						i, _ = strconv.Atoi(tName[10:])
						if i >= len(game.Objectives) {
							print("something went a bit wrong there - index out of range", i, len(game.Objectives))
						} else {
							// print("looks like a valid objective", i)
							theObj := game.Objectives[i]
							print("which gives", theObj)
							setObjectiveFields(theObj)
						}
					} else {
						// Clicked on terrain tile with no existing objective
						// print("the tile is", theTile)
						theObj := game.AddObjective(theTile.X, theTile.Y)
						// print("got", theObj)
						setObjectiveFields(theObj)
					}
					changed = true
					drawTiles()
					// case "Zones":
					// 	print("click on tile in zone mode")
				}
				if changed {
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

		showDisqus(fmt.Sprintf("game-%d", id), fmt.Sprintf("Game - %06d - %s", game.ID, game.Name))
		initMap()
		// drawTiles()
	}()
}

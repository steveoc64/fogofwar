package main

import (
	"fmt"
	"strconv"

	"./shared"
	"github.com/go-humble/router"
	"github.com/steveoc64/formulate"
	"honnef.co/go/js/dom"
)

func gameEditTable(context *router.Context) {
	id, err := strconv.Atoi(context.Params["id"])
	if err != nil {
		print(err.Error())
		return
	}

	go func() {
		game := shared.Game{}
		err := RPC("GameRPC.Get", shared.GameRPCData{
			Channel: Session.Channel,
			ID:      id,
		}, &game)
		if err != nil {
			dom.GetWindow().Alert(err.Error())
			Session.Navigate("/games")
		}
		game.InitTiles()

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
			print("here in the cancel event")
			evt.PreventDefault()
			Session.Navigate("/games")
		})

		form.SaveEvent(func(evt dom.Event) {
			evt.PreventDefault()
			print("TODO - save the map")
		})

		form.PrintEvent(func(evt dom.Event) {
			dom.GetWindow().Print()
		})

		// All done, so render the form
		form.Render("edit-form", "main", &game)
		loadTemplate("game-table-svg", "[name=Map]", &game)

		w := dom.GetWindow()
		doc := w.Document()
		bbar := form.Get("ModeButtons")
		abar := form.Get("ActionButtons")
		bbar.SetInnerHTML("")
		abar.SetInnerHTML(`NOTE: The Satellite image above is presented as an approximate guide to how the real world should look at the 6" grid table scale. Each Grid Square is Quarter Mile.`)
		editMode := ""

		// Redraw the mode buttons
		drawActionBtns := func() {
			print("draw action btns and editmode is", editMode)
			btns := abar.QuerySelectorAll(".button")
			for _, v := range btns {
				f := v.(*dom.HTMLInputElement).Value
				print("consider the case of ", f, v)

				if f == editMode {
					v.Class().Remove("button-outline")
					v.Class().Add("button-primary")
				} else {
					v.Class().Add("button-outline")
					v.Class().Remove("button-primary")
				}
			}
		}

		// Create an action button
		actionBtn := func(name string) {
			btn := doc.CreateElement("INPUT").(*dom.HTMLInputElement)
			btn.Class().SetString("button button-outline")
			btn.SetAttribute("type", "button")
			btn.Value = name
			btn.AddEventListener("click", false, func(evt dom.Event) {
				print("editmode now set to", editMode)
				editMode = evt.Target().(*dom.HTMLInputElement).Value
				drawActionBtns()
			})
			abar.AppendChild(btn)
		}

		// Add a button to the buttonbar, with event handlers
		modeButton := func(name string) {
			btn := doc.CreateElement("INPUT").(*dom.HTMLInputElement)
			btn.Class().SetString("button button-outline")
			btn.SetAttribute("type", "button")
			btn.Value = name
			btn.AddEventListener("click", false, func(evt dom.Event) {
				abar.SetInnerHTML("")
				switch evt.Target().(*dom.HTMLInputElement).Value {
				case "Terrain":
					actionBtn("Clear")
					actionBtn("Rough")
					actionBtn("Woods")
					actionBtn("Built")
					actionBtn("Fort")
					actionBtn("Water")
					actionBtn("Higher")
					actionBtn("Lower")
				case "Objective":
					actionBtn("Both Sides")
					actionBtn("Red Objective")
					actionBtn("Blue Objective")
				case "Zones":
					actionBtn("Neutral")
					actionBtn("Red")
					actionBtn("Blue")
				}
				abar.Class().Remove("hidden")
			})
			bbar.AppendChild(btn)
		}

		// Create the mode buttons
		modeButton("Terrain")
		modeButton("Objective")
		modeButton("Zones")

		// Add a reset all button

		form.ActionGrid("game-actions", "#action-grid", &game, func(url string) {
			print("clicked on", url)
			Session.Navigate(url)
		})

		tileSet := form.Get("map-tileset")
		drawTiles := func() {
			print("call to draw tiles", game.Tiles)
			tileSet.SetInnerHTML("")
			if game.GridSize > 0 {
				newHTML := ""
				i := 0
				for y := 0; y < game.GridY; y++ {
					for x := 0; x < game.GridX; x++ {
						t := game.Tiles[i]
						newHTML += fmt.Sprintf(`<rect x="%d" y="%d" width="%d" height="%d" class="map-tile %s" gx="%d" gy="%d" name="tile-%d-%d" data-index="%d"/>`,
							x*game.GridSize, y*game.GridSize, // x and y in inches
							game.GridSize, game.GridSize, // width and height in inches
							t.GetCSS(),    // self-computed CSS content type
							x, y, x, y, i) // coords in terms of grid position, and offset into the parent array
						i++
					}
				}
				// print("setting newHTML", newHTML)
				tileSet.SetInnerHTML(newHTML)
			}
		}

		resizeMap := func() {
			form.Bind(&game)
			if game.TableX < 1 {
				game.TableX = 1
			}
			if game.TableY < 1 {
				game.TableY = 1
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
		})

		// click on a tile and apply editmode
		form.OnEvent("map-tileset", "click", func(evt dom.Event) {
			t := evt.Target()
			if t.TagName() == "rect" {
				i, _ := strconv.Atoi(t.GetAttribute("data-index"))
				theTile := game.GetTile(i)
				// print("Clicked on tile", *theTile)
				tClass := t.Class()
				tClass.Remove(theTile.GetCSS())
				theTile.ApplyMode(editMode)
				tClass.Add(theTile.GetCSS())

			}

		})

		showDisqus(fmt.Sprintf("game-%d", id), fmt.Sprintf("Game - %06d - %s", game.ID, game.Name))
		drawTiles()
	}()
}

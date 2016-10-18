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
		rpcClient.Call("GameRPC.Get", shared.GameRPCData{
			Channel: Session.Channel,
			ID:      id,
		}, &game)
		print("game table", game)
		form := formulate.EditForm{}

		// Layout the fields

		form.New("fa-bookmark", "Game Table Layout - "+game.Name)

		form.Row(5).
			AddNumber(1, "Table Width in Feet", "TableX", "1").
			AddNumber(1, "Table Depth in Feet", "TableY", "1").
			AddSelect(3, "Grid Size", "GridSize", Session.Lookup.GridSizes, "ID", "Name", 1, game.GridSize)
		print("grid size ", game.GridSize)
		print("sizes", Session.Lookup.GridSizes)
		form.Row(1).
			AddCustom(1, "", "Map", "map__edit")

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate("/games")
		})

		form.PrintEvent(func(evt dom.Event) {
			dom.GetWindow().Print()
		})

		// All done, so render the form
		form.Render("edit-form", "main", &game)
		loadTemplate("game-table-svg", "[name=Map]", game)
		form.ActionGrid("game-actions", "#action-grid", &game, func(url string) {
			print("clicked on", url)
			Session.Navigate(url)
		})

		resizeMap := func() {
			form.Bind(&game)
			form.Get("svg-map").SetAttribute("viewBox", fmt.Sprintf("0 0 %d00 %d00", game.TableX, game.TableY))
			rect := form.Get("map-rect")
			rect.SetAttribute("height", fmt.Sprintf("%d", game.TableY))
			rect.SetAttribute("width", fmt.Sprintf("%d", game.TableY))
		}

		// Resize the SVG rect whenever the table dimensions change
		form.OnEvent("TableX", "change", func(evt dom.Event) {
			print("TableX has changed")
			resizeMap()
		})

		form.OnEvent("TableY", "change", func(evt dom.Event) {
			print("TableY has changed")
			resizeMap()
		})
	}()
}

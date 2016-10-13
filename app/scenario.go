package main

import (
	"fmt"
	"strconv"

	"./shared"
	"github.com/go-humble/router"
	"github.com/steveoc64/formulate"
	"honnef.co/go/js/dom"
)

func scenarioList(context *router.Context) {

	go func() {
		s1 := []shared.Scenario{}
		s2 := []shared.Scenario{}
		rpcClient.Call("ScenarioRPC.List", Session.Channel, &s1)
		rpcClient.Call("ScenarioRPC.ListPublic", Session.Channel, &s2)
		data := append(s1, s2...)

		form := formulate.ListForm{}
		form.New("fa-sitemap", "Scenarios")

		// Define the layout
		form.Column("Author", "AuthorName")
		form.Column("Name", "Name")
		form.Column("Year", "Year")
		form.Column("Description", "Descr")

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate("/")
		})

		form.NewRowEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate("/scenario/add")
		})

		form.RowEvent(func(key string) {
			Session.Navigate("/scenario/" + key)
		})

		form.Render("scenario-list", "main", data)
		showDisqus("scenarios", "Scenarios General Discussion")
	}()

}

func scenarioAdd(context *router.Context) {

	go func() {
		data := shared.Scenario{}

		form := formulate.EditForm{}

		// Layout the fields

		form.New("fa-sitemap", "Add Scenario")

		form.Row(5).
			AddInput(3, "Name", "Name").
			AddNumber(1, "Year", "Year", "0")

		form.Row(1).
			AddInput(1, "Description", "Descr")

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate("/scenario")
		})

		form.SaveEvent(func(evt dom.Event) {
			evt.PreventDefault()
			form.Bind(&data)

			data := shared.ScenarioRPCData{
				Channel:  Session.Channel,
				Scenario: &data,
			}
			go func() {
				rpcClient.Call("ScenarioRPC.Insert", data, &data)
				Session.Navigate(fmt.Sprintf("/scenario/%d", data.ID))
			}()
		})

		form.PrintEvent(func(evt dom.Event) {
			dom.GetWindow().Print()
		})

		// All done, so render the form
		form.Render("edit-form", "main", &data)

	}()
}

func scenarioEdit(context *router.Context) {
	id, err := strconv.Atoi(context.Params["id"])
	if err != nil {
		print(err.Error())
		return
	}

	go func() {
		data := shared.Scenario{}
		rpcClient.Call("ScenarioRPC.Get", shared.ScenarioRPCData{
			Channel: Session.Channel,
			ID:      id,
		}, &data)

		form := formulate.EditForm{}

		// Layout the fields

		if data.AuthorID == Session.UserID {

			form.New("fa-sitemap", "Edit Scenario Details - "+data.Name)

			rowElem := form.Row(5).
				AddInput(3, "Name", "Name").
				AddNumber(1, "Year", "Year", "0")

			if Session.Rank > 9 {
				rowElem.AddCheck(1, "Public", "Public")
			} else {
				rowElem.AddDisplayCheck(1, "Public", "Public")
			}

			form.Row(1).
				AddInput(1, "Description", "Descr")

			// form.Row(2).
			// 	AddInput(1, "Red Team", "RedTeam").
			// 	AddInput(1, "Blue Team", "BlueTeam")

			form.Row(1).
				AddBigTextarea(1, "Notes", "Notes")

			// form.Row(2).
			// 	AddTextarea(1, "Red Briefing", "RedBrief").
			// 	AddTextarea(1, "Blue Briefing", "BlueBrief")

			// form.DeleteEvent(func(evt dom.Event) {
			// 	evt.PreventDefault()
			// 	go func() {
			// 		data := shared.ScenarioRPCData{
			// 			Channel:  Session.Channel,
			// 			Scenario: &s,
			// 		}
			// 		done := false
			// 		rpcClient.Call("ScenarioRPC.Delete", data, &done)
			// 		Session.Navigate("/scenario")
			// 	}()
			// })

			form.SaveEvent(func(evt dom.Event) {
				evt.PreventDefault()
				form.Bind(&data)

				RPCdata := shared.ScenarioRPCData{
					Channel:  Session.Channel,
					ID:       id,
					Scenario: &data,
				}
				go func() {
					rpcClient.Call("ScenarioRPC.Update", RPCdata, &data)
					Session.Navigate("/scenarios")
				}()
			})

			// form.PrintEvent(func(evt dom.Event) {
			// 	dom.GetWindow().Print()
			// })

		} else {

			form.New("fa-sitemap", "View Details of Scenario - "+data.Name)

			form.Row(4).
				AddDisplay(3, "Name", "Name").
				AddDisplay(1, "Year", "Year")

			form.Row(1).
				AddDisplay(1, "Description", "Descr")

			form.Row(1).
				AddDisplayArea(1, "Notes", "Notes")

			// form.Row(2).
			// 	AddDisplay(1, "Red Team", "RedTeam").
			// 	AddDisplay(1, "Blue Team", "BlueTeam")

			// form.Row(2).
			// 	AddDisplayArea(1, "Red Briefing", "RedBrief").
			// 	AddDisplayArea(1, "Blue Briefing", "BlueBrief")

		}

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate("/scenarios")
		})

		// form.PrintEvent(func(evt dom.Event) {
		// 	dom.GetWindow().Print()
		// })

		// All done, so render the form
		form.Render("edit-form", "main", &data)
		form.ActionGrid("scenario-actions", "#action-grid", data, func(url string) {
			Session.Navigate(url)
		})

		showDisqus(fmt.Sprintf("scenario-%d", id), "Scenario - "+data.Name)

	}()

}

type ForceArray struct {
	ScenarioID int
	CanEdit    bool
	Color      string
	LColor     string
	Forces     *[]shared.Force
}

func scenarioRed(context *router.Context) {
	id, err := strconv.Atoi(context.Params["id"])
	if err != nil {
		print(err.Error())
		return
	}

	go func() {
		data := shared.Scenario{}
		rpcClient.Call("ScenarioRPC.Get", shared.ScenarioRPCData{
			Channel: Session.Channel,
			ID:      id,
		}, &data)
		canEdit := false
		if data.AuthorID == Session.UserID {
			canEdit = true
		}

		form := formulate.EditForm{}

		// Layout the fields

		form.New("fa-flag-o", "Red Force Details - "+data.Name)

		form.Row(1).
			AddInput(1, "Commander", "RedTeam")

		form.Row(1).
			AddTextarea(1, "Briefing", "RedBrief")

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate(fmt.Sprintf("/scenario/%d", id))
		})

		form.SaveEvent(func(evt dom.Event) {
			evt.PreventDefault()
			form.Bind(&data)

			go func() {
				rpcClient.Call("ScenarioRPC.UpdateRed", shared.ScenarioRPCData{
					Channel:  Session.Channel,
					ID:       id,
					Scenario: &data,
				}, &data)
				Session.Reload(context)
			}()
		})

		// All done, so render the form
		form.Render("edit-form", "main", &data)

		// print("add action grid")
		forces := []shared.Force{}
		rpcClient.Call("ScenarioRPC.GetRedForces", shared.ScenarioRPCData{
			Channel: Session.Channel,
			ID:      id,
		}, &forces)
		form.ActionGrid("scenario-forces", "#action-grid", ForceArray{
			ScenarioID: id,
			CanEdit:    canEdit,
			Color:      "Red",
			LColor:     "red",
			Forces:     &forces,
		}, func(url string) {
			// print("clicked on", url)
			Session.Navigate(url)
		})

		showDisqus(fmt.Sprintf("scenario-%d", id), "Scenario - "+data.Name)

	}()
}

func scenarioBlue(context *router.Context) {
	id, err := strconv.Atoi(context.Params["id"])
	if err != nil {
		print(err.Error())
		return
	}

	go func() {
		data := shared.Scenario{}
		rpcClient.Call("ScenarioRPC.Get", shared.ScenarioRPCData{
			Channel: Session.Channel,
			ID:      id,
		}, &data)

		canEdit := false
		if data.AuthorID == Session.UserID {
			canEdit = true
		}

		form := formulate.EditForm{}

		// Layout the fields

		form.New("fa-flag", "Blue Force Details - "+data.Name)

		form.Row(1).
			AddInput(1, "Commander", "BlueTeam")

		form.Row(1).
			AddTextarea(1, "Briefing", "BlueBrief")

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate(fmt.Sprintf("/scenario/%d", id))
		})

		form.SaveEvent(func(evt dom.Event) {
			evt.PreventDefault()
			form.Bind(&data)

			go func() {
				rpcClient.Call("ScenarioRPC.UpdateBlue", shared.ScenarioRPCData{
					Channel:  Session.Channel,
					ID:       id,
					Scenario: &data,
				}, &data)
				Session.Reload(context)
			}()
		})

		// All done, so render the form
		form.Render("edit-form", "main", &data)

		// print("add action grid")
		forces := []shared.Force{}
		rpcClient.Call("ScenarioRPC.GetBlueForces", shared.ScenarioRPCData{
			Channel: Session.Channel,
			ID:      id,
		}, &forces)
		form.ActionGrid("scenario-forces", "#action-grid", ForceArray{
			ScenarioID: id,
			Color:      "Blue",
			CanEdit:    canEdit,
			LColor:     "blue",
			Forces:     &forces,
		}, func(url string) {
			// print("clicked on", url)
			Session.Navigate(url)
		})

		showDisqus(fmt.Sprintf("scenario-%d", id), "Scenario - "+data.Name)

	}()
}

var NationLastUsed string

func scenarioRedAdd(context *router.Context) {
	id, err := strconv.Atoi(context.Params["id"])
	if err != nil {
		print(err.Error())
		return
	}

	go func() {
		data := shared.Force{}
		scenario := shared.Scenario{}
		rpcClient.Call("ScenarioRPC.Get", shared.ScenarioRPCData{
			Channel: Session.Channel,
			ID:      id,
		}, &scenario)

		form := formulate.EditForm{}

		// Layout the fields

		form.New("fa-flag-o", fmt.Sprintf("Add Red Force - %s", scenario.Name))

		form.Row(6).
			AddInput(2, "Nation", "Nation").
			AddInput(2, "Unit Name", "Name").
			AddSelect(1, "Level", "Level", CmdLevels, "ID", "Name", 1, 2).
			AddSelect(1, "Condition", "Condition", Conditions, "ID", "Name", 1, 3)

		form.Row(5).
			AddInput(3, "Commander", "CommanderName").
			AddSelect(1, "Command Rating", "Rating", CmdRatings, "ID", "Name", 1, 3).
			AddSelect(1, "Inspiration", "Inspiration", Inspirations, "ID", "Name", 1, 3)

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate(fmt.Sprintf("/scenario/%d/red", id))
		})

		form.SaveEvent(func(evt dom.Event) {
			evt.PreventDefault()
			form.Bind(&data)
			data.RedTeam = true
			data.ScenarioID = id
			NationLastUsed = data.Nation

			RPCdata := shared.ForceRPCData{
				Channel: Session.Channel,
				Force:   &data,
			}
			go func() {
				print("data", data)
				rpcClient.Call("ScenarioRPC.InsertForce", RPCdata, &data)
				// Session.Navigate(fmt.Sprintf("/scenario/%d/red", id))
				Session.Reload(context)
			}()
		})

		// All done, so render the form
		data.Nation = NationLastUsed
		form.Render("edit-form", "main", &data)

		w := dom.GetWindow()
		doc := w.Document()

		if NationLastUsed == "" {
			doc.QuerySelector("[name=Nation]").(*dom.HTMLInputElement).Focus()
		} else {
			doc.QuerySelector("[name=Name]").(*dom.HTMLInputElement).Focus()
		}

		// Action Grid
		forces := []shared.Force{}
		rpcClient.Call("ScenarioRPC.GetRedForces", shared.ScenarioRPCData{
			Channel: Session.Channel,
			ID:      id,
		}, &forces)
		form.ActionGrid("scenario-forces", "#action-grid", ForceArray{
			ScenarioID: id,
			Color:      "Red",
			CanEdit:    false,
			LColor:     "red",
			Forces:     &forces,
		}, func(url string) {
			// print("clicked on", url)
			Session.Navigate(url)
		})

	}()
}

func scenarioBlueAdd(context *router.Context) {
	id, err := strconv.Atoi(context.Params["id"])
	if err != nil {
		print(err.Error())
		return
	}

	go func() {
		data := shared.Force{}
		scenario := shared.Scenario{}
		rpcClient.Call("ScenarioRPC.Get", shared.ScenarioRPCData{
			Channel: Session.Channel,
			ID:      id,
		}, &scenario)

		form := formulate.EditForm{}

		// Layout the fields

		form.New("fa-flag", fmt.Sprintf("Add Blue Force - %s", scenario.Name))

		form.Row(6).
			AddInput(2, "Nation", "Nation").
			AddInput(2, "Unit Name", "Name").
			AddSelect(1, "Level", "Level", CmdLevels, "ID", "Name", 1, 2).
			AddSelect(1, "Condition", "Condition", Conditions, "ID", "Name", 1, 3)

		form.Row(5).
			AddInput(3, "Commander", "CommanderName").
			AddSelect(1, "Command Rating", "Rating", CmdRatings, "ID", "Name", 1, 3).
			AddSelect(1, "Inspiration", "Inspiration", Inspirations, "ID", "Name", 1, 3)

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate(fmt.Sprintf("/scenario/%d/blue", id))
		})

		form.SaveEvent(func(evt dom.Event) {
			evt.PreventDefault()
			form.Bind(&data)
			data.BlueTeam = true
			data.ScenarioID = id
			NationLastUsed = data.Nation

			RPCdata := shared.ForceRPCData{
				Channel: Session.Channel,
				Force:   &data,
			}
			go func() {
				rpcClient.Call("ScenarioRPC.InsertForce", RPCdata, &data)
				// Session.Navigate(fmt.Sprintf("/scenario/%d/blue/add", id))
				Session.Reload(context)
			}()
		})

		// All done, so render the form
		data.Nation = NationLastUsed
		form.Render("edit-form", "main", &data)

		w := dom.GetWindow()
		doc := w.Document()

		if NationLastUsed == "" {
			doc.QuerySelector("[name=Nation]").(*dom.HTMLInputElement).Focus()
		} else {
			doc.QuerySelector("[name=Name]").(*dom.HTMLInputElement).Focus()
		}

		// Action Grid
		forces := []shared.Force{}
		rpcClient.Call("ScenarioRPC.GetBlueForces", shared.ScenarioRPCData{
			Channel: Session.Channel,
			ID:      id,
		}, &forces)
		form.ActionGrid("scenario-forces", "#action-grid", ForceArray{
			ScenarioID: id,
			Color:      "Blue",
			CanEdit:    false,
			LColor:     "blue",
			Forces:     &forces,
		}, func(url string) {
			// print("clicked on", url)
			Session.Navigate(url)
		})

	}()
}

func forceEdit(context *router.Context) {
	id, err := strconv.Atoi(context.Params["id"])
	if err != nil {
		print(err.Error())
		return
	}

	go func() {
		data := shared.Force{}
		rpcClient.Call("ScenarioRPC.GetForce", shared.ForceRPCData{
			Channel: Session.Channel,
			ID:      id,
		}, &data)
		print("got force")
		scenario := shared.Scenario{}
		rpcClient.Call("ScenarioRPC.Get", shared.ScenarioRPCData{
			Channel: Session.Channel,
			ID:      data.ScenarioID,
		}, &scenario)
		print("got scenario")

		canEdit := false
		if scenario.AuthorID == Session.UserID {
			canEdit = true
		}

		form := formulate.EditForm{}

		// Layout the fields

		Color := "Red"
		LColor := "red"
		if data.BlueTeam {
			Color = "Blue"
			LColor = "blue"
		}
		form.New("fa-flag", fmt.Sprintf("%s Force - %s", Color, scenario.Name))

		form.Row(6).
			AddInput(2, "Nation", "Nation").
			AddInput(2, "Unit Name", "Name").
			AddSelect(1, "Level", "Level", CmdLevels, "ID", "Name", 1, data.Level).
			AddSelect(1, "Condition", "Condition", Conditions, "ID", "Name", 1, data.Condition)

		form.Row(6).
			AddInput(4, "Commander", "CommanderName").
			AddSelect(1, "Command Rating", "Rating", CmdRatings, "ID", "Name", 1, data.Rating).
			AddSelect(1, "Inspiration", "Inspiration", Inspirations, "ID", "Name", 1, data.Inspiration)

		swapper := formulate.Swapper{
			Name:     "UnitDetails",
			Selected: 0,
		}

		form.Row(3).
			AddCustom(1, "Units", "Units", "Units").
			AddSwapper(2, "Unit Details", &swapper)

		// Create the swapper panels, one for each unit type :
		// -- unit type
		// -- 1 Command
		// -- 2 Infantry Brigade
		// -- 3 Cavalry Brigade
		// -- 4 Artillery Reserve
		// -- 5 Other / Asset
		cmdPanel := swapper.AddPanel("Command")
		cmdPanel.AddRow(1).AddInput(1, "Path", "Path")
		cmdPanel.AddRow(1).AddInput(1, "Name", "Name")

		// catPanel := swapper.AddPanel("Category")
		// 	catPanel.AddRow(1).AddInput(1, "Category Name", "CatName")
		// 	catPanel.AddRow(1).AddInput(1, "Stock Code", "CatStockCode")
		// 	catPanel.AddRow(1).AddInput(1, "Description", "CatDescr")
		// 	catPanel.AddRow(2).
		// 		AddSelect(1, "Machine Type", "MachineType",
		// 			machineTypes, "ID", "Name", 0, 0).
		// 		AddSelect(1, "Tool", "MachineTool",
		// 			machineTools, "ID", "Name", 0, 0)

		// 	catPanel.Row(4).
		// 		AddButton(1, "Save", "SaveCat").
		// 		AddButton(1, "+ Category", "AddCat").
		// 		AddButton(1, "+ Part", "AddPart").
		// 		AddButton(1, "- Delete", "DelCat")

		// 	// Layout the fields for Parts
		// 	partPanel := swapper.AddPanel("Part")

		// 	partPanel.Row(2).
		// 		AddInput(1, "Name", "Name").
		// 		AddInput(1, "Stock Code", "StockCode")

		// 	partPanel.Row(1).
		// 		AddInput(1, "Description", "Descr")

		// 	partPanel.Row(4).
		// 		AddDecimal(1, "ReOrder Level", "ReorderStocklevel", 2, "1").
		// 		AddDecimal(1, "ReOrder Qty", "ReorderQty", 2, "1").
		// 		AddDecimal(1, "Current Stock", "CurrentStock", 2, "1").
		// 		AddInput(1, "Qty Type", "QtyType")

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate(fmt.Sprintf("/scenario/%d/%s", scenario.ID, LColor))
		})

		if canEdit {
			form.SaveEvent(func(evt dom.Event) {
				evt.PreventDefault()
				form.Bind(&data)
				NationLastUsed = data.Nation

				RPCdata := shared.ForceRPCData{
					Channel: Session.Channel,
					ID:      data.ID,
					Force:   &data,
				}
				go func() {
					rpcClient.Call("ScenarioRPC.UpdateForce", RPCdata, &data)
					Session.Reload(context)
				}()
			})
		}

		w := dom.GetWindow()
		doc := w.Document()

		// All done, so render the form
		form.Render("edit-form", "main", &data)
		swapper.Select(0)
		doc.QuerySelector(`[name="Units"]`).SetInnerHTML("") // Init the tree panel
		doc.QuerySelector("[name=Name]").(*dom.HTMLInputElement).Focus()

		// Action Grid
		forces := []shared.Force{}
		rpcClient.Call(fmt.Sprintf("ScenarioRPC.Get%sForces", Color), shared.ScenarioRPCData{
			Channel: Session.Channel,
			ID:      data.ScenarioID,
		}, &forces)
		form.ActionGrid("scenario-forces", "#action-grid", ForceArray{
			ScenarioID: data.ScenarioID,
			Color:      Color,
			CanEdit:    canEdit,
			LColor:     LColor,
			Forces:     &forces,
		}, func(url string) {
			// print("clicked on", url)
			Session.Navigate(url)
		})

	}()

}

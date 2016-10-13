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
			AddSelect(1, "Level", "Level", Session.Lookup.CmdLevel, "ID", "Name", 1, 2).
			AddSelect(1, "Condition", "Condition", Session.Lookup.Condition, "ID", "Name", 1, 3)

		form.Row(5).
			AddInput(3, "Commander", "CommanderName").
			AddSelect(1, "Command Rating", "Rating", Session.Lookup.CmdRating, "ID", "Name", 1, 3).
			AddSelect(1, "Inspiration", "Inspiration", Session.Lookup.Inspiration, "ID", "Name", 1, 3)

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
			AddSelect(1, "Level", "Level", Session.Lookup.CmdLevel, "ID", "Name", 1, 2).
			AddSelect(1, "Condition", "Condition", Session.Lookup.Condition, "ID", "Name", 1, 3)

		form.Row(5).
			AddInput(3, "Commander", "CommanderName").
			AddSelect(1, "Command Rating", "Rating", Session.Lookup.CmdRating, "ID", "Name", 1, 3).
			AddSelect(1, "Inspiration", "Inspiration", Session.Lookup.Inspiration, "ID", "Name", 1, 3)

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

	UnitID := 0

	go func() {
		force := shared.Force{}
		rpcClient.Call("ScenarioRPC.GetForce", shared.ForceRPCData{
			Channel: Session.Channel,
			ID:      id,
		}, &force)
		print("got force", force)

		scenario := shared.Scenario{}
		rpcClient.Call("ScenarioRPC.Get", shared.ScenarioRPCData{
			Channel: Session.Channel,
			ID:      force.ScenarioID,
		}, &scenario)
		// print("got scenario")

		canEdit := false
		if scenario.AuthorID == Session.UserID {
			canEdit = true
		}

		form := formulate.EditForm{}

		// Layout the fields

		Color := "Red"
		LColor := "red"
		if force.BlueTeam {
			Color = "Blue"
			LColor = "blue"
		}
		form.New("fa-flag", fmt.Sprintf("%s Force - %s", Color, scenario.Name))

		if canEdit {

			form.Row(6).
				AddInput(2, "Nation", "Nation").
				AddInput(2, "Unit Name", "Name").
				AddSelect(1, "Level", "Level", Session.Lookup.CmdLevel, "ID", "Name", 1, force.Level).
				AddSelect(1, "Condition", "Condition", Session.Lookup.Condition, "ID", "Name", 1, force.Condition)

			form.Row(6).
				AddInput(4, "Commander", "CommanderName").
				AddSelect(1, "Command Rating", "Rating", Session.Lookup.CmdRating, "ID", "Name", 1, force.Rating).
				AddSelect(1, "Inspiration", "Inspiration", Session.Lookup.Inspiration, "ID", "Name", 1, force.Inspiration)
		} else {

			form.Row(6).
				AddDisplay(2, "Nation", "Nation").
				AddDisplay(2, "Unit Name", "Name").
				AddSelect(1, "Level", "Level", Session.Lookup.CmdLevel, "ID", "Name", 1, force.Level).
				AddSelect(1, "Condition", "Condition", Session.Lookup.Condition, "ID", "Name", 1, force.Condition)

			form.Row(6).
				AddDisplay(4, "Commander", "CommanderName").
				AddSelect(1, "Command Rating", "Rating", Session.Lookup.CmdRating, "ID", "Name", 1, force.Rating).
				AddSelect(1, "Inspiration", "Inspiration", Session.Lookup.Inspiration, "ID", "Name", 1, force.Inspiration)
		}

		swapper := formulate.Swapper{
			Name:     "UnitDetails",
			Selected: 1,
		}

		if canEdit {
			form.Row(6).
				AddButton(2, "Division", "AddCommand").
				AddButton(1, "Brigade", "AddBde").
				AddButton(1, "Cavalry Bde", "AddCav").
				AddButton(1, "Artillery", "AddGun").
				AddButton(1, "Detachment", "AddOther")
		}

		form.Row(3).
			AddCustom(1, "Units", "UnitList", "").
			AddSwapper(2, "Unit Details", &swapper)

		// Create the swapper panels, one for each unit type :
		// -- unit type
		// -- 1 Command
		// -- 2 Infantry Brigade
		// -- 3 Cavalry Brigade
		// -- 4 Artillery Reserve
		// -- 5 Other / Asset

		docPanel := swapper.AddPanel("Doc")
		docPanel.AddRow(1).
			AddDisplay(1, "", "Name")

		cmdPanel := swapper.AddPanel("Cmd")
		cmdPanel.AddRow(3).
			AddInput(1, "Division Name", "Name").
			AddInput(1, "Commander", "CommanderName").
			AddInput(1, "Nationality", "Nation")

		bdePanel := swapper.AddPanel("Bde")
		bdePanel.AddRow(3).
			AddInput(2, "Brigade Name", "Name").
			AddInput(1, "Nationality", "Nation")
		bdePanel.AddRow(4).
			AddNumber(1, "Bayonets", "Bayonets", "0").
			AddSelect(1, "Rating", "Rating", Session.Lookup.UnitRating, "ID", "Name", 1, 5).
			AddSelect(1, "Drill", "Drill", Session.Lookup.DrillType, "ID", "Name", 1, 1).
			AddSelect(1, "Arms", "SmallArms", Session.Lookup.SmallArms, "ID", "Name", 1, 1)
		bdePanel.AddRow(3).
			AddNumber(1, "Extra - Light Coys", "LtCoys", "0").
			AddNumber(1, "Jager Coys", "JgCoys", "0").
			AddSelect(1, "Lt Coy Arms", "EliteArms", Session.Lookup.SmallArms, "ID", "Name", 0, 0)
		bdePanel.AddRow(3).
			AddNumber(1, "Attached Sabres", "Sabres", "0").
			AddSelect(1, "Type", "CavType", Session.Lookup.CavType, "ID", "Name", 0, 0).
			AddSelect(1, "Rating", "CavRating", Session.Lookup.UnitRating, "ID", "Name", 0, 0)
		bdePanel.AddRow(3).
			AddNumber(1, "Attached Guns", "Guns", "0").
			AddSelect(1, "Type", "GunneryType", Session.Lookup.Gunnery, "ID", "Name", 0, 0).
			AddSelect(1, "Condition", "GunCondition", Session.Lookup.Condition, "ID", "Name", 0, 0)

		cavPanel := swapper.AddPanel("Cav")
		cavPanel.AddRow(3).
			AddInput(2, "Brigade Name", "Name").
			AddInput(1, "Nationality", "Nation")
		cavPanel.AddRow(3).
			AddNumber(1, "Sabres", "Sabres", "0").
			AddSelect(1, "Type", "CavType", Session.Lookup.CavType, "ID", "Name", 0, 0).
			AddSelect(1, "Rating", "CavRating", Session.Lookup.UnitRating, "ID", "Name", 0, 0)
		cavPanel.AddRow(3).
			AddNumber(1, "Attached Guns", "Guns", "0").
			AddSelect(1, "Type", "GunneryType", Session.Lookup.Gunnery, "ID", "Name", 0, 0).
			AddSelect(1, "Condition", "GunCondition", Session.Lookup.Condition, "ID", "Name", 0, 0)

		gunPanel := swapper.AddPanel("Gun")
		gunPanel.AddRow(3).
			AddNumber(1, "Guns", "Guns", "0").
			AddSelect(1, "Type", "GunneryType", Session.Lookup.Gunnery, "ID", "Name", 0, 0).
			AddSelect(1, "Gun Condition", "GunCondition", Session.Lookup.Condition, "ID", "Name", 0, 0)

		otherPanel := swapper.AddPanel("Other")
		otherPanel.AddRow(3).
			AddInput(2, "Detachment Name", "Name").
			AddSelect(1, "Level", "Level", Session.Lookup.CmdLevel, "ID", "Name", 1, 5)
		otherPanel.AddRow(2).
			AddNumber(1, "Bayonets", "Bayonets", "0").
			AddSelect(1, "Rating", "Rating", Session.Lookup.UnitRating, "ID", "Name", 1, 5)
		otherPanel.AddRow(3).
			AddNumber(1, "Light Coys", "LtCoys", "0").
			AddNumber(1, "Jager Coys", "JgCoys", "0").
			AddSelect(1, "Arms", "EliteArms", Session.Lookup.SmallArms, "ID", "Name", 0, 0)
		otherPanel.AddRow(3).
			AddNumber(1, "Sabres", "Sabres", "0").
			AddSelect(1, "Type", "CavType", Session.Lookup.CavType, "ID", "Name", 0, 0).
			AddSelect(1, "Rating", "CavRating", Session.Lookup.UnitRating, "ID", "Name", 0, 0)
		otherPanel.AddRow(3).
			AddNumber(1, "Guns", "Guns", "0").
			AddSelect(1, "Type", "GunneryType", Session.Lookup.Gunnery, "ID", "Name", 0, 0).
			AddSelect(1, "Gun Condition", "GunCondition", Session.Lookup.Condition, "ID", "Name", 0, 0)

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate(fmt.Sprintf("/scenario/%d/%s", scenario.ID, LColor))
		})

		if canEdit {
			form.SaveEvent(func(evt dom.Event) {
				evt.PreventDefault()
				form.BindPart(&force, false)
				NationLastUsed = force.Nation

				RPCdata := shared.ForceRPCData{
					Channel: Session.Channel,
					ID:      force.ID,
					Force:   &force,
				}
				go func() {
					rpcClient.Call("ScenarioRPC.UpdateForce", RPCdata, &force)
					Session.Navigate(fmt.Sprintf("/scenario/%d/%s", scenario.ID, LColor))
					// Session.Reload(context)
				}()
			})
		}

		w := dom.GetWindow()
		doc := w.Document()

		// All done, so render the form
		form.Render("edit-form", "main", &force)
		swapper.Panels[0].Paint(&shared.ForceUnit{})
		swapper.Select(0)
		doc.QuerySelector("[name=Name]").(*dom.HTMLInputElement).Focus()

		// Action Grid
		setActionGrid := func() {
			forces := []shared.Force{}
			rpcClient.Call(fmt.Sprintf("ScenarioRPC.Get%sForces", Color), shared.ScenarioRPCData{
				Channel: Session.Channel,
				ID:      force.ScenarioID,
			}, &forces)
			form.ActionGrid("scenario-forces", "#action-grid", ForceArray{
				ScenarioID: force.ScenarioID,
				Color:      Color,
				CanEdit:    canEdit,
				LColor:     LColor,
				Forces:     &forces,
			}, func(url string) {
				// print("clicked on", url)
				Session.Navigate(url)
			})
		}

		setActionGrid()

		initUnitList := func() {
			print("init unit list")
			div := doc.QuerySelector("[name=UnitList]").(*dom.HTMLDivElement)
			div.SetInnerHTML("")
			table := doc.CreateElement("TABLE").(*dom.HTMLTableElement)
			table.Class().Add("data-table")
			tbody := doc.CreateElement("TBODY").(*dom.HTMLTableSectionElement)
			table.AppendChild(tbody)
			div.AppendChild(table)

			// add some fake rows

			row := tbody.InsertRow(-1)
			row.SetClass("data-row")
			row.SetAttribute("key", "1")
			cell := row.InsertCell(-1)
			cell.SetClass("compressed")
			cell.SetInnerHTML("some data here")

			row = tbody.InsertRow(-1)
			row.SetClass("data-row")
			row.SetAttribute("key", "2")
			cell = row.InsertCell(-1)
			cell.SetClass("compressed")
			cell.SetInnerHTML("some more data here")

			row = tbody.InsertRow(-1)
			row.SetClass("data-row")
			row.SetAttribute("key", "3")
			cell = row.InsertCell(-1)
			cell.SetClass("compressed")
			cell.SetInnerHTML("even more data here")

		}

		drawUnitList := func() {
			print("draw unit list")

		}

		initUnitList()
		// Change Event
		if canEdit {

			doc.QuerySelector("form").AddEventListener("change", false, func(evt dom.Event) {
				print("form change event", evt)

				// detect if the top part has changed
				tempForce := force
				form.BindPart(&tempForce, false)
				if tempForce.DifferentTo(force) {
					force = tempForce

					RPCdata := shared.ForceRPCData{
						Channel: Session.Channel,
						ID:      force.ID,
						Force:   &tempForce,
					}
					go func() {
						rpcClient.Call("ScenarioRPC.UpdateForce", RPCdata, &force)
						print("and got back data with id", force.ID, force)
						setActionGrid()
					}()
				} else {
					// Looks like one of the bottom parts has changed
					print("bottom section has changed", swapper.Selected)
					theUnit := shared.ForceUnit{}
					swapper.Panels[swapper.Selected].Bind(&theUnit)
					theUnit.UType = swapper.Selected
					print("panel bind", theUnit)
					switch swapper.Selected {
					case 0:
						print("do nothing on this one")
					case 1:
						print("is command")
					case 2:
						print("is brigade")
					case 3:
						print("is cavalry")
					case 4:
						print("is artillery")
					case 5:
						print("is detachment")
					}

					if theUnit.UType > 0 {
						print("save unit with ID", UnitID)
						drawUnitList()
					}
				}
			})
		}

		// Click on the list, fill in the panel
		doc.QuerySelector("[name=UnitList]").AddEventListener("click", false, func(evt dom.Event) {
			evt.PreventDefault()
			td := evt.Target()
			tr := td.ParentElement()
			// Fix the issue where the user clicked on some clickable element inside the row
			// which adds an extra level which we dont usually need
			if tr.TagName() == "TD" {
				tr = tr.ParentElement()
			}
			key := tr.GetAttribute("key")
			print("clik on unit with key", key)
		})

		// Add Buttons
		doc.QuerySelector("[name=AddCommand]").AddEventListener("click", false, func(evt dom.Event) {
			evt.PreventDefault()
			print("Add Command")
			theUnit := shared.ForceUnit{}
			swapper.Panels[1].Paint(&theUnit)
			swapper.Select(1)
			doc.QuerySelector("[name=Cmd-Name]").(*dom.HTMLInputElement).Focus()
			drawUnitList()
		})

		doc.QuerySelector("[name=AddBde]").AddEventListener("click", false, func(evt dom.Event) {
			evt.PreventDefault()
			print("Add Brigade")
			theUnit := shared.ForceUnit{}
			swapper.Panels[2].Paint(&theUnit)
			swapper.Select(2)
			doc.QuerySelector("[name=Bde-Name]").(*dom.HTMLInputElement).Focus()
			drawUnitList()
		})

		doc.QuerySelector("[name=AddCav]").AddEventListener("click", false, func(evt dom.Event) {
			evt.PreventDefault()
			print("Add Cavalry")
			theUnit := shared.ForceUnit{}
			swapper.Panels[3].Paint(&theUnit)
			swapper.Select(3)
			doc.QuerySelector("[name=Cav-Name]").(*dom.HTMLInputElement).Focus()
			drawUnitList()
		})

		doc.QuerySelector("[name=AddGun]").AddEventListener("click", false, func(evt dom.Event) {
			evt.PreventDefault()
			print("Add Gun")
			theUnit := shared.ForceUnit{}
			swapper.Panels[4].Paint(&theUnit)
			swapper.Select(4)
			doc.QuerySelector("[name=Gun-Name]").(*dom.HTMLInputElement).Focus()
			drawUnitList()
		})

		doc.QuerySelector("[name=AddOther]").AddEventListener("click", false, func(evt dom.Event) {
			evt.PreventDefault()
			print("Add Other")
			theUnit := shared.ForceUnit{}
			swapper.Panels[5].Paint(&theUnit)
			swapper.Select(5)
			doc.QuerySelector("[name=Other-Name]").(*dom.HTMLInputElement).Focus()
			drawUnitList()
		})

	}()

}

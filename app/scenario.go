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

			form.Row(1).
				AddBigTextarea(1, "Notes", "Notes")

			form.Row(2).
				AddInput(1, "Red Team", "RedTeam").
				AddInput(1, "Blue Team", "BlueTeam")

			form.Row(2).
				AddTextarea(1, "Red Briefing", "RedBrief").
				AddTextarea(1, "Blue Briefing", "BlueBrief")

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

			form.Row(2).
				AddDisplay(1, "Red Team", "RedTeam").
				AddDisplay(1, "Blue Team", "BlueTeam")

			form.Row(2).
				AddDisplayArea(1, "Red Briefing", "RedBrief").
				AddDisplayArea(1, "Blue Briefing", "BlueBrief")

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
		showDisqus(fmt.Sprintf("scenario-%d", id), "Scenario - "+data.Name)

	}()

}

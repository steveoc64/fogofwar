package main

import (
	"strconv"

	"./shared"
	"github.com/go-humble/router"
	"github.com/steveoc64/formulate"
	"honnef.co/go/js/dom"
)

func campaignList(context *router.Context) {

	go func() {
		c := []shared.Campaign{}
		c2 := []shared.Campaign{}
		rpcClient.Call("CampaignRPC.List", Session.Channel, &c)
		rpcClient.Call("CampaignRPC.ListPublic", Session.Channel, &c2)
		c3 := append(c, c2...)

		form := formulate.ListForm{}
		form.New("fa-map", "Campaigns")

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
			Session.Navigate("/campaign/add")
		})

		form.RowEvent(func(key string) {
			Session.Navigate("/campaign/" + key)
		})

		form.Render("campaign-list", "main", c3)
	}()

}

func campaignAdd(context *router.Context) {
	print("TODO - Campaign Add")
}

func campaignEdit(context *router.Context) {
	id, err := strconv.Atoi(context.Params["id"])
	if err != nil {
		print(err.Error())
		return
	}

	go func() {
		c := shared.Campaign{}
		rpcClient.Call("CampaignRPC.Get", shared.CampaignRPCData{
			Channel: Session.Channel,
			ID:      id,
		}, &c)

		form := formulate.EditForm{}

		// Layout the fields

		if c.AuthorID == Session.UserID {

			form.New("fa-map", "Edit Campaign Details - "+c.Name)

			form.Row(5).
				AddInput(3, "Name", "Name").
				AddNumber(1, "Year", "Year", "0").
				AddCheck(1, "Public", "Public")

			form.Row(1).
				AddInput(1, "Description", "Descr")

			form.Row(1).
				AddBigTextarea(1, "Notes", "Notes")

			// Add event handlers
			form.CancelEvent(func(evt dom.Event) {
				evt.PreventDefault()
				Session.Navigate("/campaign")
			})

			form.DeleteEvent(func(evt dom.Event) {
				evt.PreventDefault()
				go func() {
					data := shared.CampaignRPCData{
						Channel:  Session.Channel,
						Campaign: &c,
					}
					done := false
					rpcClient.Call("CampaignRPC.Delete", data, &done)
					Session.Navigate("/campaign")
				}()
			})

			form.SaveEvent(func(evt dom.Event) {
				evt.PreventDefault()
				form.Bind(&c)

				data := shared.CampaignRPCData{
					Channel:  Session.Channel,
					ID:       id,
					Campaign: &c,
				}
				go func() {
					rpcClient.Call("CampaignRPC.Update", data, &c)
					Session.Navigate("/campaign")
				}()
			})

			form.PrintEvent(func(evt dom.Event) {
				dom.GetWindow().Print()
			})

		} else {

			form.New("fa-map", "View Details of Campaign - "+c.Name)

			form.Row(4).
				AddDisplay(3, "Name", "Name").
				AddDisplay(1, "Year", "Year")

			form.Row(1).
				AddDisplay(1, "Description", "Descr")

			form.Row(1).
				AddDisplayArea(1, "Notes", "Notes")

			// Add event handlers
			form.CancelEvent(func(evt dom.Event) {
				evt.PreventDefault()
				Session.Navigate("/campaign")
			})

			form.PrintEvent(func(evt dom.Event) {
				dom.GetWindow().Print()
			})
		}

		// All done, so render the form
		form.Render("edit-form", "main", &c)

	}()

}

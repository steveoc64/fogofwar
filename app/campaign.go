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
		print("got c", c)
		print("got c2", c2)

		c3 := append(c, c2...)
		print("got c3")

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
		print("got c", c)

		form := formulate.EditForm{}
		form.New("fa-map", "Campaign Details - "+c.Name)

		// Layout the fields

		form.Row(4).
			AddInput(3, "Name", "Name").
			AddNumber(1, "Year", "Year", "0")

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

		// All done, so render the form
		form.Render("edit-form", "main", &c)

	}()

}

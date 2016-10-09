package main

import (
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
	print("TODO - Campaign Edit")
}

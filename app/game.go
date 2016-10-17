package main

import (
	"fmt"
	"strconv"

	"./shared"
	"github.com/go-humble/router"
	"github.com/steveoc64/formulate"
	"honnef.co/go/js/dom"
)

func gameNew(context *router.Context) {

	// Firstly select a scenario to base the game on

	go func() {
		s1 := []shared.Scenario{}
		s2 := []shared.Scenario{}
		RPC("ScenarioRPC.List", Session.Channel, &s1)
		RPC("ScenarioRPC.ListPublic", Session.Channel, &s2)
		data := append(s1, s2...)

		form := formulate.ListForm{}
		form.New("fa-sitemap", "Choose Scenario To Base Game On :")

		// Define the layout
		form.Column("Author", "AuthorName")
		form.AvatarColumn("Author", "AuthorEmail")
		form.Column("Name", "Name")
		form.Column("Year", "Year")
		form.Column("Description", "Descr")
		form.BoolColumn("Reviewing", "Review")
		form.BoolColumn("Published", "Public")

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Back()
		})

		form.RowEvent(func(key string) {
			print("base it on ", key)
			go func() {
				scenID, err := strconv.Atoi(key)
				newID := 0
				if err == nil {
					err = RPC("ScenarioRPC.CreateGame", shared.ScenarioRPCData{
						Channel: Session.Channel,
						ID:      scenID,
					}, &newID)
					if err == nil {
						print("Created Game", newID)
						Session.Navigate(fmt.Sprintf("/game/%d", newID))
					}
				}

			}()
		})

		form.Render("select-scenario", "main", data)
	}()

}

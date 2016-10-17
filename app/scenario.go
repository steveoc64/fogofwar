package main

import (
	"fmt"
	"strconv"

	"./shared"
	"github.com/go-humble/router"
	"github.com/steveoc64/formulate"
	"honnef.co/go/js/dom"
)

//

func scenarioList(context *router.Context) {
	Session.Subscribe("Scenario", _scenarioList, context)
	go _scenarioList("List", 0, context)
}

func _scenarioList(action string, id int, context *router.Context) {

	print("Here with action", action)

	switch action {
	case "List", "Unlock", "Change", "Deleted", "Fork", "Insert":
		break
	default:
		return
	}
	go func() {
		s1 := []shared.Scenario{}
		s2 := []shared.Scenario{}
		RPC("ScenarioRPC.List", Session.Channel, &s1)
		RPC("ScenarioRPC.ListPublic", Session.Channel, &s2)
		data := append(s1, s2...)

		form := formulate.ListForm{}
		form.New("fa-sitemap", "Scenarios")

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
				RPC("ScenarioRPC.Insert", data, &data)
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
	Session.Subscribe("Scenario", _scenarioEdit, context)
	go _scenarioEdit("Edit", 0, context)
}

func _scenarioEdit(action string, recnum int, context *router.Context) {
	id, err := strconv.Atoi(context.Params["id"])
	if err != nil {
		print(err.Error())
		return
	}

	switch action {
	case "Edit":
		break
	case "Change", "Unlock":
		if recnum != id {
			return
		} else {
			print("scenario has changed ? reload it")
		}
	default:
		return
	}

	go func() {
		data := shared.Scenario{}
		RPC("ScenarioRPC.Get", shared.ScenarioRPCData{
			Channel: Session.Channel,
			ID:      id,
		}, &data)

		form := formulate.EditForm{}
		canEdit := data.AuthorID == Session.UserID

		// LeEmpereur can always edit
		if Session.Rank > 9 {
			canEdit = true
		}

		// Layout the fields

		if canEdit {

			form.New("fa-sitemap", "Edit Scenario Details - "+data.Name)

			rowElem := form.Row(6).
				AddInput(3, "Name", "Name").
				AddNumber(1, "Year", "Year", "0")

			if Session.Rank > 9 {
				rowElem.AddCheck(1, "Published", "Public")
				rowElem.AddCheck(1, "Under Review", "Review")
			} else {
				rowElem.AddDisplayCheck(1, "Published", "Public")
				rowElem.AddDisplayCheck(1, "Under Review", "Review")
			}

			form.Row(1).
				AddInput(1, "Description", "Descr")

			// form.Row(2).
			// 	AddInput(1, "Red Team", "RedTeam").
			// 	AddInput(1, "Blue Team", "BlueTeam")

			form.Row(1).
				AddBigTextarea(1, "Notes", "Notes")

			form.DeleteEvent(func(evt dom.Event) {
				evt.PreventDefault()
				go func() {
					done := false
					err := RPC("ScenarioRPC.Delete", shared.ScenarioRPCData{
						Channel: Session.Channel,
						ID:      data.ID,
					}, &done)
					if err != nil {
						dom.GetWindow().Alert(err.Error())
					} else {
						Session.Navigate("/scenarios")
					}
				}()
			})

			// Autosave on change
			form.SaveEvent(func(evt dom.Event) {
				evt.PreventDefault()
				form.Bind(&data)
				go func() {
					newData := shared.Scenario{}
					RPC("ScenarioRPC.Update", shared.ScenarioRPCData{
						Channel:  Session.Channel,
						ID:       id,
						Scenario: &data,
					}, &newData)
					Session.Reload(context)
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
		if Session.Rank > 9 {
			data.Admin = true
		}
		form.ActionGrid("scenario-actions", "#action-grid", data, func(url string) {
			switch url {
			case "accept":
				if Session.Rank > 9 {
					go func() {
						done := false
						err := RPC("ScenarioRPC.Accept", shared.ScenarioRPCData{
							Channel: Session.Channel,
							ID:      data.ID,
						}, &done)
						if err == nil {
							Session.Navigate("/scenarios")
						}
					}()
				}
			case "lock":
				go func() {
					done := false
					err := RPC("ScenarioRPC.Lock", shared.ScenarioRPCData{
						Channel: Session.Channel,
						ID:      data.ID,
					}, &done)
					if err == nil {
						Session.Reload(context)
					}
				}()
			case "unlock":
				go func() {
					done := false
					err := RPC("ScenarioRPC.Unlock", shared.ScenarioRPCData{
						Channel: Session.Channel,
						ID:      data.ID,
					}, &done)
					if err == nil {
						if Session.Rank < 9 {
							dom.GetWindow().Alert("Thanks, we will review this scenario for publishing ASAP.")
						} else {
							Session.Reload(context)
						}
					}
				}()
			default:
				Session.Navigate(url)
			}
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
		RPC("ScenarioRPC.Get", shared.ScenarioRPCData{
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

		// Autosave on change
		SaveMe := func() {
			form.Bind(&data)
			go func() {
				print("save")
				newData := shared.Scenario{}
				RPC("ScenarioRPC.UpdateRed", shared.ScenarioRPCData{
					Channel:  Session.Channel,
					ID:       id,
					Scenario: &data,
				}, &newData)
			}()
		}

		form.SaveEvent(func(evt dom.Event) {
			evt.PreventDefault()
			SaveMe()
		})

		// form.ChangeEvent(func(evt dom.Event) {
		// 	evt.PreventDefault()
		// 	SaveMe()
		// })

		// All done, so render the form
		form.Render("edit-form", "main", &data)

		// print("add action grid")
		forces := []shared.Force{}
		RPC("ScenarioRPC.GetRedForces", shared.ScenarioRPCData{
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
		RPC("ScenarioRPC.Get", shared.ScenarioRPCData{
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

		SaveMe := func() {
			form.Bind(&data)
			go func() {
				print("manual save")
				newData := shared.Scenario{}
				RPC("ScenarioRPC.UpdateBlue", shared.ScenarioRPCData{
					Channel:  Session.Channel,
					ID:       id,
					Scenario: &data,
				}, &newData)
				print("got back", newData)
			}()
		}

		// Back to saveCB
		form.SaveEvent(func(evt dom.Event) {
			evt.PreventDefault()
			SaveMe()
		})

		// form.ChangeEvent(func(evt dom.Event) {
		// 	evt.PreventDefault()
		// 	SaveMe()
		// })

		// All done, so render the form
		form.Render("edit-form", "main", &data)

		// print("add action grid")
		forces := []shared.Force{}
		RPC("ScenarioRPC.GetBlueForces", shared.ScenarioRPCData{
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
		RPC("ScenarioRPC.Get", shared.ScenarioRPCData{
			Channel: Session.Channel,
			ID:      id,
		}, &scenario)

		form := formulate.EditForm{}

		// Layout the fields

		form.New("fa-flag-o", fmt.Sprintf("Add Red Force - %s", scenario.Name))

		form.Row(6).
			AddInput(2, "Nation", "Nation").
			AddInput(2, "Unit Name", "Name").
			AddSelect(1, "Force Level", "Level", Session.Lookup.CmdLevel, "ID", "Name", 1, 2).
			AddSelect(1, "Troop Condition", "Condition", Session.Lookup.Condition, "ID", "Name", 1, 3)

		form.Row(5).
			AddInput(3, "Commander", "CommanderName").
			AddSelect(1, "Commander Rating", "Rating", Session.Lookup.CmdRating, "ID", "Name", 1, 3).
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
				RPC("ScenarioRPC.InsertForce", RPCdata, &data)
				// Session.Navigate(fmt.Sprintf("/scenario/%d/red", id))
				Session.Reload(context)
			}()
		})

		// All done, so render the form
		data.Nation = NationLastUsed
		form.Render("edit-form", "main", &data)

		if NationLastUsed == "" {
			form.Focus("Nation")
		} else {
			form.Focus("Name")
		}

		// Action Grid
		forces := []shared.Force{}
		RPC("ScenarioRPC.GetRedForces", shared.ScenarioRPCData{
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
		RPC("ScenarioRPC.Get", shared.ScenarioRPCData{
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
				RPC("ScenarioRPC.InsertForce", RPCdata, &data)
				// Session.Navigate(fmt.Sprintf("/scenario/%d/blue/add", id))
				Session.Reload(context)
			}()
		})

		// All done, so render the form
		data.Nation = NationLastUsed
		form.Render("edit-form", "main", &data)

		if NationLastUsed == "" {
			form.Focus("Nation")
		} else {
			form.Focus("Name")
		}

		// Action Grid
		forces := []shared.Force{}
		RPC("ScenarioRPC.GetBlueForces", shared.ScenarioRPCData{
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

func scenarioFork(context *router.Context) {
	id, err := strconv.Atoi(context.Params["id"])
	if err != nil {
		print(err.Error())
		return
	}

	go func() {
		newID := 0
		err := RPC("ScenarioRPC.Fork", shared.ScenarioRPCData{
			Channel: Session.Channel,
			ID:      id,
		}, &newID)
		if err == nil {
			Session.Navigate(fmt.Sprintf("/scenario/%d", newID))
		}
	}()

}

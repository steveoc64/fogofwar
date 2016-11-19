package main

import (
	"fmt"
	"strconv"
	"strings"

	"./shared"
	"github.com/go-humble/router"
	"github.com/steveoc64/formulate"
	"honnef.co/go/js/dom"
)

//

func scenarioList(context *router.Context) {
	Session.Subscribe("Scenario", _scenarioList, context)
	Session.Subscribe("Play", _play, context)
	go _scenarioList("List", nil, context)
}

func _scenarioList(action string, msg *shared.NetData, context *router.Context) {

	print("Here with action", action)

	switch action {
	case "List", "Unlock", "Change", "Deleted", "Fork", "Insert":
		break
	default:
		return
	}
	go func() {
		Session.MobileSensitive = true
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
		if Session.Mobile() {
			form.BoolColumn("Published", "Public")
		} else {
			form.Column("Description", "Descr")
			form.BoolColumn("Reviewing", "Review")
			form.BoolColumn("Published", "Public")
		}

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
		Session.MobileSensitive = true

		form := formulate.EditForm{}

		// Layout the fields

		form.New("fa-sitemap", "Add Scenario")

		if Session.Mobile() {
			form.Row(1).AddInput(1, "Name", "Name")
			form.Row(1).AddNumber(1, "Year", "Year", "0")
			form.Row(1).AddTextarea(1, "Decription", "Descr")
		} else {
			form.Row(5).
				AddInput(3, "Name", "Name").
				AddNumber(1, "Year", "Year", "0")

			form.Row(1).
				AddInput(1, "Description", "Descr")
		}

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
	go _scenarioEdit("Edit", nil, context)
}

func _scenarioEdit(action string, msg *shared.NetData, context *router.Context) {
	id, err := strconv.Atoi(context.Params["id"])
	if err != nil {
		print(err.Error())
		return
	}

	switch action {
	case "Edit":
		break
	case "Change", "Unlock":
		if msg.ID != id {
			return
		} else {
			print("scenario has changed ? reload it")
		}
	default:
		return
	}

	go func() {
		Session.MobileSensitive = true
		data := shared.Scenario{}
		RPC("ScenarioRPC.Get", shared.ScenarioRPCData{
			Channel: Session.Channel,
			ID:      id,
		}, &data)

		form := formulate.EditForm{}
		canEdit := data.AuthorID == Session.UserID
		form.DisplayMode = !canEdit

		// LeEmpereur can always edit
		// if Session.Rank > 9 {
		// 	canEdit = true
		// }
		print("scenario details with displaymode", form.DisplayMode)

		// Layout the fields

		if canEdit {
			form.New("fa-sitemap", "Edit Scenario - "+data.Name)
		} else {
			form.New("fa-sitemap", "View Scenario - "+data.Name)
		}

		if Session.Mobile() {
			form.Row(1).AddFocusInput(1, "Name", "Name")
			form.Row(1).AddNumber(1, "Year", "Year", "0")
			if Session.Rank > 9 {
				form.Row(2).
					AddCheck(1, "Published", "Public").
					AddCheck(1, "Review", "Review")
			} else {
				form.Row(2).
					AddDisplayCheck(1, "Published", "Public").
					AddDisplayCheck(1, "Review", "Review")
			}
		} else {
			rowElem := form.Row(6).
				AddFocusInput(3, "Name", "Name").
				AddNumber(1, "Year", "Year", "0")

			if Session.Rank > 9 {
				rowElem.AddCheck(1, "Published", "Public")
				rowElem.AddCheck(1, "Under Review", "Review")
			} else {
				rowElem.AddDisplayCheck(1, "Published", "Public")
				rowElem.AddDisplayCheck(1, "Under Review", "Review")
			}
		}

		form.Row(1).
			AddInput(1, "Description", "Descr")

		// form.Row(2).
		// 	AddInput(1, "Red Team", "RedTeam").
		// 	AddInput(1, "Blue Team", "BlueTeam")

		form.Row(1).
			AddBigTextarea(1, "Notes", "Notes")

		if canEdit {

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
		}

		// 	// form.PrintEvent(func(evt dom.Event) {
		// 	// 	dom.GetWindow().Print()
		// 	// })

		// } else { // View only mode

		// 	if Session.Mobile() {
		// 		form.Row(1).AddDisplay(1, "Name", "Name")
		// 		form.Row(1).AddDisplay(1, "Year", "Year")
		// 	} else {
		// 		form.Row(4).
		// 			AddDisplay(3, "Name", "Name").
		// 			AddDisplay(1, "Year", "Year")
		// 	}

		// 	form.Row(1).
		// 		AddDisplay(1, "Description", "Descr")

		// 	form.Row(1).
		// 		AddDisplayArea(1, "Notes", "Notes")

		// 	// form.Row(2).
		// 	// 	AddDisplay(1, "Red Team", "RedTeam").
		// 	// 	AddDisplay(1, "Blue Team", "BlueTeam")

		// 	// form.Row(2).
		// 	// 	AddDisplayArea(1, "Red Briefing", "RedBrief").
		// 	// 	AddDisplayArea(1, "Blue Briefing", "BlueBrief")

		// }

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

		// Show parent, and published forks of this scenario
		if data.ForkedFrom != 0 {
			go func() {
				theParent := shared.Scenario{}
				err := RPC("ScenarioRPC.Get", shared.ScenarioRPCData{
					Channel: Session.Channel,
					ID:      data.ForkedFrom,
				}, &theParent)
				if err == nil && theParent.Public {
					formulate.AppendDiv("parent-scenario")
					loadTemplate("parent-scenario", "#parent-scenario", theParent)
					w := dom.GetWindow()
					doc := w.Document()
					doc.QuerySelector("#goto-parent").AddEventListener("click", false, func(evt dom.Event) {
						evt.PreventDefault()
						Session.Navigate(fmt.Sprintf("/scenario/%d", data.ForkedFrom))
					})
				}
			}()
		}

		// Show forks
		if data.NumForks > 0 {
			formulate.AppendDiv("forked-scenarios")
			go func() {
				forks := []shared.Scenario{}
				err := RPC("ScenarioRPC.GetForks", shared.ScenarioRPCData{
					Channel: Session.Channel,
					ID:      data.ID,
				}, &forks)
				if err != nil {
					return
				}

				form := formulate.ListForm{}
				form.New("fa-sitemap", "Copies of this Scenario")

				// Define the layout
				form.Column("Author", "AuthorName")
				form.AvatarColumn("Author", "AuthorEmail")
				form.Column("Name", "Name")
				form.Column("Year", "Year")
				form.Column("Description", "Descr")
				form.BoolColumn("Reviewing", "Review")
				form.BoolColumn("Published", "Public")

				form.RowEvent(func(key string) {
					Session.Navigate("/scenario/" + key)
				})

				form.Render("forked-scenarios-list", "#forked-scenarios", forks)
			}()
		}

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
		// if Session.Rank > 9 {
		// 	canEdit = true
		// }

		form := formulate.EditForm{}
		form.DisplayMode = !canEdit

		// Layout the fields

		form.New("fa-flag-o", "Red Force Details - "+data.Name)

		form.Row(1).
			AddFocusInput(1, "Commander", "RedTeam")

		form.Row(1).
			AddTextarea(1, "Briefing", "RedBrief")

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate(fmt.Sprintf("/scenario/%d", id))
		})

		if canEdit {

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
		}

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
		// if Session.Rank > 9 {
		// 	canEdit = true
		// }

		form := formulate.EditForm{}
		form.DisplayMode = !canEdit

		// Layout the fields

		form.New("fa-flag", "Blue Force Details - "+data.Name)

		form.Row(1).
			AddFocusInput(1, "Commander", "BlueTeam")

		form.Row(1).
			AddTextarea(1, "Briefing", "BlueBrief")

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate(fmt.Sprintf("/scenario/%d", id))
		})

		if canEdit {

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
		}

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
	scenarioForceAdd("Red", context)
}

func scenarioBlueAdd(context *router.Context) {
	scenarioForceAdd("Blue", context)
}

func scenarioForceAdd(team string, context *router.Context) {
	id, err := strconv.Atoi(context.Params["id"])
	if err != nil {
		print(err.Error())
		return
	}

	go func() {
		Session.MobileSensitive = true
		data := shared.Force{}
		scenario := shared.Scenario{}
		RPC("ScenarioRPC.Get", shared.ScenarioRPCData{
			Channel: Session.Channel,
			ID:      id,
		}, &scenario)

		form := formulate.EditForm{}

		// Layout the fields

		form.New("fa-flag-o", fmt.Sprintf("Add %s Force - %s", team, scenario.Name))

		if Session.Mobile() {

			if Session.SubMobile() {
				form.Row(1).
					AddFocusInput(1, "Unit Name", "Name")
				form.Row(1).
					AddInput(1, "Nation", "Nation")
			} else {
				form.Row(2).
					AddFocusInput(1, "Unit Name", "Name").
					AddInput(1, "Nation", "Nation")
			}

			form.Row(2).
				AddSelect(1, "Force Level", "Level", Session.Lookup.CmdLevel, "ID", "Name", 1, 2).
				AddSelect(1, "Troop Condition", "Condition", Session.Lookup.Condition, "ID", "Name", 1, 3)
			form.Row(1).
				AddInput(1, "Commander", "CommanderName")
			form.Row(2).
				AddSelect(1, "Commander Rating", "Rating", Session.Lookup.CmdRating, "ID", "Name", 1, 3).
				AddSelect(1, "Inspiration", "Inspiration", Session.Lookup.Inspiration, "ID", "Name", 1, 3)

		} else {

			form.Row(5).
				AddFocusInput(2, "Unit Name", "Name").
				AddInput(1, "Nation", "Nation").
				AddSelect(1, "Force Level", "Level", Session.Lookup.CmdLevel, "ID", "Name", 1, 2).
				AddSelect(1, "Troop Condition", "Condition", Session.Lookup.Condition, "ID", "Name", 1, 3)

			form.Row(5).
				AddInput(3, "Commander", "CommanderName").
				AddSelect(1, "Commander Rating", "Rating", Session.Lookup.CmdRating, "ID", "Name", 1, 3).
				AddSelect(1, "Inspiration", "Inspiration", Session.Lookup.Inspiration, "ID", "Name", 1, 3)
		}
		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			// Session.Navigate(fmt.Sprintf("/scenario/%d/%s", id, strings.ToLower(team)))
			Session.Navigate(fmt.Sprintf("/scenario/%d", id))
		})

		form.SaveEvent(func(evt dom.Event) {
			evt.PreventDefault()
			form.Bind(&data)
			data.RedTeam = true
			if team == "Blue" {
				data.BlueTeam = true
				data.RedTeam = false
			}
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

		// if NationLastUsed == "" {
		// form.Focus("Nation")
		// } else {
		form.Focus("Name")
		// }

		// Action Grid
		forces := []shared.Force{}
		RPC(fmt.Sprintf("ScenarioRPC.Get%sForces", team), shared.ScenarioRPCData{
			Channel: Session.Channel,
			ID:      id,
		}, &forces)
		form.ActionGrid("scenario-forces", "#action-grid", ForceArray{
			ScenarioID: id,
			Color:      team,
			CanEdit:    false,
			LColor:     strings.ToLower(team),
			Forces:     &forces,
		}, func(url string) {
			// print("clicked on", url)
			Session.Navigate(url)
		})

	}()
}

// func scenarioBlueAdd(context *router.Context) {
// 	id, err := strconv.Atoi(context.Params["id"])
// 	if err != nil {
// 		print(err.Error())
// 		return
// 	}

// 	go func() {
// 		Session.MobileSensitive = true
// 		data := shared.Force{}
// 		scenario := shared.Scenario{}
// 		RPC("ScenarioRPC.Get", shared.ScenarioRPCData{
// 			Channel: Session.Channel,
// 			ID:      id,
// 		}, &scenario)

// 		form := formulate.EditForm{}

// 		// Layout the fields

// 		form.New("fa-flag", fmt.Sprintf("Add Blue Force - %s", scenario.Name))

// 		if Session.Mobile() {

// 			if Session.SubMobile() {
// 				form.Row(1).
// 					AddInput(1, "Unit Name", "Name")
// 				form.Row(1).
// 					AddInput(1, "Nation", "Nation")
// 			} else {
// 				form.Row(2).
// 					AddInput(1, "Unit Name", "Name").
// 					AddInput(1, "Nation", "Nation")
// 			}

// 			form.Row(2).
// 				AddSelect(1, "Force Level", "Level", Session.Lookup.CmdLevel, "ID", "Name", 1, 2).
// 				AddSelect(1, "Troop Condition", "Condition", Session.Lookup.Condition, "ID", "Name", 1, 3)
// 			form.Row(1).
// 				AddInput(1, "Commander", "CommanderName")
// 			form.Row(2).
// 				AddSelect(1, "Commander Rating", "Rating", Session.Lookup.CmdRating, "ID", "Name", 1, 3).
// 				AddSelect(1, "Inspiration", "Inspiration", Session.Lookup.Inspiration, "ID", "Name", 1, 3)

// 		} else {

// 			form.Row(5).
// 				AddInput(2, "Unit Name", "Name").
// 				AddInput(1, "Nation", "Nation").
// 				AddSelect(1, "Force Level", "Level", Session.Lookup.CmdLevel, "ID", "Name", 1, 2).
// 				AddSelect(1, "Troop Condition", "Condition", Session.Lookup.Condition, "ID", "Name", 1, 3)

// 			form.Row(5).
// 				AddInput(3, "Commander", "CommanderName").
// 				AddSelect(1, "Commander Rating", "Rating", Session.Lookup.CmdRating, "ID", "Name", 1, 3).
// 				AddSelect(1, "Inspiration", "Inspiration", Session.Lookup.Inspiration, "ID", "Name", 1, 3)
// 		}

// 		// Add event handlers
// 		form.CancelEvent(func(evt dom.Event) {
// 			evt.PreventDefault()
// 			Session.Navigate(fmt.Sprintf("/scenario/%d/blue", id))
// 		})

// 		form.SaveEvent(func(evt dom.Event) {
// 			evt.PreventDefault()
// 			form.Bind(&data)
// 			data.BlueTeam = true
// 			data.ScenarioID = id
// 			NationLastUsed = data.Nation

// 			RPCdata := shared.ForceRPCData{
// 				Channel: Session.Channel,
// 				Force:   &data,
// 			}
// 			go func() {
// 				RPC("ScenarioRPC.InsertForce", RPCdata, &data)
// 				// Session.Navigate(fmt.Sprintf("/scenario/%d/blue/add", id))
// 				Session.Reload(context)
// 			}()
// 		})

// 		// All done, so render the form
// 		data.Nation = NationLastUsed
// 		form.Render("edit-form", "main", &data)

// 		// if NationLastUsed == "" {
// 		// form.Focus("Nation")
// 		// } else {
// 		form.Focus("Name")
// 		// }

// 		// Action Grid
// 		forces := []shared.Force{}
// 		RPC("ScenarioRPC.GetBlueForces", shared.ScenarioRPCData{
// 			Channel: Session.Channel,
// 			ID:      id,
// 		}, &forces)
// 		form.ActionGrid("scenario-forces", "#action-grid", ForceArray{
// 			ScenarioID: id,
// 			Color:      "Blue",
// 			CanEdit:    false,
// 			LColor:     "blue",
// 			Forces:     &forces,
// 		}, func(url string) {
// 			// print("clicked on", url)
// 			Session.Navigate(url)
// 		})

// 	}()
// }

func scenarioFork(context *router.Context) {
	id, err := strconv.Atoi(context.Params["id"])
	if err != nil {
		print(err.Error())
		return
	}

	if dom.GetWindow().Confirm("Do you want to make a copy of this Scenario ?") {
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

}

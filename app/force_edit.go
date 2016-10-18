package main

import (
	"fmt"
	"strconv"

	"./shared"
	"github.com/go-humble/router"
	"github.com/steveoc64/formulate"
	"honnef.co/go/js/dom"
)

func forceEdit(context *router.Context) {
	id, err := strconv.Atoi(context.Params["id"])
	if err != nil {
		print(err.Error())
		return
	}

	TheUnit := shared.ForceUnit{}
	w := dom.GetWindow()
	doc := w.Document()

	go func() {
		force := shared.Force{}
		RPC("ScenarioRPC.GetForce", shared.ForceRPCData{
			Channel: Session.Channel,
			ID:      id,
		}, &force)
		// print("got force", force)

		scenario := shared.Scenario{}
		RPC("ScenarioRPC.Get", shared.ScenarioRPCData{
			Channel: Session.Channel,
			ID:      force.ScenarioID,
		}, &scenario)
		// print("got scenario")

		canEdit := false
		if scenario.AuthorID == Session.UserID {
			canEdit = true
		}
		if Session.Rank > 9 {
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

			form.Row(10).
				AddInput(3, "Unit Name", "Name").
				AddInput(3, "Nation", "Nation").
				AddSelect(2, "Level", "Level", Session.Lookup.CmdLevel, "ID", "Name", 1, force.Level).
				AddSelect(2, "Condition", "Condition", Session.Lookup.Condition, "ID", "Name", 1, force.Condition)

			form.Row(10).
				AddInput(6, "Commander", "CommanderName").
				AddSelect(2, "Command Rating", "Rating", Session.Lookup.CmdRating, "ID", "Name", 1, force.Rating).
				AddSelect(2, "Inspiration", "Inspiration", Session.Lookup.Inspiration, "ID", "Name", 1, force.Inspiration)
		} else {

			form.Row(10).
				AddDisplay(3, "Unit Name", "Name").
				AddDisplay(3, "Nation", "Nation").
				AddSelect(2, "Level", "Level", Session.Lookup.CmdLevel, "ID", "Name", 1, force.Level).
				AddSelect(2, "Condition", "Condition", Session.Lookup.Condition, "ID", "Name", 1, force.Condition)

			form.Row(10).
				AddDisplay(6, "Commander", "CommanderName").
				AddSelect(2, "Command Rating", "Rating", Session.Lookup.CmdRating, "ID", "Name", 1, force.Rating).
				AddSelect(2, "Inspiration", "Inspiration", Session.Lookup.Inspiration, "ID", "Name", 1, force.Inspiration)
		}

		form.Row(1).
			AddCustom(1, "Summary", "Summary", "")

		swapper := formulate.Swapper{
			Name:     "UnitDetails",
			Selected: 1,
		}

		if canEdit {
			form.Row(5).
				AddButton(1, "Division", "AddCommand").
				AddButton(1, "Special", "AddOther").
				AddButton(1, "Inf", "AddBde").
				AddButton(1, "Cav", "AddCav").
				AddButton(1, "Guns", "AddGun")
		}

		form.Row(5).
			AddCustom(2, "Order Of Battle", "UnitList", "").
			AddSwapper(3, "Unit Details", &swapper)

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
			AddInput(2, "Command Name", "Name").
			AddInput(1, "Nationality", "Nation")
		cmdPanel.AddRow(1).
			AddInput(1, "Description", "Descr")
		cmdPanel.AddRow(3).
			AddInput(1, "Commander", "CommanderName").
			AddSelect(1, "Command Rating", "Rating", Session.Lookup.CmdRating, "ID", "Name", 1, 3).
			AddSelect(1, "Command Level", "CmdLevel", Session.Lookup.CmdLevel, "ID", "Name", 1, 3)
		if canEdit {
			cmdPanel.AddRow(2).
				AddButton(1, "Copy", "Copy").
				AddButton(1, "Delete", "Delete")
		}

		bdePanel := swapper.AddPanel("Bde")
		bdePanel.AddRow(3).
			AddInput(2, "Brigade Name", "Name").
			AddInput(1, "Nationality", "Nation")
		bdePanel.AddRow(1).
			AddInput(1, "Description", "Descr")
		bdePanel.AddRow(12).
			AddNumber(2, "Bayonets", "Bayonets", "100").
			AddSelect(2, "Rating", "Rating", Session.Lookup.UnitRating, "ID", "Code", 1, 5).
			AddSelect(4, "Drill", "Drill", Session.Lookup.DrillType, "ID", "Name", 1, 1).
			AddSelect(4, "Arms", "SmallArms", Session.Lookup.SmallArms, "ID", "Name", 1, 1)
		bdePanel.AddRow(3).
			AddNumber(1, "Extra - Light Coys", "LtCoy", "0").
			AddNumber(1, "Jager Coys", "JgCoy", "0").
			AddSelect(1, "Lt Coy Arms", "EliteArms", Session.Lookup.SmallArms, "ID", "Name", 0, 0)
		bdePanel.AddRow(3).
			AddNumber(1, "Attached Sabres", "Sabres", "10").
			AddSelect(1, "Type", "CavType", Session.Lookup.CavType, "ID", "Name", 0, 0).
			AddSelect(1, "Rating", "CavRating", Session.Lookup.UnitRating, "ID", "Name", 0, 0)
		bdePanel.AddRow(3).
			AddNumber(1, "Attached Guns", "Guns", "0").
			AddSelect(1, "Type", "GunneryType", Session.Lookup.Gunnery, "ID", "Name", 0, 0).
			AddSelect(1, "Condition", "GunCondition", Session.Lookup.Condition, "ID", "Name", 0, 0)
		if canEdit {
			bdePanel.AddRow(2).
				AddButton(1, "Copy", "Copy").
				AddButton(1, "Delete", "Delete")
		}

		cavPanel := swapper.AddPanel("Cav")
		cavPanel.AddRow(3).
			AddInput(2, "Brigade Name", "Name").
			AddInput(1, "Nationality", "Nation")
		cavPanel.AddRow(1).
			AddInput(1, "Description", "Descr")
		cavPanel.AddRow(3).
			AddNumber(1, "Sabres", "Sabres", "100").
			AddSelect(1, "Type", "CavType", Session.Lookup.CavType, "ID", "Name", 0, 0).
			AddSelect(1, "Rating", "CavRating", Session.Lookup.UnitRating, "ID", "Name", 0, 0)
		cavPanel.AddRow(3).
			AddNumber(1, "Attached Guns", "Guns", "0").
			AddSelect(1, "Type", "GunneryType", Session.Lookup.Gunnery, "ID", "Name", 0, 0).
			AddSelect(1, "Condition", "GunCondition", Session.Lookup.Condition, "ID", "Name", 0, 0)
		if canEdit {
			cavPanel.AddRow(2).
				AddButton(1, "Copy", "Copy").
				AddButton(1, "Delete", "Delete")
		}

		gunPanel := swapper.AddPanel("Gun")
		gunPanel.AddRow(3).
			AddInput(1, "Battery Name", "Name").
			AddCheck(1, "Horse Artillery", "HorseGuns").
			AddInput(1, "Nationality", "Nation")
		gunPanel.AddRow(1).
			AddInput(1, "Description", "Descr")
		gunPanel.AddRow(3).
			AddNumber(1, "Guns", "Guns", "0").
			AddSelect(1, "Type", "GunneryType", Session.Lookup.Gunnery, "ID", "Name", 0, 0).
			AddSelect(1, "Gun Condition", "GunCondition", Session.Lookup.Condition, "ID", "Name", 0, 0)
		if canEdit {
			gunPanel.AddRow(2).
				AddButton(1, "Copy", "Copy").
				AddButton(1, "Delete", "Delete")
		}

		otherPanel := swapper.AddPanel("Other")
		otherPanel.AddRow(3).
			AddInput(2, "Detachment Name", "Name").
			AddSelect(1, "Level", "CmdLevel", Session.Lookup.CmdLevel, "ID", "Name", 1, 5)
		otherPanel.AddRow(1).
			AddInput(1, "Description", "Descr")
		otherPanel.AddRow(4).
			AddNumber(1, "Bayonets", "Bayonets", "100").
			AddSelect(1, "Rating", "Rating", Session.Lookup.UnitRating, "ID", "Name", 1, 5).
			AddSelect(1, "Drill", "Drill", Session.Lookup.DrillType, "ID", "Name", 1, 1).
			AddSelect(1, "Arms", "SmallArms", Session.Lookup.SmallArms, "ID", "Name", 1, 1)
		otherPanel.AddRow(3).
			AddNumber(1, "Light Coys", "LtCoy", "0").
			AddNumber(1, "Jager Coys", "JgCoy", "0").
			AddSelect(1, "Arms", "EliteArms", Session.Lookup.SmallArms, "ID", "Name", 0, 0)
		otherPanel.AddRow(3).
			AddNumber(1, "Sabres", "Sabres", "10").
			AddSelect(1, "Type", "CavType", Session.Lookup.CavType, "ID", "Name", 0, 0).
			AddSelect(1, "Rating", "CavRating", Session.Lookup.UnitRating, "ID", "Name", 0, 0)
		otherPanel.AddRow(3).
			AddNumber(1, "Guns", "Guns", "0").
			AddSelect(1, "Type", "GunneryType", Session.Lookup.Gunnery, "ID", "Name", 0, 0).
			AddSelect(1, "Gun Condition", "GunCondition", Session.Lookup.Condition, "ID", "Name", 0, 0)
		if canEdit {
			otherPanel.AddRow(2).
				AddButton(1, "Copy", "Copy").
				AddButton(1, "Delete", "Delete")
		}
		// print("all done and swapper is", swapper)

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate(fmt.Sprintf("/scenario/%d/%s", scenario.ID, LColor))
		})

		// Add print handlers
		form.PrintEvent(func(evt dom.Event) {
			dom.GetWindow().Print()
		})

		if canEdit {
			form.DeleteEvent(func(evt dom.Event) {
				evt.PreventDefault()
				go func() {
					done := false
					err := RPC("ScenarioRPC.DeleteForce", shared.ForceRPCData{
						Channel: Session.Channel,
						ID:      force.ID,
					}, &done)
					if err != nil {
						w.Alert(err.Error())
					}
					Session.Navigate(fmt.Sprintf("/scenario/%d/%s", scenario.ID, LColor))
				}()
			})
		}

		// All done, so render the form
		form.Render("edit-form", "main", &force)
		swapper.Panels[0].Paint(&shared.ForceUnit{})
		swapper.Select(0)
		form.Focus("Name")

		// Turn off printing for some fields
		if canEdit {
			form.Class("row-3").Add("no-print")
			form.Class("grid-4-0").Add("full-print")
			form.Class("grid-4-1").Add("no-print")
		}

		// Action Grid
		setActionGrid := func() {
			forces := []shared.Force{}
			RPC(fmt.Sprintf("ScenarioRPC.Get%sForces", Color), shared.ScenarioRPCData{
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
		drawUnitList := func() {
			// print("draw unit list, and theUnit is", TheUnit)
			tbody := doc.QuerySelector("#unitlist").(*dom.HTMLTableSectionElement)
			tbody.SetInnerHTML("")

			totalBayonets := 0
			totalSabres := 0
			totalGuns := 0
			totalCmdrs := 0

			for _, v := range force.Units {
				totalBayonets += v.Bayonets
				totalSabres += v.Sabres
				totalGuns += v.Guns
				if v.UType == 1 {
					totalCmdrs += 1
				}
				row := tbody.InsertRow(-1)
				row.SetClass("data-row")
				row.SetAttribute("key", fmt.Sprintf("%d", v.ID))
				cell := row.InsertCell(-1)
				cell.SetClass("compressed")
				if v.ID == TheUnit.ID {
					cell.Class().Add("highlight")
				}
				if v.UType == 1 {
					cell.Class().Add("commander")
					cell.SetInnerHTML(v.Name)
				} else {
					cell.SetInnerHTML("&nbsp;&nbsp;" + v.Name)
				}
				// cell.SetInnerHTML(v.Path)

				cell = row.InsertCell(-1)
				cell.SetClass("compressed")
				descr := ""
				switch v.UType {
				case 1:
					descr = v.CommanderName
					cell.Class().Add("commander")
				case 2, 3, 4, 5:
					descr = v.GetBases()
				}
				cell.SetInnerHTML(descr)
			}

			form.Get("Summary").
				SetInnerHTML(fmt.Sprintf("This Unit has a total of %d Commands, %d Bayonets, %d Sabres and %d Guns",
					totalCmdrs,
					totalBayonets,
					totalSabres,
					totalGuns))
		}

		drawUnitPanel := func() {
			// print("drawUnitPanel with TheUnit", TheUnit)
			switch TheUnit.UType {
			case 1: // Command
				swapper.Panels[1].Paint(&TheUnit)
				swapper.Select(1)
				form.FocusSelect("Cmd-Name")
			case 2: // Bde
				// print("paint panel 2")
				swapper.Panels[2].Paint(&TheUnit)
				swapper.Select(2)
				form.FocusSelect("Bde-Name")
			case 3: // Cav
				// print("paint panel 2")
				swapper.Panels[3].Paint(&TheUnit)
				swapper.Select(3)
				form.FocusSelect("Cav-Name")
			case 4: // Bty
				// print("paint panel 2")
				swapper.Panels[4].Paint(&TheUnit)
				swapper.Select(4)
				form.FocusSelect("Gun-Name")
			case 5: // Other
				// print("paint panel 2")
				swapper.Panels[5].Paint(&TheUnit)
				swapper.Select(5)
				form.FocusSelect("Other-Name")
			}
		}

		initUnitList := func() {
			// print("init unit list")
			div := form.Get("UnitList").(*dom.HTMLDivElement)
			div.SetInnerHTML("")
			table := doc.CreateElement("TABLE").(*dom.HTMLTableElement)
			table.Class().Add("data-table")
			tbody := doc.CreateElement("TBODY").(*dom.HTMLTableSectionElement)
			tbody.SetID("unitlist")
			table.AppendChild(tbody)
			div.AppendChild(table)
			drawUnitList()
		}

		clearUnit := func(u *shared.ForceUnit) {
			u.ID = 0
			u.Path = ""
			u.Name = ""
			u.CommanderName = ""
			u.Bayonets = 0
			u.Sabres = 0
			u.Guns = 0
			u.LtCoy = 0
			u.JgCoy = 0
		}

		deleteUnit := func() {
			go func() {
				newUnits := []shared.ForceUnit{}
				RPC("ScenarioRPC.DeleteUnit", shared.ForceUnitRPCData{
					Channel: Session.Channel,
					ID:      TheUnit.ID,
				}, &newUnits)
				force.Units = newUnits
				clearUnit(&TheUnit)
				swapper.Select(0)
				drawUnitList()
			}()
		}

		cloneUnit := func() {
			go func() {
				newUnits := []shared.ForceUnit{}
				RPC("ScenarioRPC.CloneUnit", shared.ForceUnitRPCData{
					Channel: Session.Channel,
					ID:      TheUnit.ID,
				}, &newUnits)
				force.Units = newUnits
				// Set the current unit to the newly copied unit
				searchPath := TheUnit.Path + "_Copy"
				for _, v := range force.Units {
					if v.Path == searchPath {
						TheUnit = v
						break
					}
				}
				drawUnitList()
				drawUnitPanel()
			}()
		}

		goUpOne := func() {
			for k, v := range force.Units {
				if v.ID == TheUnit.ID {
					if k > 0 {
						TheUnit = force.Units[k-1]
						drawUnitList()
						drawUnitPanel()
					}
					break
				}
			}
		}

		goDownOne := func() {
			for k, v := range force.Units {
				if v.ID == TheUnit.ID {
					if k < len(force.Units)-1 {
						TheUnit = force.Units[k+1]
						drawUnitList()
						drawUnitPanel()
					}
					break
				}
			}
		}

		// Dont use this anymore - always get a fresh set from the server
		// and dont try to maintain a synced version at this end

		// storeTheUnit := func() {
		// 	for k, v := range force.Units {
		// 		if v.ID == TheUnit.ID {
		// 			force.Units[k] = TheUnit
		// 			break
		// 		}
		// 	}
		// }

		initUnitList()
		// Change Event
		if canEdit {

			doc.QuerySelector("form").AddEventListener("change", false, func(evt dom.Event) {
				// print("form change event", evt)

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
						RPC("ScenarioRPC.UpdateForce", RPCdata, &force)
						// print("and got back data with id", force.ID, force)
						setActionGrid()
					}()
				} else {
					// Looks like one of the bottom parts has changed
					// print("bottom section has changed", swapper.Selected)
					// print("swapper.Selected", swapper.Selected, swapper)
					panel := swapper.Current()
					panel.Bind(&TheUnit)
					print("did a bind into ", TheUnit)
					// swapper.Panels[swapper.Selected].Bind(&TheUnit)
					TheUnit.UType = swapper.Selected
					if TheUnit.Name == "" {
						print("name is blank, so wont try to save this one")
					} else if TheUnit.UType > 0 {
						// print("save unit with ID", TheUnit.ID)
						go func() {
							newUnit := shared.ForceUnit{}
							err := RPC("ScenarioRPC.UpdateUnit", shared.ForceUnitRPCData{
								Channel:   Session.Channel,
								ID:        TheUnit.ID,
								ForceUnit: &TheUnit,
							}, &newUnit)
							if err != nil {
								dom.GetWindow().Alert(err.Error())
							} else {
								TheUnit = newUnit
							}

							// Have to fetch the whole tree again, as a change in this one
							// can have a ripple change in all the others
							newUnits := []shared.ForceUnit{}
							RPC("ScenarioRPC.GetForceUnits", shared.ScenarioRPCData{
								Channel: Session.Channel,
								ID:      force.ID,
							}, &newUnits)
							// print("got back a whole set of new units", newUnits)
							force.Units = newUnits
							drawUnitList()
						}()
					}
				}
			})
		}

		// Click on the list, fill in the panel
		form.OnEvent("UnitList", "click", func(evt dom.Event) {
			evt.PreventDefault()
			td := evt.Target()
			tr := td.ParentElement()
			// Fix the issue where the user clicked on some clickable element inside the row
			// which adds an extra level which we dont usually need
			if tr.TagName() == "TD" {
				tr = tr.ParentElement()
			}
			key, _ := strconv.Atoi(tr.GetAttribute("key"))
			// print("clik on unit with key", key)
			for _, v := range force.Units {
				if v.ID == key {
					// print("Got matching unit", v)
					TheUnit = v
					// print("here with new unit", v)
					drawUnitList()
					drawUnitPanel()
					break
				}
			}
		})

		// Put up down arrows on the name entry fields only, to nav to different units
		form.OnEvent("grid-4-1", "keydown", func(evt dom.Event) {
			kevent := evt.(*dom.KeyboardEvent)
			print("kevent is", kevent.KeyCode)
			if evt.Target().TagName() == "INPUT" {
				switch kevent.KeyCode {
				case 27:
					drawUnitPanel() // which restores the screen to the known record
				case 38:
					goUpOne()
				case 40:
					goDownOne()
				}
			}
		})

		// Add Buttons
		if canEdit {
			form.OnEvent("AddCommand", "click", func(evt dom.Event) {
				evt.PreventDefault()
				// print("Add Command")
				go func() {
					// add a blank Division to the end of the units array
					newUnit := shared.ForceUnit{}
					RPC("ScenarioRPC.AddCommand", shared.ScenarioRPCData{
						Channel: Session.Channel,
						ID:      force.ID,
					}, &newUnit)
					TheUnit = newUnit
					force.Units = append(force.Units, TheUnit)
					// print("theUnit now set to", TheUnit)
					drawUnitList()
					swapper.Panels[1].Paint(&TheUnit)
					swapper.Select(1)
					form.Focus("Cmd-Name")
				}()
			})
			form.OnEvent("Cmd-Delete", "click", func(evt dom.Event) {
				evt.PreventDefault()
				// if w.Confirm("Delete this Command ? ... includes all sub-units") {
				deleteUnit()
				// }
			})
			form.OnEvent("Cmd-Copy", "click", func(evt dom.Event) {
				evt.PreventDefault()
				cloneUnit()
			})
		}

		if canEdit {
			form.OnEvent("AddBde", "click", func(evt dom.Event) {
				evt.PreventDefault()
				// print("Add Brigade")
				go func() {
					// add a blank brigade to the units array
					newUnit := shared.ForceUnit{}
					RPC("ScenarioRPC.AddUnit", shared.ForceUnitRPCData{
						Channel:    Session.Channel,
						ID:         force.ID,
						UType:      2,
						ParentPath: TheUnit.Path,
					}, &newUnit)
					RPC("ScenarioRPC.GetForceUnits", shared.ScenarioRPCData{
						Channel: Session.Channel,
						ID:      force.ID,
					}, &force.Units)
					// print("theUnit now set to", TheUnit)
					TheUnit = newUnit
					drawUnitList()
					swapper.Panels[2].Paint(&TheUnit)
					swapper.Select(2)
					form.Focus("Bde-Name")
				}()
			})
			form.OnEvent("Bde-Delete", "click", func(evt dom.Event) {
				evt.PreventDefault()
				// if w.Confirm("Delete this Brigade ?") {
				deleteUnit()
				// }
			})
			form.OnEvent("Bde-Copy", "click", func(evt dom.Event) {
				evt.PreventDefault()
				cloneUnit()
			})
		}

		if canEdit {
			form.OnEvent("AddCav", "click", func(evt dom.Event) {
				evt.PreventDefault()
				// print("Add Cavalry")
				go func() {
					// add a blank brigade to the units array
					newUnit := shared.ForceUnit{}
					RPC("ScenarioRPC.AddUnit", shared.ForceUnitRPCData{
						Channel:    Session.Channel,
						ID:         force.ID,
						UType:      3,
						ParentPath: TheUnit.Path,
					}, &newUnit)
					// print("add unit returns ", newUnit)
					RPC("ScenarioRPC.GetForceUnits", shared.ScenarioRPCData{
						Channel: Session.Channel,
						ID:      force.ID,
					}, &force.Units)
					TheUnit = newUnit
					// print("theUnit now set to", TheUnit)
					drawUnitList()
					drawUnitPanel()
				}()

			})
			form.OnEvent("Cav-Delete", "click", func(evt dom.Event) {
				evt.PreventDefault()
				deleteUnit()
			})
			form.OnEvent("Cav-Copy", "click", func(evt dom.Event) {
				evt.PreventDefault()
				cloneUnit()
			})
		}

		if canEdit {
			doc.QuerySelector("[name=AddGun]").AddEventListener("click", false, func(evt dom.Event) {
				evt.PreventDefault()
				// print("Add Battery")
				go func() {
					// add a blank brigade to the units array
					newUnit := shared.ForceUnit{}
					RPC("ScenarioRPC.AddUnit", shared.ForceUnitRPCData{
						Channel:    Session.Channel,
						ID:         force.ID,
						UType:      4,
						ParentPath: TheUnit.Path,
					}, &newUnit)
					// print("add unit returns ", newUnit)
					RPC("ScenarioRPC.GetForceUnits", shared.ScenarioRPCData{
						Channel: Session.Channel,
						ID:      force.ID,
					}, &force.Units)
					TheUnit = newUnit
					// print("theUnit now set to", TheUnit)
					drawUnitList()
					swapper.Panels[4].Paint(&TheUnit)
					swapper.Select(4)
					doc.QuerySelector("[name=Gun-Name]").(*dom.HTMLInputElement).Focus()
				}()

			})
			doc.QuerySelector("[name=Gun-Delete]").AddEventListener("click", false, func(evt dom.Event) {
				evt.PreventDefault()
				go func() {
					// if w.Confirm("Delete this Artillery ?") {
					deleteUnit()
					// }
				}()

			})
			doc.QuerySelector("[name=Gun-Copy]").AddEventListener("click", false, func(evt dom.Event) {
				evt.PreventDefault()
				cloneUnit()
			})
		}

		if canEdit {
			doc.QuerySelector("[name=AddOther]").AddEventListener("click", false, func(evt dom.Event) {
				evt.PreventDefault()
				// print("Add Detachment")
				go func() {
					// add a blank brigade to the units array
					newUnit := shared.ForceUnit{}
					RPC("ScenarioRPC.AddUnit", shared.ForceUnitRPCData{
						Channel:    Session.Channel,
						ID:         force.ID,
						UType:      5,
						ParentPath: TheUnit.Path,
					}, &newUnit)
					// print("add unit returns ", newUnit)
					RPC("ScenarioRPC.GetForceUnits", shared.ScenarioRPCData{
						Channel: Session.Channel,
						ID:      force.ID,
					}, &force.Units)
					TheUnit = newUnit
					// print("theUnit now set to", TheUnit)
					drawUnitList()
					swapper.Panels[5].Paint(&TheUnit)
					swapper.Select(5)
					doc.QuerySelector("[name=Other-Name]").(*dom.HTMLInputElement).Focus()
				}()

			})
			doc.QuerySelector("[name=Other-Delete]").AddEventListener("click", false, func(evt dom.Event) {
				evt.PreventDefault()
				go func() {
					// if w.Confirm("Delete this Detachment ?") {
					deleteUnit()
					// }
				}()

			})
			doc.QuerySelector("[name=Other-Copy]").AddEventListener("click", false, func(evt dom.Event) {
				evt.PreventDefault()
				cloneUnit()
			})
		}

	}()

}

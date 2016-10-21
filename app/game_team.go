package main

import (
	"fmt"
	"strconv"

	"./shared"
	"github.com/go-humble/router"
	"github.com/steveoc64/formulate"
	"honnef.co/go/js/dom"
)

func gameEditTeam(context *router.Context) {
	id, err := strconv.Atoi(context.Params["id"])
	if err != nil {
		print(err.Error())
		return
	}
	team := context.Params["team"]

	go func() {
		w := dom.GetWindow()
		doc := w.Document()

		game := shared.Game{}
		RPC("GameRPC.Get", shared.GameRPCData{
			Channel:  Session.Channel,
			ID:       id,
			Red:      team == "Red",
			Blue:     team == "Blue",
			GetUnits: true,
		}, &game)
		print("game red", game)

		form := formulate.EditForm{}

		// Layout the fields

		form.New("fa-flag-o", fmt.Sprintf("%s Team Details - %s ", team, game.Name))

		form.Row(6).
			AddInput(5, fmt.Sprintf("%s Team", team), fmt.Sprintf("%sTeam", team)).
			AddDisplay(1, "# Players", fmt.Sprintf("Num%sPlayers", team))

		form.Row(1).
			AddTextarea(1, "Briefing", fmt.Sprintf("%sBrief", team))

		form.Row(1).
			AddCustom(1, "Commands", "Commands", "")

		form.Row(1).
			AddCustom(1, "", "ViewUnits", "")

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate(fmt.Sprintf("/game/%d", id))
		})

		form.SaveEvent(func(evt dom.Event) {
			evt.PreventDefault()
			form.Bind(&game)
			go func() {
				RPC("GameRPC.Update"+team, shared.GameRPCData{
					Channel: Session.Channel,
					ID:      id,
					Game:    &game,
				}, &game)
				// Session.Navigate("/games")
			}()
		})

		form.PrintEvent(func(evt dom.Event) {
			dom.GetWindow().Print()
		})

		// All done, so render the form
		form.Render("edit-form", "main", &game)
		form.ActionGrid("game-actions", "#action-grid", &game, func(url string) {
			// print("clicked on", url)
			Session.Navigate(url)
		})

		// Create the ViewUnits panel, and set to hidden
		viewUnits := form.Get("ViewUnits")
		loadTemplate("view-units", "[name=ViewUnits]", nil)
		viewUnits.Class().Add("hidden")

		TheCmd := &shared.GameCmd{}
		TheUnit := shared.Unit{}

		drawUnitList := func() {
			print("draw unit list, and theUnit is", TheUnit)
			viewUnits.Class().Remove("hidden")
			tbody := form.Get("UnitList").(*dom.HTMLTableSectionElement)
			tbody.SetInnerHTML("")

			totalBayonets := 0
			totalSabres := 0
			totalGuns := 0
			totalCmdrs := 0
			print("ranging over these units", TheCmd.Units)

			for _, v := range TheCmd.Units {
				totalBayonets += v.Bayonets
				totalSabres += v.Sabres
				totalGuns += v.Guns
				if v.UType == 1 {
					totalCmdrs += 1
				}
				row := tbody.InsertRow(-1)
				row.SetClass("data-row")
				row.SetAttribute("key", fmt.Sprintf("%d", v.ID))

				// Add the Unit name colunm
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

				// Add the Unit summary column
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

				// Add the Unit details column
				cell = row.InsertCell(-1)
				cell.SetClass("compressed")
				cell.SetInnerHTML(v.GetSitrep())

			}

			form.Get("Summary").
				SetInnerHTML(fmt.Sprintf("This Unit has a total of %d Commands, %d Bayonets, %d Sabres and %d Guns",
					totalCmdrs,
					totalBayonets,
					totalSabres,
					totalGuns))
		}

		// Add a button bar for all the commands in this team

		div := form.Get("Commands")
		div.SetInnerHTML("")
		bbar := doc.CreateElement("DIV")
		bbar.Class().Add("button-bar")
		theCmds := game.RedCmd
		if team == "Blue" {
			theCmds = game.BlueCmd
		}
		for _, v := range theCmds {
			btn := doc.CreateElement("INPUT").(*dom.HTMLInputElement)
			btn.Class().SetString("button button-outline")
			btn.Value = v.Name
			btn.SetAttribute("data-cmd-id", fmt.Sprintf("%d", v.ID))
			bbar.AppendChild(btn)

			btn.AddEventListener("click", false, func(evt dom.Event) {
				b := evt.Target()
				// reset all bbar buttons to outline mode
				for _, v := range bbar.QuerySelectorAll(".button") {
					v.Class().SetString("button button-outline")
				}
				b.Class().SetString("button button-primary")
				k, _ := strconv.Atoi(b.GetAttribute("data-cmd-id"))
				if k > 0 {
					print("clicked on red command ", k)
					TheCmd = game.GetCmd(team, k)
					print("cmd = ", TheCmd)
					drawUnitList()
				}
			})
		}
		div.AppendChild(bbar)

		showDisqus(fmt.Sprintf("game-%d", id), fmt.Sprintf("Game - %06d - %s", game.ID, game.Name))
	}()
}

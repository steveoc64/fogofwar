package main

import (
	"fmt"
	"math/rand"
	"strconv"

	"./shared"
	"honnef.co/go/js/dom"
)

func doOrders(game *shared.Game) {
	w := dom.GetWindow()
	doc := w.Document()
	c := doc.QuerySelector("[name=svg-console]")

	consoleSetViewBox(game, 100, 100, false)
	consolePhaseBusy(game)

	// Add a turn summary object
	g := c.QuerySelector("[name=g-main]")

	team := "blue"
	cmds := game.BlueCmd
	if game.Red {
		team = "red"
		cmds = game.RedCmd
	}

	// Create heading with Team Name
	html := svgText(0, 10, "text__2x text__"+team, "Corps Orders")

	yoffset := 0
	for _, v := range cmds {
		if v.PlayerID == Session.UserID {
			html += svgG(v.ID)
			c := "console-corps-button"
			if v.Deploying() {
				c = "console-corps-button-other"
			}
			html += svgButton(0, 18+(yoffset), 100, 10, c, "text__1x text__"+team, v.Name)
			html += svgText(98, 25+yoffset, "text__0x text__end text__"+team, v.CommandSummary())
			html += svgEndG()
			yoffset += 11
		}
	}
	html += svgG(100)
	html += `<rect x=0 y=88 rx=2 ry=2 width=100 height=12 class="carryon-button" data-id=100></rect>`
	html += "\n"
	html += svgText(50, 97, "text__carryon text__middle", "Orders Complete")
	html += svgEndG()
	g.SetInnerHTML(html)

	// add callbacks for each corps
	clickCorps := func(evt dom.Event) {
		el := evt.Target()
		id, _ := strconv.Atoi(el.GetAttribute("data-id"))
		print("clicked on corps", id, el.TagName())
		for _, v := range cmds {
			if v.ID == id {
				doCorpsOrders(game, v)
			}
		}
	}

	svgCallback(100, func(dom.Event) {
		print("all done")
		consolePhaseDone(game)
	})

	for _, v := range cmds {
		if v.PlayerID == Session.UserID {
			svgCallback(v.ID, clickCorps)
		}
	}
}

func doCorpsOrders(game *shared.Game, cmd *shared.GameCmd) {
	w := dom.GetWindow()
	doc := w.Document()
	c := doc.QuerySelector("[name=svg-console]")

	consoleSetViewBox(game, 100, 100, false)
	// Add a turn summary object
	g := c.QuerySelector("[name=g-main]")

	team := "blue"
	if game.Red {
		team = "red"
	}

	// Create heading with Team Name
	cs := cmd.CommandSummary()
	html := svgG(100)
	html += svgText(0, 10, "text__2x text__"+team, cmd.Name)
	if !cmd.PrepDefence && !cmd.Moving() && !cmd.Deploying() {
		cs = cs + ", and awaiting New Orders, Sir"
		html += svgText(98, 18, "text__end text__0x text__"+team, cs)
	} else {
		html += svgText(98, 18, "text__end text__1x text__"+team, cs)
	}

	yoffset := 20
	print("cmd", cmd)
	print("deploying", cmd.Deploying())

	if cmd.Deploying() {
		html += svgText(0, 30, "text__start text__hand", getSalutation(Salutations))
		html += svgText(50, 40, "text__middle text__hand", "I am currently indisposed at present")
		html += svgText(50, 50, "text__middle text__hand", "as the troops are busy deploying")
		html += svgText(50, 60, "text__middle text__hand", fmt.Sprintf("from %s to %s", cmd.CStateName(), cmd.DStateName()))
		html += svgText(90, 70, "text__end text__hand", "Regards,")
		html += svgText(90, 80, "text__end text__bighand", cmd.CommanderName)
		html += svgEndG()
	} else {
		html += svgEndG()
		print("moving", cmd.Moving())
		print("state", cmd.CState)
		if cmd.Moving() {
			// is moving and not deploying .. must be enroute to a new objective
			switch cmd.CState {
			case shared.CmdReserve:
				html += svgG(shared.CommandResumeMarch)
				html += svgButton(0, yoffset, 100, 10, "console-button", "text__1x text__"+team, "Resume March")
				html += svgEndG()
				yoffset += 11
				html += svgG(shared.CommandNewObjective)
				html += svgButton(0, yoffset, 100, 10, "console-button", "text__1x text__"+team, "March to New Objective")
				html += svgEndG()
				yoffset += 11
				html += svgG(shared.CommandBattleLine)
				html += svgButton(0, yoffset, 100, 10, "console-button", "text__1x text__"+team, "Deploy to Battle Line")
				html += svgEndG()
				yoffset += 11
			case shared.CmdMarchOrder:
				if !cmd.Wait {
					html += svgG(shared.CommandCarryOn)
					html += svgButton(0, yoffset, 100, 10, "console-button", "text__1x text__"+team, "Continue March ...")
					html += svgEndG()
					yoffset += 11
					html += svgG(shared.CommandHalt)
					html += svgButton(0, yoffset, 100, 10, "console-button", "text__1x text__"+team, "Halt & Await Further Orders ...")
					html += svgEndG()
					yoffset += 11
				} else {
					html += svgG(shared.CommandCarryOn)
					html += svgButton(0, yoffset, 100, 10, "console-button", "text__1x text__"+team, "Keep Waiting ...")
					html += svgEndG()
					yoffset += 11
					html += svgG(shared.CommandResumeMarch)
					html += svgButton(0, yoffset, 100, 10, "console-button", "text__1x text__"+team, "Resume March")
					html += svgEndG()
					yoffset += 11
					html += svgG(shared.CommandReserve)
					html += svgButton(0, yoffset, 100, 10, "console-button", "text__1x text__"+team, "Deploy to Reserve")
					html += svgEndG()
					yoffset += 11
				}
				html += svgG(shared.CommandNewObjective)
				html += svgButton(0, yoffset, 100, 10, "console-button", "text__1x text__"+team, "March to New Objective")
				html += svgEndG()
				yoffset += 11
				html += svgG(shared.CommandBattleLine)
				html += svgButton(0, yoffset, 100, 10, "console-button", "text__1x text__"+team, "Deploy to Battle Line")
				html += svgEndG()
				yoffset += 11
			}
		} else {
			// is not deploying and not moving .. can take any number of new orders
			switch cmd.CState {
			case shared.CmdReserve:
				html += svgG(shared.CommandCarryOn)
				html += svgButton(0, yoffset, 100, 10, "console-button", "text__1x text__"+team, "Continue ...")
				html += svgEndG()
				yoffset += 11
				html += svgG(shared.CommandNewObjective)
				html += svgButton(0, yoffset, 100, 10, "console-button", "text__1x text__"+team, "March to New Objective")
				html += svgEndG()
				yoffset += 11
				html += svgG(shared.CommandMarchOrder)
				html += svgButton(0, yoffset, 100, 10, "console-button", "text__1x text__"+team, "Deploy to March Order")
				html += svgEndG()
				yoffset += 11
				html += svgG(shared.CommandBattleLine)
				html += svgButton(0, yoffset, 100, 10, "console-button", "text__1x text__"+team, "Deploy to Battle Line")
				html += svgEndG()
				yoffset += 11
			case shared.CmdMarchOrder:
				html += svgG(shared.CommandCarryOn)
				html += svgButton(0, yoffset, 100, 10, "console-button", "text__1x text__"+team, "Await Further Orders ...")
				html += svgEndG()
				yoffset += 11
				html += svgG(shared.CommandNewObjective)
				html += svgButton(0, yoffset, 100, 10, "console-button", "text__1x text__"+team, "March to New Objective")
				html += svgEndG()
				yoffset += 11
				html += svgG(shared.CommandBattleLine)
				html += svgButton(0, yoffset, 100, 10, "console-button", "text__1x text__"+team, "Deploy to Battle Line")
				html += svgEndG()
				yoffset += 11
				html += svgG(shared.CommandReserve)
				html += svgButton(0, yoffset, 100, 10, "console-button", "text__1x text__"+team, "Reserve")
				html += svgEndG()
				yoffset += 11
			case shared.CmdBattleLine:
				html += svgG(shared.CommandCarryOn)
				if cmd.PrepDefence {
					html += svgButton(0, yoffset, 100, 10, "console-button", "text__1x text__"+team, "Continue Defence Preparations ...")
				} else {
					html += svgButton(0, yoffset, 100, 10, "console-button", "text__1x text__"+team, "Await Further Orders ...")
				}
				html += svgEndG()
				yoffset += 11

				html += svgG(shared.CommandAdvance)
				html += svgButton(0, yoffset, 100, 10, "console-button", "text__1x text__"+team, "General Advance in Line of Battle")
				html += svgEndG()
				yoffset += 11

				if !cmd.PrepDefence {
					html += svgG(shared.CommandPrepare)
					html += svgButton(0, yoffset, 100, 10, "console-button", "text__1x text__"+team, "Prepare Defensive Positions")
					html += svgEndG()
					yoffset += 11
				}
				html += svgG(shared.CommandMarchOrder)
				html += svgButton(0, yoffset, 100, 10, "console-button", "text__1x text__"+team, "Deploy to March Order")
				html += svgEndG()
				yoffset += 11
				html += svgG(shared.CommandReserve)
				html += svgButton(0, yoffset, 100, 10, "console-button", "text__1x text__"+team, "Reserve")
				html += svgEndG()
				yoffset += 11
			}
		}

	}

	g.SetInnerHTML(html)

	svgCallback(100, func(dom.Event) {
		doOrders(game)
	})
	svgCallback(shared.CommandCarryOn, func(dom.Event) {
		doOrders(game)
	})
	for i := 1; i < shared.NumCommands; i++ {
		svgCallback(i, func(evt dom.Event) {
			el := evt.Target()
			id, _ := strconv.Atoi(el.GetAttribute("data-id"))
			print("exec command", id, "on game cmd", cmd.ID)
			switch id {
			case shared.CommandNewObjective:
				doNewObjective(game, cmd)
			default:
				go func() {
					newCmd := shared.GameCmd{}
					err := RPC("GameRPC.CmdOrder", shared.CmdOrder{
						Channel: Session.Channel,
						ID:      cmd.ID,
						Command: id,
					}, &newCmd)
					if err != nil {
						dom.GetWindow().Alert(err.Error())
					} else {
						// We are done with this Corps, so
						// Reload console back to the Corps overview
						*cmd = newCmd
						doOrders(game)
					}
				}()
			}
		})
	}
}

func doNewObjective(game *shared.Game, cmd *shared.GameCmd) {
	w := dom.GetWindow()
	doc := w.Document()

	c := doc.QuerySelector("[name=svg-console]")
	g := c.QuerySelector("[name=g-main]")
	flipped := isFlipped(game)
	html := ""

	consoleSetViewBox(game, game.GridX*game.GridSize, game.GridY*game.GridSize, true)

	if game.GridSize > 0 {
		html += addBaseTiles(game)
		html += `<path id=unit-path stroke=yellow opacity=.3 fill=yellow stroke-width=1 marker-end=url(#end-circle)></path>`
		html += addObjectiveTiles(game)
		html += addUnitTiles(game, cmd.ID, "red", false, false)
		html += addUnitTiles(game, cmd.ID, "blue", false, false)
	}
	g.SetInnerHTML(html)
	if flipped {
		g.SetAttribute("transform", fmt.Sprintf("rotate(180 %d %d)", game.TableX*6, game.TableY*6))
	}
	scaleImages(game)

	// td := dom.GetWindow().Document().QuerySelector("#tile-details")
	// td.SetInnerHTML("Click on destination point for the March Order")
	// td.Class().Add("md-show")

	tileDetails := doc.QuerySelector("#tile-details")
	tileDetails.AddEventListener("click", false, func(evt dom.Event) {
		tileDetails.Class().Remove("md-show")
	})

	coord := func(i int) int {
		return (i * game.GridSize) + (game.GridSize / 2)
	}
	DX := cmd.DX
	DY := cmd.DY

	unitPath := doc.QuerySelector("#unit-path")
	unitPath.SetAttribute("d", fmt.Sprintf("M%d %d L%d %d", coord(cmd.CX), coord(cmd.CY), coord(DX), coord(DY)))

	handleMapClick := func(el *dom.BasicHTMLElement) {
		cl := el.Class()
		tag := el.TagName()
		doit := false
		if cl.Contains("tile-content-0-5") || cl.Contains("tile-content-0-6") || cl.Contains("tile-content-0-7") {
			// tileDetails.SetInnerHTML("Cannot set destination to a River Grid - try again")
			// tileDetails.Class().Add("md-show")
		} else {
			print("tag", tag)
			switch tag {
			case "text", "TEXT": // click on their name to reset it
				DX = cmd.CX
				DY = cmd.CY
				unitPath.SetAttribute("d", fmt.Sprintf("M%d %d L%d %d", coord(cmd.CX), coord(cmd.CY), coord(cmd.DX), coord(cmd.DY)))
				doit = true
			case "rect", "RECT":
				if cl.Contains("map-tile") {
					cmd.DX, _ = strconv.Atoi(el.GetAttribute("gx"))
					cmd.DY, _ = strconv.Atoi(el.GetAttribute("gy"))
					unitPath.SetAttribute("d", fmt.Sprintf("M%d %d L%d %d", coord(cmd.CX), coord(cmd.CY), coord(cmd.DX), coord(cmd.DY)))
				} else {
					print("clicked on a rect, but its not a map tile")
				}
				doit = true
			}
		}
		if doit {
			go func() {
				newCmd := &shared.GameCmd{}
				err := RPC("GameRPC.CmdOrder", shared.CmdOrder{
					Channel: Session.Channel,
					ID:      cmd.ID,
					Command: shared.CommandNewObjective,
					X:       cmd.DX,
					Y:       cmd.DY,
				}, &newCmd)
				if err != nil {
					println(err.Error())
				} else {
					*cmd = *newCmd
				}

			}()
		}
	}

	tileClicker = g.AddEventListener("click", false, func(evt dom.Event) {
		el := evt.Target()
		tag := el.TagName()

		print("clik on tile", tag)
		switch tag {
		case "rect", "RECT", "text", "TEXT":
			handleMapClick(el.(*dom.BasicHTMLElement))
		default:
			print("clicked on", tag)
		}
	})
}

var Salutations = []string{"With Apologies,",
	"Sir,",
	"Dear Friend,",
	"I must bring it to your attention,",
	"Take Note,",
	"Now Listen Here,",
	"I must inform you,",
	"Sacré Bleu,",
	"Le mot impossible n'est pas français,",
	"Avant!,",
	"Für Gott und Vaterland,",
	"God save the King,",
	"Vorwärts!,",
	"In the name of God,",
	"For Glory!,",
	"Not Again, surely ?,",
	"For Goodness Sakes,",
	"I must humbly Apologize,",
	"Not at this time,",
	"This cannot be Tolerated",
	"À chaque fou plaît sa marotte",
	"À mauvais ouvrier point de bon outil",
	"Charité bien ordonnée commence par soi-même",
	"Il n'y a que la foi que sauve",
	"Il n'y a point d'homme necessaire",
	"Il vaut mieux qu'on dise il court-là, qu'il gît ici",
}

func getSalutation(thing []string) string {
	v := rand.Intn(len(thing))
	return thing[v]
}

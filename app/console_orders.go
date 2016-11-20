package main

import (
	"fmt"
	"math/rand"
	"strconv"

	"./shared"
	"github.com/go-humble/router"
	"honnef.co/go/js/dom"
)

// func doOrders(game *shared.Game) {
func playOrders(context *router.Context) {
	gameID, _ := strconv.Atoi(context.Params["game"])

	if Session.Game == nil || Session.Game.ID != gameID {
		print("no game loaded")
		Session.Navigate(fmt.Sprintf("/play/%d", gameID))
		return
	}

	// Cant always access orders
	switch Session.Game.Phase {
	case shared.PhaseOrders:
		doPreGameOrders()
	default:
		// doCommanderAction()
		Session.Nav(fmt.Sprintf("/play/%d/commander", Session.Game.ID))
	}
	doPreGameOrders()
}

func doPreGameOrders() {
	w := dom.GetWindow()
	doc := w.Document()
	c := doc.QuerySelector("[name=svg-console]")
	xx := 100
	if Session.Orientation == "Landscape" {
		consoleSetViewBox(150, 100, false)
		xx = 150
	} else {
		consoleSetViewBox(100, 100, false)
	}
	consolePhaseBusy("Orders")

	// Add a turn summary object
	g := c.QuerySelector("[name=g-main]")

	team := "blue"
	cmds := Session.Game.BlueCmd
	if Session.Game.Red {
		team = "red"
		cmds = Session.Game.RedCmd
	}

	// Create heading with Team Name
	html := svgText(0, 10, "text__2x text__"+team, "Corps Orders")
	html += svgHelpBtn()

	yoffset := 0
	for _, v := range cmds {
		if v.PlayerID == Session.UserID {
			html += svgG(v.ID)
			c := "console-corps-button"
			if v.Deploying() {
				c = "console-corps-disabled"
			}
			html += svgButton(0, 18+(yoffset), xx, 10, c, "text__1x text__"+team, v.Name)
			html += svgText(xx-2, 25+yoffset, "text__0x text__end text__"+team, v.CommandSummary())
			html += svgEndG()
			yoffset += 11
		}
	}
	html += svgG(100)
	html += fmt.Sprintf(`<rect x=0 y=88 rx=2 ry=2 width=%d height=12 class="carryon-button" data-id=100></rect>`, xx)
	html += "\n"
	html += svgText(xx/2, 97, "text__carryon text__middle", "Orders Complete")
	html += svgEndG()
	g.SetInnerHTML(html)

	// add callbacks for each corps
	clickCorps := func(evt dom.Event) {
		el := evt.Target()
		id, _ := strconv.Atoi(el.GetAttribute("data-id"))
		print("clicked on corps", id, el.TagName())
		for _, v := range cmds {
			if v.ID == id && v.PlayerID == Session.UserID {
				Session.Cmd = v
				Session.Nav(fmt.Sprintf("/play/%d/orders/%d", Session.Game.ID, v.ID))
			}
		}
	}

	svgCallback(100, func(dom.Event) {
		// print("all done")
		consolePhaseNotBusy()
	})

	svgCallbackQuery("help", func(dom.Event) {
		loadTemplate("orders-help", "#unit-details", nil)
		doc.QuerySelector("#unit-details").Class().Add("md-show")
		doc.QuerySelector("[name=orders-help]").AddEventListener("click", false, func(evt dom.Event) {
			doc.QuerySelector("#unit-details").Class().Remove("md-show")
		})
	})

	for _, v := range cmds {
		if v.PlayerID == Session.UserID {
			svgCallback(v.ID, clickCorps)
		}
	}
}

// func doCorpsOrders(game *shared.Game, cmd *shared.GameCmd) {
func playOrdersCorps(context *router.Context) {
	gameID, _ := strconv.Atoi(context.Params["game"])
	corpsID, _ := strconv.Atoi(context.Params["corps"])

	if Session.Game == nil || Session.Game.ID != gameID {
		print("no game loaded")
		Session.Navigate(fmt.Sprintf("/play/%d", gameID))
		return
	}

	if Session.Cmd == nil || Session.Cmd.ID != corpsID {
		print("no corps loaded")
		Session.Nav(fmt.Sprintf("/play/%d/orders", Session.Game.ID))
	}

	w := dom.GetWindow()
	doc := w.Document()
	c := doc.QuerySelector("[name=svg-console]")

	xx := 100
	if Session.Orientation == "Landscape" {
		consoleSetViewBox(150, 100, false)
		xx = 150
	} else {
		consoleSetViewBox(100, 100, false)
	}
	// Add a turn summary object
	g := c.QuerySelector("[name=g-main]")

	team := "blue"
	if Session.Game.Red {
		team = "red"
	}

	// Create heading with Team Name
	cs := Session.Cmd.CommandSummary()
	html := svgG(100)
	html += svgText(0, 10, "text__2x text__"+team, Session.Cmd.Name)
	if !Session.Cmd.PrepDefence && !Session.Cmd.Moving() &&
		!Session.Cmd.Deploying() && Session.Cmd.CState != shared.CmdCompleteMarch {
		cs = cs + ", and awaiting New Orders, Sir"
		html += svgText(xx-2, 18, "text__end text__0x text__"+team, cs)
	} else {
		html += svgText(xx-2, 18, "text__end text__1x text__"+team, cs)
	}

	yoffset := 20
	// print("cmd", cmd)
	// print("deploying", cmd.Deploying())

	if Session.Cmd.Deploying() {
		html += svgText(xx/2-50, 30, "text__start text__hand", getSalutation(Salutations))
		html += svgText(xx/2, 40, "text__middle text__hand", "I am currently indisposed at")
		html += svgText(xx/2, 50, "text__middle text__hand", "present as the troops are busy")
		html += svgText(xx/2, 60, "text__middle text__hand", fmt.Sprintf("deploying to %s", Session.Cmd.DStateName()))
		html += svgText(xx-20, 70, "text__end text__hand", "Regards,")
		html += svgText(xx-20, 80, "text__end text__bighand", Session.Cmd.CommanderName)
		html += svgEndG()
	} else {
		html += svgEndG()
		// print("moving", cmd.Moving())
		// print("state", cmd.CState)
		if Session.Cmd.Moving() {
			// is moving and not deploying .. must be enroute to a new objective
			switch Session.Cmd.CState {
			case shared.CmdReserve:
				html += svgG(shared.CommandResumeMarch)
				html += svgButton(0, yoffset, xx, 10, "console-button", "text__1x text__"+team, "Resume March")
				html += svgEndG()
				yoffset += 11
				html += svgG(shared.CommandNewObjective)
				html += svgButton(0, yoffset, xx, 10, "console-button", "text__1x text__"+team, "March to New Objective")
				html += svgEndG()
				yoffset += 11
				html += svgG(shared.CommandBattleLine)
				html += svgButton(0, yoffset, xx, 10, "console-button", "text__1x text__"+team, "Deploy to Battle Line")
				html += svgEndG()
				yoffset += 11
			case shared.CmdMarchOrder:
				if !Session.Cmd.Wait {
					html += svgG(shared.CommandCarryOn)
					html += svgButton(0, yoffset, xx, 10, "console-button", "text__1x text__"+team, "Continue March ...")
					html += svgEndG()
					yoffset += 11
					html += svgG(shared.CommandHalt)
					html += svgButton(0, yoffset, xx, 10, "console-button", "text__1x text__"+team, "Halt & Await Further Orders ...")
					html += svgEndG()
					yoffset += 11
				} else {
					html += svgG(shared.CommandCarryOn)
					html += svgButton(0, yoffset, xx, 10, "console-button", "text__1x text__"+team, "Keep Waiting ...")
					html += svgEndG()
					yoffset += 11
					html += svgG(shared.CommandResumeMarch)
					html += svgButton(0, yoffset, xx, 10, "console-button", "text__1x text__"+team, "Resume March")
					html += svgEndG()
					yoffset += 11
					html += svgG(shared.CommandReserve)
					html += svgButton(0, yoffset, xx, 10, "console-button", "text__1x text__"+team, "Deploy to Reserve")
					html += svgEndG()
					yoffset += 11
				}
				html += svgG(shared.CommandNewObjective)
				html += svgButton(0, yoffset, xx, 10, "console-button", "text__1x text__"+team, "March to New Objective")
				html += svgEndG()
				yoffset += 11
				html += svgG(shared.CommandBattleLine)
				html += svgButton(0, yoffset, xx, 10, "console-button", "text__1x text__"+team, "Deploy to Battle Line")
				html += svgEndG()
				yoffset += 11
			}
		} else {
			// is not deploying and not moving .. can take any number of new orders
			// print("not moving, cstate is", cmd.CState)
			switch Session.Cmd.CState {
			case shared.CmdReserve:
				html += svgG(shared.CommandCarryOn)
				html += svgButton(0, yoffset, xx, 10, "console-button", "text__1x text__"+team, "Continue ...")
				html += svgEndG()
				yoffset += 11
				html += svgG(shared.CommandNewObjective)
				html += svgButton(0, yoffset, xx, 10, "console-button", "text__1x text__"+team, "March to New Objective")
				html += svgEndG()
				yoffset += 11
				html += svgG(shared.CommandMarchOrder)
				html += svgButton(0, yoffset, xx, 10, "console-button", "text__1x text__"+team, "Deploy to March Order")
				html += svgEndG()
				yoffset += 11
				html += svgG(shared.CommandBattleLine)
				html += svgButton(0, yoffset, xx, 10, "console-button", "text__1x text__"+team, "Deploy to Battle Line")
				html += svgEndG()
				yoffset += 11
			case shared.CmdMarchOrder, shared.CmdCompleteMarch:
				html += svgG(shared.CommandCarryOn)
				html += svgButton(0, yoffset, xx, 10, "console-button", "text__1x text__"+team, "Await Further Orders ...")
				html += svgEndG()
				yoffset += 11
				html += svgG(shared.CommandNewObjective)
				html += svgButton(0, yoffset, xx, 10, "console-button", "text__1x text__"+team, "March to New Objective")
				html += svgEndG()
				yoffset += 11
				html += svgG(shared.CommandBattleLine)
				html += svgButton(0, yoffset, xx, 10, "console-button", "text__1x text__"+team, "Deploy to Battle Line")
				html += svgEndG()
				yoffset += 11
				html += svgG(shared.CommandReserve)
				html += svgButton(0, yoffset, xx, 10, "console-button", "text__1x text__"+team, "Reserve")
				html += svgEndG()
				yoffset += 11
			case shared.CmdBattleLine:
				html += svgG(shared.CommandCarryOn)
				if Session.Cmd.PrepDefence {
					html += svgButton(0, yoffset, xx, 10, "console-button", "text__1x text__"+team, "Continue Defence Preparations ...")
				} else {
					html += svgButton(0, yoffset, xx, 10, "console-button", "text__1x text__"+team, "Await Further Orders ...")
				}
				html += svgEndG()
				yoffset += 11

				html += svgG(shared.CommandAdvance)
				html += svgButton(0, yoffset, xx, 10, "console-button", "text__1x text__"+team, "General Advance in Line of Battle")
				html += svgEndG()
				yoffset += 11

				if !Session.Cmd.PrepDefence {
					html += svgG(shared.CommandPrepare)
					html += svgButton(0, yoffset, xx, 10, "console-button", "text__1x text__"+team, "Prepare Defensive Positions")
					html += svgEndG()
					yoffset += 11
				}
				html += svgG(shared.CommandMarchOrder)
				html += svgButton(0, yoffset, xx, 10, "console-button", "text__1x text__"+team, "Deploy to March Order")
				html += svgEndG()
				yoffset += 11
				html += svgG(shared.CommandReserve)
				html += svgButton(0, yoffset, xx, 10, "console-button", "text__1x text__"+team, "Reserve")
				html += svgEndG()
				yoffset += 11
			case shared.CmdBattleAdvance:
				// print("not dep, not move, but have cmdadvance")
				html += svgG(shared.CommandCarryOn)
				html += svgButton(0, yoffset, xx, 10, "console-button", "text__1x text__"+team, "Continue Advance ...")
				html += svgEndG()
				yoffset += 11
				html += svgG(shared.CommandBattleLine)
				html += svgButton(0, yoffset, xx, 10, "console-button", "text__1x text__"+team, "Halt the General Advance")
				html += svgEndG()
				yoffset += 11
			}
		}

	}

	g.SetInnerHTML(html)

	svgCallback(100, func(dom.Event) {
		Session.Nav(fmt.Sprintf("/play/%d/orders", Session.Game.ID))
	})

	svgCallback(shared.CommandCarryOn, func(dom.Event) {
		Session.Nav(fmt.Sprintf("/play/%d/orders", Session.Game.ID))
	})

	for i := 1; i < shared.NumCommands; i++ {
		svgCallback(i, func(evt dom.Event) {
			el := evt.Target()
			id, _ := strconv.Atoi(el.GetAttribute("data-id"))
			// print("exec command", id, "on game cmd", cmd.ID)
			switch id {
			case shared.CommandNewObjective:
				doNewObjective(Session.Game, Session.Cmd)
			default:
				go func() {
					newCmd := &shared.GameCmd{}
					err := RPC("GameRPC.CmdOrder", shared.CmdOrder{
						Channel: Session.Channel,
						ID:      Session.Cmd.ID,
						Command: id,
					}, newCmd)
					if err != nil {
						dom.GetWindow().Alert(err.Error())
					} else {
						// We are done with this Corps, so
						// Reload console back to the Corps overview
						*Session.Cmd = *newCmd
						Session.Nav(fmt.Sprintf("/play/%d/orders", Session.Game.ID))
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

	consoleSetViewBox(Session.Game.GridX*Session.Game.GridSize, Session.Game.GridY*Session.Game.GridSize, true)

	if Session.Game.GridSize > 0 {
		html += addBaseTiles(Session.Game)
		html += `<path id=unit-path stroke=yellow opacity=.3 fill=yellow stroke-width=1 marker-end=url(#end-circle)></path>`
		html += addObjectiveTiles(Session.Game)
		html += addUnitTiles(Session.Game, Session.Cmd.ID, "red", false, false)
		html += addUnitTiles(Session.Game, Session.Cmd.ID, "blue", false, false)
	}
	g.SetInnerHTML(html)
	if flipped {
		g.SetAttribute("transform", fmt.Sprintf("rotate(180 %d %d)", Session.Game.TableX*6, Session.Game.TableY*6))
	}
	scaleImages(Session.Game)

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

	Session.TileClicker = g.AddEventListener("click", false, func(evt dom.Event) {
		el := evt.Target()
		tag := el.TagName()

		// print("clik on tile", tag)
		switch tag {
		case "rect", "RECT", "text", "TEXT":
			handleMapClick(el.(*dom.BasicHTMLElement))
		default:
			// print("clicked on", tag)
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

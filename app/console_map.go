package main

import (
	"fmt"
	"strconv"

	"./shared"
	"github.com/gopherjs/gopherjs/js"
	"honnef.co/go/js/dom"
)

func isFlipped(game *shared.Game) bool {
	flipped := false

	if game.Red {
		flipped = game.RedFlip
	} else {
		if game.Blue {
			flipped = game.BlueFlip
		}
	}
	return flipped
}

var tileClicker func(*js.Object)

func doMap(game *shared.Game) {
	w := dom.GetWindow()
	doc := w.Document()

	c := doc.QuerySelector("[name=svg-console]")
	g := c.QuerySelector("[name=g-main]")
	flipped := isFlipped(game)
	html := ""

	consolePhaseBusy(game, "Map")

	consoleSetViewBox(game, game.GridX*game.GridSize, game.GridY*game.GridSize, true)

	if game.GridSize > 0 {
		html += addBaseTiles(game)
		html += addObjectiveTiles(game)
		html += addUnitTiles(game, 0, "red", true, false)
		html += addUnitTiles(game, 0, "blue", true, false)

		g.SetInnerHTML(html)
		if flipped {
			g.SetAttribute("transform", fmt.Sprintf("rotate(180 %d %d)", game.TableX*6, game.TableY*6))
		}
		scaleImages(game)

		tileDetails := doc.QuerySelector("#tile-details")
		tileDetails.AddEventListener("click", false, func(evt dom.Event) {
			tileDetails.Class().Remove("md-show")
		})

		handleMapClick := func(el *dom.BasicHTMLElement) {
			cl := el.Class()
			html := ""
			if cl.Contains("tile-objective") || cl.Contains("objective-name") {
				obj, _ := strconv.Atoi(el.GetAttribute("data-id"))
				TheObjective := consoleGame.Objectives[obj]
				html = fmt.Sprintf("<b>Objective</b><br><i>%s</i><br>Victory Points ", TheObjective.Name)
				if consoleGame.Red {
					html += fmt.Sprintf("Red: %d + %d per turn<br>",
						TheObjective.RedVP, TheObjective.VPPerTurn)
				}
				if consoleGame.Blue {
					html += fmt.Sprintf("Blue: %d + %d per turn",
						TheObjective.BlueVP, TheObjective.VPPerTurn)
				}
				switch TheObjective.CurrentOwner {
				case 0:
					html += "<br>Status: Unclaimed"
				case -1:
					html += "<br><font color=red>Under RED Control</font>"
				case 1:
					html += "<br><font color=blue>Under BLUE Control</font>"
				}
			} else if cl.Contains("tile-blue") || cl.Contains("unitname-blue") {
				uid, _ := strconv.Atoi(el.GetAttribute("data-id"))
				// print("getting blue cmd", uid)
				cmd := consoleGame.GetCmd("Blue", uid)
				// print("cmd", cmd)
				// print("game", consoleGame)
				if cmd.IsEnemy(game) {
					html = fmt.Sprintf("<b>Enemy Player: %s</b><br><b>%s</b><br>Nation: %s<br>Commander: %s<br>%s<br>\n",
						cmd.PlayerName, cmd.Name, cmd.Nation, cmd.CommanderName, cmd.CommandSummary())
				} else {
					cmd.CalcTotals()
					html = fmt.Sprintf("<b>Friendly Player: %s</b><br><b>%s</b><br>Nation: %s<br>Commander: %s<br>%d Commands with:<br>%s<br>%s<br>\n",
						cmd.PlayerName, cmd.Name, cmd.Nation, cmd.CommanderName, cmd.Cmdrs, cmd.Summarize(), cmd.CommandSummary())
				}
			} else if cl.Contains("tile-red") || cl.Contains("unitname-red") {
				uid, _ := strconv.Atoi(el.GetAttribute("data-id"))
				// print("getting red cmd", uid)
				cmd := consoleGame.GetCmd("Red", uid)
				if cmd.IsEnemy(game) {
					html = fmt.Sprintf("<b>Enemy Player: %s</b><br><b>%s</b><br>Nation: %s<br>Commander: %s<br>%s<br>\n",
						cmd.PlayerName, cmd.Name, cmd.Nation, cmd.CommanderName, cmd.CommandSummary())
				} else {
					cmd.CalcTotals()
					html = fmt.Sprintf("<b>Friendly Player: %s</b><br><b>%s</b><br>Nation: %s<br>Commander: %s<br>%d Commands with:<br>%s<br>%s<br>\n",
						cmd.PlayerName, cmd.Name, cmd.Nation, cmd.CommanderName, cmd.Cmdrs, cmd.Summarize(), cmd.CommandSummary())
				}
			} else {
				html = ""
				if cl.Contains("tile-content-clear") {
					html = "<b>Clear Terrain</b><br>Full Movement<br>Good Cavalry Terrain<br>Good Effect for Artillery"
				}
				if cl.Contains("tile-content-0-1") {
					html = "<b>Rough Ground</b><br>Reduced Movement<br>Bad Cavalry Terrain<br>Bad Effect for Artillery"
				}
				if cl.Contains("tile-content-0-2") {
					html = "<b>Woods</b><br>Reduced Movement in Open Order only<br>Impassible for Cavalry<br>Bad Effect for Artillery"
				}
				if cl.Contains("tile-content-0-3") {
					html = "<b>Built Up Area</b><br>Reduced Movement<br>Good Cover for Defence<br>Cavalry March Column Only<br>Bad Effect for Artillery"
				}
				if cl.Contains("tile-content-0-4") {
					html = "<b>Fortified Position</b><br>Static Heavy Cover Defence Position<br>Cavalry of no use<br>Reduced Effect for Artillery"
				}
				if cl.Contains("tile-content-0-5") || cl.Contains("tile-content-0-6") || cl.Contains("tile-content-0-7") {
					html = "<b>River</b><br>Cannot Pass<br>Bad Effect for Artillery"
				}

				if cl.Contains("tile-content-1-0") {
					html = "<b>High Ground - Clear</b><br>Reduced Movement<br>Good Cavalry Terrain<br>Extended Range for Artillery"
				}
				if cl.Contains("tile-content-1-1") {
					html = "<b>High Ground - Rough</b><br>Slow Movement<br>Impassible for Cavalry<br>Bad Effect for Artillery"
				}
				if cl.Contains("tile-content-1-2") {
					html = "<b>High Ground - Woods</b><br>Very Difficult Going<br>Impassible for Cavalry<br>Safe from Artillery"
				}
				if cl.Contains("tile-content-1-3") {
					html = "<b>High Ground - Built Up Area</b><br>Reduced Movement<br>Cavalry March Column Only<br>Bad Effect for Artillery"
				}
				if cl.Contains("tile-content-1-4") {
					html = "<b>High Ground - Fortified Position</b><br>Very Strong Static Defence Position<br>Impassible for Cavalry<br>Tough work for Artillery"
				}

			}
			// print(html)

			td := dom.GetWindow().Document().QuerySelector("#tile-details")
			td.SetInnerHTML(html)
			td.Class().Add("md-show")
		}

		tileClicker = g.AddEventListener("click", false, func(evt dom.Event) {
			// print("clik on tile")
			el := evt.Target()
			tag := el.TagName()
			switch tag {
			case "rect", "RECT", "text", "TEXT":
				// print("clicked on a tile of class", el.GetAttribute("class"))
				handleMapClick(el.(*dom.BasicHTMLElement))
			default:
				print("clicked on", tag)
			}
		})
	}
}

func addBaseTiles(game *shared.Game) string {
	i := 0
	html := ""
	// print("tiles is", game.Tiles)
	if len(game.Tiles) > 0 {
		for y := 0; y < game.GridY; y++ {
			for x := 0; x < game.GridX; x++ {
				t := game.Tiles[i]
				if t == nil {
					print("aww snap - t is nil !!")
					break
				} else {
					html += fmt.Sprintf(`<rect x="%d" y="%d" width="%d" height="%d" class="map-tile %s" gx="%d" gy="%d" name="tile-%d-%d" data-index="%d"/>`,
						x*game.GridSize, y*game.GridSize, // x and y in inches
						game.GridSize, game.GridSize, // width and height in inches
						t.GetGameCSS(), // self-computed CSS content type
						x, y, x, y, i)  // coords in terms of grid position, and offset into the parent array
				}
				i++
			}
		}
	}
	return html
}

// add objective tiles on top !!
func addObjectiveTiles(game *shared.Game) string {
	flipped := isFlipped(game)
	html := ""
	for i, v := range game.Objectives {
		// print("gen svg for obj", v)

		ycoord := v.Y + 1
		if ycoord >= game.GridY {
			ycoord -= 2
		}
		if ycoord < 0 {
			ycoord = 0
		}
		xcoord := v.X*game.GridSize + (game.GridSize / 2)
		ycoord = ycoord*game.GridSize + (game.GridSize / 2)
		tt := ""
		tt1 := ""
		if flipped {
			tt1 = fmt.Sprintf("transform=\"rotate(180 %d %d)\"",
				v.X*game.GridSize, v.Y*game.GridSize)

			tt = fmt.Sprintf("transform=\"rotate(180 %d %d)\"",
				xcoord, ycoord)
		}

		html += fmt.Sprintf(`<rect %s x="%d" y="%d" width="%d" height="%d" class="map-tile %s" gx="%d" gy="%d" name="objective-%d" data-id="%d"/>`,
			tt1, v.X*game.GridSize, v.Y*game.GridSize, // x and y in inches
			game.GridSize, game.GridSize, // width and height in inches
			v.GetCSS(), // self-computed CSS content type
			v.X, v.Y, i, i)
		html += fmt.Sprintf(`<text %s x="%d" y="%d" class="objective-name" data-id="%d">%s</text>`,
			tt,
			xcoord, ycoord, i, v.Name)
	}
	return html
}

func scaleImages(game *shared.Game) {
	w := dom.GetWindow()
	doc := w.Document()

	gridInches := fmt.Sprintf("%d", game.GridSize)
	for _, v := range []string{"rough", "woods", "building", "fort", "river", "river1", "river2", "objective",
		"1-clear", "1-rough", "1-woods", "1-building", "1-fort"} {
		// print("rescale", v)
		el := doc.QuerySelector("#tile-" + v)
		el.SetAttribute("height", gridInches)
		el.SetAttribute("width", gridInches)
		el = doc.QuerySelector("#tile-" + v + "-img")
		el.SetAttribute("height", gridInches)
		el.SetAttribute("width", gridInches)
	}
}

func addUnitTiles(game *shared.Game, id int, team string, showAllUnits, showAllLabels bool) string {
	flipped := isFlipped(game)
	cmd := game.RedCmd
	if team == "blue" {
		cmd = game.BlueCmd
	}
	html := ""

	// print("computing map for", team, cmd)

	coord := func(i int) int {
		return (i * game.GridSize) + (game.GridSize / 2)
	}

	for i, v := range cmd {
		if v.CX != -1 && !v.Cull {
			if showAllUnits || v.ID == id {
				html += fmt.Sprintf(`<rect x="%d" y="%d" width="%d" height="%d" class="map-tile %s" gx="%d" gy="%d" name="red-%d" data-id="%d"/>`,
					v.CX*game.GridSize, v.CY*game.GridSize, // x and y in inches
					game.GridSize, game.GridSize, // width and height in inches
					v.GetCSS(), // self-computed CSS content type
					v.CX, v.CY, i, v.ID)
			}
			xcoord := v.CX*game.GridSize + 1
			ycoord := v.CY*game.GridSize + game.GridSize - 1
			tt := ""
			if flipped {
				tt = fmt.Sprintf("transform=\"rotate(180 %d %d)\"",
					v.CX*game.GridSize+game.GridSize/2,
					v.CY*game.GridSize+game.GridSize/2)
			}
			// only show the names of my own
			if id != 0 {
				if v.ID == id {
					html += fmt.Sprintf(`<text %s x="%d" y="%d" class="unitname-%s" data-id="%d">%s</text>`,
						tt, xcoord, ycoord,
						team,
						v.ID, v.Name)
				}
			} else {
				if showAllUnits && (showAllLabels || v.PlayerID == Session.UserID) {
					html += fmt.Sprintf(`<path d="M%d %d L%d %d" stroke=yellow opacity=.3 fill=yellow stroke-width=1 marker-end=url(#end-circle)></path>`,
						coord(v.CX), coord(v.CY), coord(v.DX), coord(v.DY))

					html += fmt.Sprintf(`<text %s x="%d" y="%d" class="unitname-%s" data-id="%d">%s</text>`,
						tt, xcoord, ycoord,
						team,
						v.ID, v.Name)

				}
			}
		}
	}
	return html
}

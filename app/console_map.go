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

	scaleImages := func() {
		gridInches := fmt.Sprintf("%d", game.GridSize)
		for _, v := range []string{"rough", "woods", "building", "fort", "river", "river1", "river2", "objective"} {
			// print("rescale", v)
			el := doc.QuerySelector("#tile-" + v)
			el.SetAttribute("height", gridInches)
			el.SetAttribute("width", gridInches)
			el = doc.QuerySelector("#tile-" + v + "-img")
			el.SetAttribute("height", gridInches)
			el.SetAttribute("width", gridInches)
		}
	}

	consoleSetViewBox(game, game.GridX*game.GridSize, game.GridY*game.GridSize, true)

	if game.GridSize > 0 {

		// // drop a single background rect for the satellite img fill
		// html += fmt.Sprintf(`<rect x=%d y=%d width=%d height=%d class=console-map-bg/>`,
		// 	0, 0, game.GridX*game.GridSize, game.GridY*game.GridSize)

		i := 0
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

		// add objective tiles on top !!
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
	}
	// add unit tiles on top
	team := "red"
	for i, v := range game.RedCmd {
		if v.StartX != -1 && !v.Cull {
			html += fmt.Sprintf(`<rect x="%d" y="%d" width="%d" height="%d" class="map-tile %s" gx="%d" gy="%d" name="red-%d" data-id="%d"/>`,
				v.StartX*game.GridSize, v.StartY*game.GridSize, // x and y in inches
				game.GridSize, game.GridSize, // width and height in inches
				v.GetCSS(), // self-computed CSS content type
				v.StartX, v.StartY, i, v.ID)
			xcoord := v.StartX*game.GridSize + 1
			ycoord := v.StartY*game.GridSize + game.GridSize - 1
			tt := ""
			if flipped {
				tt = fmt.Sprintf("transform=\"rotate(180 %d %d)\"",
					v.StartX*game.GridSize+game.GridSize/2,
					v.StartY*game.GridSize+game.GridSize/2)
			}
			// only show the names of my own
			if v.PlayerID == Session.UserID {
				html += fmt.Sprintf(`<text %s x="%d" y="%d" class="unitname-%s" data-id="%d">%s</text>`,
					tt, xcoord, ycoord,
					team,
					v.ID, v.Name)
			}
		}
	}
	team = "blue"
	for i, v := range game.BlueCmd {
		if v.StartX != -1 && !v.Cull {
			html += fmt.Sprintf(`<rect x="%d" y="%d" width="%d" height="%d" class="map-tile %s" gx="%d" gy="%d" name="blue-%d" data-id="%d"/>`,
				v.StartX*game.GridSize, v.StartY*game.GridSize, // x and y in inches
				game.GridSize, game.GridSize, // width and height in inches
				v.GetCSS(), // self-computed CSS content type
				v.StartX, v.StartY, i, v.ID)
			xcoord := v.StartX*game.GridSize + 1
			ycoord := v.StartY*game.GridSize + game.GridSize - 1
			tt := ""
			if flipped {
				tt = fmt.Sprintf("transform=\"rotate(180 %d %d)\"",
					v.StartX*game.GridSize+game.GridSize/2,
					v.StartY*game.GridSize+game.GridSize/2)
			}
			// only show the names of my own
			if v.PlayerID == Session.UserID {
				html += fmt.Sprintf(`<text %s x="%d" y="%d" class="unitname-%s" data-id="%d">%s</text>`,
					tt, xcoord, ycoord,
					team,
					v.ID, v.Name)
			}
		}

	}
	g.SetInnerHTML(html)
	if flipped {
		g.SetAttribute("transform", fmt.Sprintf("rotate(180 %d %d)", game.TableX*6, game.TableY*6))
	}
	scaleImages()

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
			print("getting blue cmd", uid)
			cmd := consoleGame.GetCmd("Blue", uid)
			cmd.CalcTotals()
			print("cmd", cmd)
			print("game", consoleGame)
			html = fmt.Sprintf("<b>Player: %s</b><br><b>%s</b><br>Nation: %s<br>Commander: %s<br>%d Commands with:<br>%s<br>\n",
				cmd.PlayerName, cmd.Name, cmd.Nation, cmd.CommanderName, cmd.Cmdrs, cmd.Summarize())
		} else if cl.Contains("tile-red") || cl.Contains("unitname-red") {
			uid, _ := strconv.Atoi(el.GetAttribute("data-id"))
			print("getting red cmd", uid)
			cmd := consoleGame.GetCmd("Red", uid)
			cmd.CalcTotals()
			html = fmt.Sprintf("<b>Player: %s</b><br><b>%s</b><br>Nation: %s<br>Commander: %s<br>%d Commands with:<br>%s<br>\n",
				cmd.PlayerName, cmd.Name, cmd.Nation, cmd.CommanderName, cmd.Cmdrs, cmd.Summarize())
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
		print(html)

		td := dom.GetWindow().Document().QuerySelector("#tile-details")
		td.SetInnerHTML(html)
		td.Class().Add("md-show")
	}

	tileClicker = g.AddEventListener("click", false, func(evt dom.Event) {
		print("clik on tile")
		el := evt.Target()
		tag := el.TagName()
		switch tag {
		case "rect", "RECT", "text", "TEXT":
			print("clicked on a tile of class", el.GetAttribute("class"))
			handleMapClick(el.(*dom.BasicHTMLElement))
		default:
			print("clicked on", tag)
		}
	})
}

package main

import (
	"fmt"

	"./shared"
	"honnef.co/go/js/dom"
)

func doNewFight(game *shared.Game) {
	w := dom.GetWindow()
	doc := w.Document()
	c := doc.QuerySelector("[name=svg-console]")
	html := ""
	xx := 100
	if Session.Orientation == "Landscape" {
		consoleSetViewBox(game, 150, 100, false)
		xx = 150
	} else {
		consoleSetViewBox(game, 100, 100, false)
	}
	consolePhaseBusy(game, "Units")

	// Add a turn summary object
	g := c.QuerySelector("[name=g-main]")

	team := "blue"
	if game.Red {
		team = "red"
	}

	html = svgText(4, 10, fmt.Sprintf("text__2x text__%s", team), "Create New Fight")

	html += svgText(5, 30, "text__2x text__"+team, "Name")

	html += `<rect class="console-corps-button" x=40 y=20 width=100 height=15></rect>`
	html += `<text id=fight-name xml:space="preserve" class="text__2x text__black" x=40 y=30></text>`
	html += fmt.Sprintf(`<image xlink:href=/img/fight.png x=%d y=0 height=15 width=50></image>`, xx-60)
	html += svgHelpBtn()

	html += svgG(100)
	html += fmt.Sprintf(`<rect x=0 y=88 rx=2 ry=2 width=%d height=12 class="carryon-button" data-id=100></rect>`, xx)
	html += "\n"
	html += svgText(xx/2, 97, "text__carryon text__middle", "Add")
	html += svgEndG()

	// Choose the type of terrain

	html += svgG(200)
	html += svgText(3, 50, "text__question", "Rough")
	html += `<rect class=console-check x=40 y=42 rx=2 ry=2 width=10 height=10 data-id=1></rect>`
	html += svgTick("rough", "tick hidden", 40, 42, 10)
	html += svgEndG()

	html += svgG(201)
	html += svgText(3, 60, "text__question", "Woods")
	html += `<rect class=console-check x=40 y=52 rx=2 ry=2 width=10 height=10 data-id=1></rect>`
	html += svgTick("woods", "tick hidden", 40, 52, 10)
	html += svgEndG()

	html += svgG(202)
	html += svgText(3, 70, "text__question", "Buildings")
	html += `<rect class=console-check x=40 y=62 rx=2 ry=2 width=10 height=10 data-id=1></rect>`
	html += svgTick("built", "tick hidden", 40, 62, 10)
	html += svgEndG()

	html += svgG(203)
	html += svgText(3, 80, "text__question", "Fort")
	html += `<rect class=console-check x=40 y=72 rx=2 ry=2 width=10 height=10 data-id=1></rect>`
	html += svgTick("fort", "tick hidden", 40, 72, 10)
	html += svgEndG()

	g.SetInnerHTML(html)

	entryField := doc.QuerySelector("#fight-name").(*dom.BasicHTMLElement)
	entryField.SetInnerHTML("")

	allDone := func() {
		w.RemoveEventListener("keydown", false, keyGrabber)
		keyGrabber = nil
		rough := !doc.QuerySelector("#rough").Class().Contains("hidden")
		woods := !doc.QuerySelector("#woods").Class().Contains("hidden")
		built := !doc.QuerySelector("#built").Class().Contains("hidden")
		fort := !doc.QuerySelector("#fort").Class().Contains("hidden")
		t := entryField.InnerHTML()
		go func() {
			done := false
			err := RPC("GameRPC.NewFight", shared.FightData{
				Channel: Session.Channel,
				Fight: &shared.Fight{
					GameID: game.ID,
					Name:   t,
					Rough:  rough,
					Woods:  woods,
					Built:  built,
					Fort:   fort,
				},
			}, &done)
			if err != nil {
				print(err.Error())
			} else {
				consolePhaseNotBusy(game)
			}
		}()
	}

	svgCallback(100, func(dom.Event) {
		allDone()
	})

	keyGrabber = w.AddEventListener("keydown", false, func(evt dom.Event) {
		k := evt.(*dom.KeyboardEvent)
		// print("global keypress", k.CharCode, k.Key, k.KeyCode)
		t := entryField.InnerHTML()
		switch k.KeyCode {
		case 8:
			t = t[:len(t)-1]
		case 46:
			t = ""
		case 32:
			t += " "
		case 13:
			allDone()
		default:
			if k.KeyCode >= 65 && k.KeyCode <= 90 {
				t = t + k.Key
			}
		}
		entryField.SetInnerHTML(t)
	})

	svgCallback(200, func(dom.Event) {
		el := doc.QuerySelector("#rough")
		if el != nil {
			el.Class().Toggle("hidden")
		}
	})
	svgCallback(201, func(dom.Event) {
		el := doc.QuerySelector("#woods")
		if el != nil {
			el.Class().Toggle("hidden")
		}
	})
	svgCallback(202, func(dom.Event) {
		el := doc.QuerySelector("#built")
		if el != nil {
			el.Class().Toggle("hidden")
		}
	})
	svgCallback(203, func(dom.Event) {
		el := doc.QuerySelector("#fort")
		if el != nil {
			el.Class().Toggle("hidden")
		}
	})

	svgCallbackQuery("#help", func(dom.Event) {
		loadTemplate("fight", "#unit-details", nil)
		doc.QuerySelector("#unit-details").Class().Add("md-show")
		doc.QuerySelector("[name=fight]").AddEventListener("click", false, func(evt dom.Event) {
			doc.QuerySelector("#unit-details").Class().Remove("md-show")
		})
	})

}

func doCommitFight(game *shared.Game) {

}

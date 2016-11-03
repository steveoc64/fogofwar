package main

import (
	"fmt"

	"./shared"
	"honnef.co/go/js/dom"
)

const SVG = "http://www.w3.org/2000/svg"

// const SVGStar = `<polygon xmlns="http://www.w3.org/2000/svg" fill="#fdff00" stroke="#605a00" stroke-width="15" points="150,25 179,111 269,111 197,165 223,251 150,200 77,251 103,165 31,111 121,111"/>`

func svgText(x, y, s int, team, text string) string {
	html := fmt.Sprintf(`<text x=%d y=%d class="console-text text__%s text__%dx">%s</text>"`, x, y, team, s, text)
	html += "\n"
	return html
}

func svgButton(dataID int, name string, x, y, w int, class, textClass, text string) string {
	html := ""

	html += fmt.Sprintf(`<rect name=%s-rect x=%d y=%d rx=2 ry=2 width=%d height=10 class=%s data-id=%d></rect>`,
		name, x, y, w, class, dataID)
	html += "\n"
	html += fmt.Sprintf(`<text name=%s-text x=%d y=%d class="console-text %s" data-id=%d>%s</text>`,
		name, x+3, y+8, textClass, dataID, text)
	html += "\n"
	return html
}

func paperButton(name, text string, x, y, w int, callback func(dom.Event)) string {
	html := ""

	html += fmt.Sprintf(`<rect name=%s-rect x=%d y=%d rx=2 ry=2 width=%d height=12 class=text__paper></rect>`,
		name, x, y, w)
	html += "\n"
	html += fmt.Sprintf(`<text name=%s-text x=%d y=%d class="console-text text__hand">%s</text>`,
		name, x+5, y+8, text)
	html += "\n"
	return html
}

func paperDoneButton(name, text string, x, y, w int) string {
	html := ""

	if Session.Orientation == "Portrait" {
		html += fmt.Sprintf(`<rect name=%s-rect x=%d y=%d rx=2 ry=2 width=%d height=12 class=text__done></rect>`,
			name, x, y, w)
		html += "\n"
		html += fmt.Sprintf(`<text name=%s-text x=%d y=%d class="console-text text__hand">%s</text>`,
			name, x+5, y+8, text)
		html += "\n"
	} else {
		html += fmt.Sprintf(`<rect name=%s-rect x=%d y=%d rx=2 ry=2 width=%d height=12 class=text__done></rect>`,
			name, x, y, w)
		html += "\n"
		html += fmt.Sprintf(`<text name=%s-text x=%d y=%d class="console-text text__hand">%s</text>`,
			name, x+5, y+8, text)
		html += "\n"
	}

	return html
}

func svgButtonCallback(name string, f func(dom.Event)) {
	w := dom.GetWindow()
	doc := w.Document()

	doc.QuerySelector(fmt.Sprintf("[name=%s-rect]", name)).AddEventListener("click", false, f)
	doc.QuerySelector(fmt.Sprintf("[name=%s-text]", name)).AddEventListener("click", false, f)
}

func paperButtonSet(evt dom.Event, text string) {
	el := evt.Target()
	tag := el.TagName()
	if tag == "rect" {
		el2 := el.NextElementSibling()
		if el2.TagName() == "text" {
			el2.SetInnerHTML(text)
			c := el.Class()
			c.Remove("text__paper")
			c.Add("text__done")
		}
	}
	if tag == "text" {
		el.SetInnerHTML(text)
		c := el.PreviousElementSibling().Class()
		c.Remove("text__paper")
		c.Add("text__done")
	}
}

func consoleSetViewBox(game *shared.Game, x, y int, MapMode bool) {
	w := dom.GetWindow()
	doc := w.Document()

	c := doc.QuerySelector("[name=svg-console]")
	g := c.QuerySelector("[name=g-main]")
	mr := c.QuerySelector("[name=map-rect]")

	g.RemoveAttribute("transform")
	g.SetInnerHTML("")
	// print("setting viewbox", x, y)
	c.SetAttribute("viewBox", fmt.Sprintf("0 0 %d %d", x, y))

	t := doc.QuerySelector(".console-title")
	if MapMode {
		t.Class().Add("console-map-title")
		t.SetInnerHTML(fmt.Sprintf("%d x %d ft Table with %d\" grids (%d x %d scale m)",
			game.TableX, game.TableY, game.GridSize, game.KmX, game.KmY))
		mr.SetAttribute("width", fmt.Sprintf("%d", x))
		mr.SetAttribute("height", fmt.Sprintf("%d", y))
		mr.Class().Remove("hidden")
	} else {
		t.Class().Remove("console-map-title")
		if Session.Orientation == "Landscape" || !Session.Mobile() {
			t.SetInnerHTML(fmt.Sprintf("%s, %d, Turn %d of %d",
				game.Name, game.Year, game.Turn, game.TurnLimit))
		} else {
			t.SetInnerHTML(fmt.Sprintf("%s, %d",
				game.Name, game.Year))
		}
		mr.Class().Add("hidden")
	}

}

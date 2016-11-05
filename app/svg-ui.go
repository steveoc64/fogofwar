package main

import (
	"fmt"

	"./shared"
	"honnef.co/go/js/dom"
)

const SVG = "http://www.w3.org/2000/svg"

// const SVGStar = `<polygon xmlns="http://www.w3.org/2000/svg" fill="#fdff00" stroke="#605a00" stroke-width="15" points="150,25 179,111 269,111 197,165 223,251 150,200 77,251 103,165 31,111 121,111"/>`

var svgID int

func svgG(id int) string {
	svgID = id
	return fmt.Sprintf("<g id=g-%d data-id=%d>", id, id)
}

func svgEndG() string {
	svgID = 0
	return "</g>\n"
}

func svgText(x, y int, class, text string) string {
	html := fmt.Sprintf(`<text data-id=%d x=%d y=%d class="%s">%s</text>"`,
		svgID, x, y, class, text)
	html += "\n"
	return html
}

func svgButton(x, y, w, h int, class, textClass, text string) string {
	html := ""

	html += fmt.Sprintf(`<rect x=%d y=%d rx=2 ry=2 width=%d height=%d class=%s data-id=%d></rect>`,
		x, y, w, h, class, svgID)
	html += "\n"
	html += fmt.Sprintf(`<text x=%d y=%d class="console-text %s" data-id=%d>%s</text>`,
		x+3, y+8, textClass, svgID, text)
	html += "\n"
	return html
}
func svgCallback(id int, f func(dom.Event)) {
	w := dom.GetWindow()
	doc := w.Document()

	el := doc.QuerySelector(fmt.Sprintf("#g-%d", id))
	if el != nil {
		el.AddEventListener("click", false, f)
	}
	// doc.QuerySelector(fmt.Sprintf("#g-%d", id)).AddEventListener("click", false, f)
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

	// print("remove tileclicker")
	g.RemoveEventListener("click", false, tileClicker)
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

	svgID = 0

}

// func paperButton(text string, x, y, w int, callback func(dom.Event)) string {
// 	html := ""

// 	html += fmt.Sprintf(`<rect data-id=%d x=%d y=%d rx=2 ry=2 width=%d height=12 class=text__paper></rect>`,
// 		svgID, x, y, w)
// 	html += "\n"
// 	html += fmt.Sprintf(`<text data-id=%d x=%d y=%d class="console-text text__hand">%s</text>`,
// 		svgID, x+5, y+8, text)
// 	html += "\n"
// 	return html
// }

// func paperDoneButton(text string, x, y, w int) string {
// 	html := ""

// 	if Session.Orientation == "Portrait" {
// 		html += fmt.Sprintf(`<rect data-id=%d x=%d y=%d rx=2 ry=2 width=%d height=12 class=text__done></rect>`,
// 			svgID, x, y, w)
// 		html += "\n"
// 		html += fmt.Sprintf(`<text data-id=%d x=%d y=%d class="console-text text__hand">%s</text>`,
// 			svgID, x+5, y+8, text)
// 		html += "\n"
// 	} else {
// 		html += fmt.Sprintf(`<rect data-id=%d x=%d y=%d rx=2 ry=2 width=%d height=12 class=text__done></rect>`,
// 			svgID, x, y, w)
// 		html += "\n"
// 		html += fmt.Sprintf(`<text data-id=%d x=%d y=%d class="console-text text__hand">%s</text>`,
// 			svgID, x+5, y+8, text)
// 		html += "\n"
// 	}

// 	return html
// }

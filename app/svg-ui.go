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

func svgHelpBtn() string {
	if Session.Orientation == "Landscape" {
		return `<g id=help><circle class=help-button cx=143 cy=5 r=5></circle><text x=140 y=9 class="text__gold text__2x">?</text></g>`
	}
	return `<g id=help><circle class=help-button cx=95 cy=5 r=5></circle><text x=92 y=9 class="text__gold text__2x">?</text></g>`
}

func svgText(x, y int, class, text string) string {
	html := fmt.Sprintf(`<text data-id=%d x=%d y=%d class="%s">%s</text>"`,
		svgID, x, y, class, text)
	html += "\n"
	return html
}

func svgButton(x, y, w, h int, class, textClass, text string) string {
	html := ""

	txty := y + h - 3
	if h < 8 {
		txty++
	}
	html += fmt.Sprintf(`<rect x=%d y=%d rx=2 ry=2 width=%d height=%d class=%s data-id=%d></rect>`,
		x, y, w, h, class, svgID)
	html += "\n"
	if text != "" {
		html += fmt.Sprintf(`<text x=%d y=%d class="console-text %s" data-id=%d>%s</text>`,
			x+3, txty, textClass, svgID, text)
		html += "\n"
	}
	return html
}

func svgCallback(id int, f func(dom.Event)) {
	el := dom.GetWindow().Document().QuerySelector(fmt.Sprintf("#g-%d", id))
	if el != nil {
		el.AddEventListener("click", false, f)
	}
	// doc.QuerySelector(fmt.Sprintf("#g-%d", id)).AddEventListener("click", false, f)
}

func svgCallbackQuery(id string, f func(dom.Event)) {
	el := dom.GetWindow().Document().QuerySelector(id)
	if el != nil {
		// print("adding eventlistner to the thing by name", id)
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

	if keyGrabber != nil {
		dom.GetWindow().RemoveEventListener("keypress", false, keyGrabber)
		keyGrabber = nil
	}

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

func svgTick(id, class string, x, y, w int) string {

	return fmt.Sprintf(`<g id=%s transform="translate(%d,%d) scale(%f)" class="%s">
<path d="M67.3594 347.3438 Q80.2969 317.8125 95.1328 290.8828 Q109.9688 263.9531 125.7188 241.1719 Q144.2812 214.4531 154.9688 202.6406 Q161.8594 195.0469 167.9062 190.125 Q171.4219 187.3125 179.0156 185.9062 Q197.4375 182.5312 204.75 182.5312 Q207.9844 182.5312 207.9844 184.7812 Q207.9844 186.8906 204.75 189.8438 Q176.625 214.875 145.7578 261.4219 Q114.8906 307.9688 93.6562 360.2812 Q85.6406 379.8281 82.4766 384.2578 Q79.3125 388.6875 62.7188 388.6875 Q51.8906 388.6875 49.1484 386.5781 Q46.4062 384.4688 39.2344 373.2188 Q26.8594 354.5156 12.6562 339.4688 Q5.2031 331.5938 5.2031 327.375 Q5.2031 321.4688 13.5 315.7734 Q21.7969 310.0781 27.1406 310.0781 Q34.5938 310.0781 45.0703 318.4453 Q55.5469 326.8125 67.3594 347.3438 Z" stroke="none"/>
</g>
`, id, x+1, y-6, float64(w)/250.0, class)
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

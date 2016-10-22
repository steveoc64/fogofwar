package main

import (
	"github.com/go-humble/router"
	"honnef.co/go/js/dom"
)

func tutorial(context *router.Context) {
	w := dom.GetWindow()
	doc := w.Document()

	loadTemplate("tutorial", "#faq", nil)
	doc.QuerySelector("#faq").Class().Remove("hidden")
}

func faq(context *router.Context) {
	w := dom.GetWindow()
	doc := w.Document()

	loadTemplate("faq", "#faq", nil)
	doc.QuerySelector(".pricing").Class().Toggle("hidden")
	doc.QuerySelector("#faq").Class().Toggle("hidden")
}

func manual(context *router.Context) {
	dom.GetWindow().Open("/manual", "actionfront-manual", "")
}

package main

import "github.com/go-humble/router"

func tutorial(context *router.Context) {
	print("in the tute function !")
	loadTemplate("tutorial", "#faq", nil)
}

func faq(context *router.Context) {
	print("in the faq functon")
	loadTemplate("faq", "#faq", nil)
}

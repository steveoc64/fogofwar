package main

import (
	"fmt"

	"github.com/steveoc64/fogofwar/shared"

	"github.com/go-humble/router"
	"honnef.co/go/js/dom"
)

func Login(username string, passwd string) {

	Session.Username = ""
	Session.Rank = 0

	lc := &shared.LoginCredentials{
		Username: username,
		Password: passwd,
		Channel:  Session.Channel,
	}
	// print("login params", lc)

	lr := &shared.LoginReply{}
	err := rpcClient.Call("LoginRPC.Login", lc, lr)
	if err != nil {
		print("RPC error", err.Error())
	}
	if lr.Result == "OK" {
		// createMenu(lr.Menu)
		Session.Username = lc.Username
		Session.Rank = lr.Rank
		Session.UserID = lr.ID
		loadRoutes(lr.Rank, lr.Routes)

		print("got a list of valid routes", lr.Routes)

		// Create the slideout menu once and for all
		// Get the users name and set the menu option to that
		loadTemplate("slidemenu", "#slidemenu-div", nil)
		myName := fmt.Sprintf(`%s %s`, Session.GetRank(), Session.Username)
		w := dom.GetWindow()
		doc := w.Document()
		doc.QuerySelector("#myname").SetTextContent(myName)
		doc.QuerySelector("#hamburger").Class().Remove("hidden")

		doc.QuerySelector("#myname").AddEventListener("click", false, func(evt dom.Event) {
			evt.PreventDefault()
			el := doc.QuerySelector("#slidemenu")
			el.Class().Remove("cbp-spmenu-open")
		})
		doc.QuerySelector("#menu-signout").AddEventListener("click", false, func(evt dom.Event) {
			evt.PreventDefault()
			if w.Confirm("Really Log Out ?") {
				Logout()
			}
		})

		// and go to the main route
		Session.Navigate("/")

	} else {
		print("login failed")
		dom.GetWindow().Alert("Login Failed")
	}
}

func Logout() {
	print("log out")
	// showLoginForm()
	initRouter() // reset all the routes to nothing
	// js.Global.Get("location").Set("hash", "")

	w := dom.GetWindow()
	doc := w.Document()
	loc := w.Location()
	print("loc=", loc)

	// loc.pathname =
	// js.Global.Get("location").Call("replace", "/")
	doc.GetElementByID("slidemenu-div").SetInnerHTML("")
	doc.GetElementByID("hamburger").Class().Add("hidden")
	doc.GetElementByID("signin-btn").Class().Remove("hidden")
	doc.GetElementByID("signin-mobile").Class().Remove("hidden")

	grid1()
}

func initForms() {
	w := dom.GetWindow()
	doc := w.Document()

	doc.QuerySelector("#signin-btn").AddEventListener("click", false, func(evt dom.Event) {
		evt.PreventDefault()
		loginForm()
	})

	doc.QuerySelector("#signin-mobile").AddEventListener("click", false, func(evt dom.Event) {
		evt.PreventDefault()
		loginForm()
	})

	doc.QuerySelector("#hamburger").AddEventListener("click", false, func(evt dom.Event) {
		print("clicked on hamburger")
		el := doc.QuerySelector("#slidemenu")
		print("el", el)
		el.Class().Add("cbp-spmenu-open")
	})
}

func loginForm() {
	w := dom.GetWindow()
	doc := w.Document()

	doc.QuerySelector("#signin-btn").Class().Add("hidden")
	doc.QuerySelector("#signin-mobile").Class().Add("hidden")
	doc.QuerySelector("#hamburger").Class().Add("hidden")
	loadTemplate("loginform", "main", nil)

	doc.QuerySelector("#l-loginbtn").AddEventListener("click", false, func(evt dom.Event) {
		print("clickd on loginbtn")
		evt.PreventDefault()
		username := doc.GetElementByID("l-username").(*dom.HTMLInputElement).Value
		passwd := doc.GetElementByID("l-passwd").(*dom.HTMLInputElement).Value
		print("doin the login thing")
		go Login(username, passwd)
	})

	doc.QuerySelector("#l-cancelbtn").AddEventListener("click", false, func(evt dom.Event) {
		evt.PreventDefault()
		grid1()
	})
}

func grid1() {
	loadTemplate("grid1", "main", nil)

	w := dom.GetWindow()
	doc := w.Document()

	el := doc.QuerySelector("#signin-btn")
	el.Class().Remove("hidden")
	el.AddEventListener("click", false, func(evt dom.Event) {
		evt.PreventDefault()
		loginForm()
	})

	el = doc.QuerySelector("#signin-mobile")
	el.Class().Remove("hidden")
	el.AddEventListener("click", false, func(evt dom.Event) {
		evt.PreventDefault()
		loginForm()
	})

	doc.QuerySelector("#main-tute").AddEventListener("click", false, func(evt dom.Event) {
		evt.PreventDefault()
		Session.Navigate("/tute")
	})

	doc.QuerySelector("#main-faq").AddEventListener("click", false, func(evt dom.Event) {
		evt.PreventDefault()
		Session.Navigate("/faq")
	})

	doc.QuerySelector("#main-signup").AddEventListener("click", false, func(evt dom.Event) {
		evt.PreventDefault()
		Session.Navigate("/signup")
	})
}

func signUp(context *router.Context) {
	print("in signup form")
}

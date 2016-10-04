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
		// print("login =", Session)
		print("loading routes", lr.Routes)
		loadRoutes(lr.Rank, lr.Routes)
		hideLoginForm()
		// GetPDFImage() // cache the PDF thumbnail

		// Get the users name and set the menu option to that
		myName := fmt.Sprintf(`%s %s`, Session.GetRank(), Session.Username)
		w := dom.GetWindow()
		doc := w.Document()
		doc.QuerySelector("#myname").SetTextContent(myName)

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
	doc.GetElementByID("slidemenu").Class().Remove("cbp-spmenu-open")
	doc.GetElementByID("hamburger").Class().Add("hidden")
	doc.GetElementByID("gotologin").Class().Remove("hidden")
	doc.GetElementByID("grid1").Class().Remove("hidden")
}

func hideLoginForm() {
	w := dom.GetWindow()
	doc := w.Document()
	doc.GetElementByID("loginform").Class().Add("hidden")
	doc.GetElementByID("hamburger").Class().Remove("hidden")
}

func showLoginForm() {
	w := dom.GetWindow()
	doc := w.Document()

	// Destroy whateven is in main
	doc.QuerySelector("main").SetInnerHTML("")

	// Activate the login form, with an outlined loginbtn, and get focus on the username
	loginBtn := doc.GetElementByID("l-loginbtn").(*dom.HTMLInputElement)
	loginBtn.Class().Remove("button-outline")

	doc.GetElementByID("loginform").Class().Remove("hidden")
	doc.GetElementByID("hamburger").Class().Add("hidden")
	doc.GetElementByID("grid1").Class().Add("hidden")
	uname := doc.GetElementByID("l-username").(*dom.HTMLInputElement)
	if uname.Value == "" {
		uname.Focus()
	}

	doc.GetElementByID("gotologin").Class().Add("hidden")
}

func initLoginForm() {
	w := dom.GetWindow()
	doc := w.Document()

	// Attach events once
	doc.QuerySelector("#l-loginbtn").AddEventListener("click", false, func(evt dom.Event) {
		evt.PreventDefault()
		username := doc.GetElementByID("l-username").(*dom.HTMLInputElement).Value
		passwd := doc.GetElementByID("l-passwd").(*dom.HTMLInputElement).Value
		go Login(username, passwd)
	})

	doc.QuerySelector("#l-cancelbtn").AddEventListener("click", false, func(evt dom.Event) {
		evt.PreventDefault()
		doc.GetElementByID("hamburger").Class().Add("hidden")
		doc.GetElementByID("gotologin").Class().Remove("hidden")
		doc.GetElementByID("grid1").Class().Remove("hidden")
		doc.GetElementByID("loginform").Class().Add("hidden")
	})

	// logoutBtn := doc.GetElementByID("logoutbtn").(*dom.HTMLButtonElement)
	// logoutBtn.AddEventListener("click", false, func(evt dom.Event) {
	// 	evt.PreventDefault()
	// 	Logout()
	// })

	// userBtn := doc.GetElementByID("userbtn").(*dom.HTMLButtonElement)
	// userBtn.AddEventListener("click", false, func(evt dom.Event) {
	// 	evt.PreventDefault()
	// 	userProfile()
	// })

	doc.QuerySelector("#homepage").AddEventListener("click", false, func(evt dom.Event) {
		Session.Navigate("/")
	})

	doc.QuerySelector("#hamburger").AddEventListener("click", false, func(evt dom.Event) {
		print("click on burger")
		el := doc.QuerySelector("#slidemenu")
		print("el", el)
		el.Class().Add("cbp-spmenu-open")
	})

	doc.QuerySelector("#myname").AddEventListener("click", false, func(evt dom.Event) {
		doc.QuerySelector("#slidemenu").Class().Remove("cbp-spmenu-open")
	})

	doc.QuerySelector("#gotologin").AddEventListener("click", false, func(evt dom.Event) {
		showLoginForm()
	})

	doc.QuerySelector("#menu-signout").AddEventListener("click", false, func(evt dom.Event) {
		print("logout")
		if w.Confirm("Really Sign Out ?") {
			Logout()
		}
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

	// clear the loader, setup the signin button
	doc.GetElementByID("loader").Class().Add("hidden")
	doc.GetElementByID("grid1").Class().Remove("hidden")
	doc.GetElementByID("gotologin").Class().Remove("hidden")
}

func signUp(context *router.Context) {
	print("in signup form")
}

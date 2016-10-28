package main

import (
	"errors"

	"./shared"

	"github.com/go-humble/router"
	"honnef.co/go/js/dom"
)

func fixLinks() {
	Session.Router.InterceptLinks()
}

// Load a template and attach it to the specified element in the doc
func loadTemplate(template string, selector string, data interface{}) error {
	w := dom.GetWindow()
	doc := w.Document()

	t, err := GetTemplate(template)
	if t == nil {
		print("Failed to load template", template)
		return errors.New("Invalid template")
	}
	if err != nil {
		print(err.Error())
		return err
	}

	el := doc.QuerySelector(selector)
	// print("loadtemplate", template, "into", selector, "=", el)
	if el == nil {
		print("Could not find selector", selector)
		return errors.New("Invalid selector")
	}
	// print("looks ok adding template", t, "to", el, "with", data)
	if err := t.ExecuteEl(el, data); err != nil {
		print(err.Error())
		return err
	}
	Session.Router.InterceptLinks()
	return nil
}

func enableRoutes(Rank int) {

	// print("enabling routes for rank", Rank, "session", Session, Session.GetRank())

	Session.AppFn = map[string]router.Handler{
		"mainpage":            mainPage,
		"settings":            userSettings,
		"usersonline":         usersOnline,
		"manual":              manual,
		"contact":             contactForm,
		"invite":              inviteFriend,
		"scenarios":           scenarioList,
		"scenario-add":        scenarioAdd,
		"scenario-fork":       scenarioFork,
		"scenario-edit":       scenarioEdit,
		"scenario-red":        scenarioRed,
		"scenario-red-add":    scenarioRedAdd,
		"scenario-blue":       scenarioBlue,
		"scenario-blue-add":   scenarioBlueAdd,
		"force-edit":          forceEdit,
		"game-invite":         gameInvite,
		"game-new":            gameNew,
		"game-edit-checklist": gameChecklist,
		"game-edit-overview":  gameEditOverview,
		"game-edit-red":       gameEditRed,
		"game-edit-blue":      gameEditBlue,
		"game-edit-table":     gameEditTable,
		"game-edit-players":   gameEditPlayers,
		"unit-inspection":     unitInspection,
	}
	switch Rank {
	case 10:
		more := map[string]router.Handler{
			"users":        userList,
			"user-edit":    userEdit,
			"users-online": usersOnline,
		}
		for k, v := range more {
			Session.AppFn[k] = v
		}
	}
	w := dom.GetWindow()
	doc := w.Document()

	if el := doc.QuerySelector("#show-image"); el != nil {
		// print("Adding click event for photo view")
		el.AddEventListener("click", false, func(evt dom.Event) {
			el.Class().Remove("md-show")
			// doc.QuerySelector("#show-image").Class().Remove("md-show")
		})
	}

	// RPC("UtilRPC.GetCmdLevels", Session.Channel, &CmdLevels)
	// // print("cmd_levels", CmdLevels)
	// RPC("UtilRPC.GetCmdRatings", Session.Channel, &CmdRatings)
	// // print("cmd_ratings", CmdRatings)
	// RPC("UtilRPC.GetInspirations", Session.Channel, &Inspirations)
	// // print("insp", Inspirations)
	// RPC("UtilRPC.GetConditions", Session.Channel, &Conditions)
	// // print("conditions", Conditions)
	// RPC("UtilRPC.GetRatings", Session.Channel, &UnitRatings)
	// print("ratings", UnitRatings)
	// RPC("UtilRPC.GetCavTypes", Session.Channel, &CavTypes)
	// print("cavtypes", CavTypes)
	// RPC("UtilRPC.GetGunnery", Session.Channel, &GunTypes)
	// print("gunnery", GunTypes)
	// RPC("UtilRPC.GetDrills", Session.Channel, &Drills)
	// print("drills", Drills)
	// RPC("UtilRPC.GetSmallArms", Session.Channel, &SmallArms)
	// print("arms", SmallArms)
}

func initRouter() {
	// print("initRouter")
	Session.Subscriptions = make(map[string]MessageFunction)
	Session.Context = nil
	Session.ID = make(map[string]int)

	// Include public routes
	Session.Router = router.New()
	Session.Router.ShouldInterceptLinks = true
	Session.Router.HandleFunc("/", defaultRoute)
	Session.Router.HandleFunc("/signup", signUp)
	Session.Router.HandleFunc("/signin", signIn)
	Session.Router.HandleFunc("/tute", tutorial)
	Session.Router.HandleFunc("/faq", faq)
	Session.Router.Start()

}

func defaultRoute(context *router.Context) {
	// print("Nav to Default Route")
}

func loadRoutes(Rank int, Routes []shared.UserRoute) {

	if Session.Router != nil {
		Session.Router.Stop()
	}
	Session.Router = router.New()
	Session.Router.ShouldInterceptLinks = true
	enableRoutes(Rank)

	for _, v := range Routes {
		// print("processing ", v.Route, v)
		if f, ok := Session.AppFn[v.Func]; ok {
			// print("found a function called", v.Func)
			// print("adding route", v.Route, v.Func)
			Session.Router.HandleFunc(v.Route, f)
		}
	}
	Session.Router.Start()
}

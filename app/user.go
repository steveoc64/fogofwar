package main

import (
	"strconv"

	"./shared"

	"github.com/go-humble/router"
	"github.com/steveoc64/formulate"
	"honnef.co/go/js/dom"
)

// Display a list of users
func userList(context *router.Context) {

	go func() {
		users := []shared.User{}
		rpcClient.Call("UserRPC.ListOnline", shared.UserRPCData{
			Channel: Session.Channel,
		}, &users)

		form := formulate.ListForm{}
		form.New("fa-user", "Users Online")

		// Define the layout
		form.Column("Channel", "Channel")
		form.Column("Rank", "GetRank")
		form.Column("Username", "Username")
		form.Column("Country", "Country")
		form.Column("IP", "IPAddress")
		form.Column("Ch", "Channel")
		// form.Column("Name", "Name")
		form.Column("Email", "Email")
		form.Column("Scenarios", "NumScenarios")
		form.Column("Games", "NumGames")
		// form.Column("Bloglink", "Bloglink")
		// form.DateColumn("Created", "Created")
		form.DateColumn("Expires", "Expires")

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate("/")
		})

		form.NewRowEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate("/user/add")
		})

		form.RowEvent(func(key string) {
			Session.Navigate("/user/" + key)
		})

		form.Render("onlineuser-list", "main", users)

		rpcClient.Call("UserRPC.ListOffline", shared.UserRPCData{
			Channel: Session.Channel,
		}, &users)

		formOffline := formulate.ListForm{}
		formOffline.New("fa-user", "Users Offline")

		// Define the layout
		formOffline.Column("Rank", "GetRank")
		formOffline.Column("Username", "Username")
		formOffline.Column("Country", "Country")
		formOffline.Column("LastIP", "IPAddress")
		formOffline.Column("Name", "Name")
		formOffline.Column("Email", "Email")
		formOffline.Column("Scenarios", "NumScenarios")
		formOffline.Column("Games", "NumGames")
		// form.Column("Bloglink", "Bloglink")
		// formOffline.DateColumn("Created", "Created")
		formOffline.DateColumn("Expires", "Expires")

		// Add event handlers
		formOffline.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate("/")
		})

		formOffline.RowEvent(func(key string) {
			Session.Navigate("/user/" + key)
		})

		w := dom.GetWindow()
		doc := w.Document()
		div := doc.CreateElement("div").(*dom.HTMLDivElement)
		div.SetID("offlineusers")
		doc.QuerySelector("main").AppendChild(div)
		formOffline.Render("offlineuser-list", "#offlineusers", users)

	}()

}

// Edit an existing user
func userEdit(context *router.Context) {
	id, err := strconv.Atoi(context.Params["id"])
	if err != nil {
		print(err.Error())
		return
	}

	ranks := shared.GetRanks()

	go func() {
		user := shared.User{}
		rpcClient.Call("UserRPC.Get", shared.UserRPCData{
			Channel: Session.Channel,
			ID:      id,
		}, &user)

		form := formulate.EditForm{}
		form.New("fa-user", "User Details - "+user.Name)

		// Layout the fields

		form.Row(3).
			AddSelect(1, "Rank", "Rank", ranks, "ID", "Name", 1, user.Rank).
			AddInput(1, "Username", "Username").
			AddInput(1, "Password", "Passwd")

		form.Row(5).
			AddInput(2, "Name", "Name").
			AddInput(2, "Email", "Email").
			AddInput(1, "Country", "Country")

		form.Row(2).
			AddDate(1, "Account Created", "Created").
			AddDate(1, "Commission Expires", "Expires")

		form.Row(9).
			AddInput(5, "Blog Link", "Bloglink").
			AddCheck(1, "Disqus", "Disqus").
			AddCheck(1, "Banned", "Banned").
			AddDisplay(1, "Channel", "Channel").
			AddDisplay(1, "IP", "IPAddress")

		if user.Channel != 0 {
			form.Row(1).
				AddCustom(1, "Activity", "Activity", "")
		}

		form.Row(1).
			AddTextarea(1, "Notes", "Notes")

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate("/users")
		})

		form.DeleteEvent(func(evt dom.Event) {
			evt.PreventDefault()
			go func() {
				data := shared.UserRPCData{
					Channel: Session.Channel,
					User:    &user,
				}
				done := false
				rpcClient.Call("UserRPC.Delete", data, &done)
				Session.Navigate("/users")
			}()
		})

		form.SaveEvent(func(evt dom.Event) {
			evt.PreventDefault()
			form.Bind(&user)

			data := shared.UserRPCData{
				Channel: Session.Channel,
				ID:      user.ID,
				User:    &user,
			}
			go func() {
				rpcClient.Call("UserRPC.Update", data, &user)
				Session.Navigate("/users")
			}()
		})

		// All done, so render the form
		form.Render("edit-form", "main", &user)

		w := dom.GetWindow()
		doc := w.Document()

		if user.Channel != 0 {
			doc.QuerySelector("[name=Activity]").SetInnerHTML("")
		}

		// Add a list of logins for this user
		l := []shared.Login{}
		rpcClient.Call("LoginRPC.ListByUser", shared.LoginRPCData{
			Channel: Session.Channel,
			ID:      user.ID,
		}, &l)

		lList := formulate.ListForm{}
		lList.New("fa-signin", "Last Dozen Sign-Ins")

		// Define the layout
		lList.DateColumn("Date", "Date")
		lList.Column("IP Address", "IPAddress")

		div := doc.CreateElement("div").(*dom.HTMLDivElement)
		div.SetID("userlogin-list")
		doc.QuerySelector("main").AppendChild(div)
		lList.Render("userlogin-list", "#userlogin-list", l)

		// Add a list of scenarios for this user
		s := []shared.Scenario{}
		rpcClient.Call("ScenarioRPC.ListByUser", shared.ScenarioRPCData{
			Channel: Session.Channel,
			ID:      user.ID,
		}, &s)

		sList := formulate.ListForm{}
		sList.New("fa-sitemap", "Scenarios")

		// Define the layout
		sList.Column("ID", "ID")
		sList.Column("Name", "Name")
		sList.Column("Year", "Year")
		sList.Column("Description", "Descr")

		sList.RowEvent(func(key string) {
			Session.Navigate("/scenario/" + key)
		})

		div = doc.CreateElement("div").(*dom.HTMLDivElement)
		div.SetID("userscen-list")
		doc.QuerySelector("main").AppendChild(div)
		sList.Render("userscen-list", "#userscen-list", s)

		// Add a list of games for this user
		g := []shared.Game{}
		rpcClient.Call("GameRPC.ListByUser", shared.GameRPCData{
			Channel: Session.Channel,
			ID:      user.ID,
		}, &g)

		gList := formulate.ListForm{}
		gList.New("fa-bookmark", "Games")

		// Define the layout
		gList.Column("ID", "ID")
		gList.Column("Based on Scenario", "ScenName")
		gList.Column("Turn", "GetTurn")
		gList.Column("Year", "Year")
		gList.Column("Description", "Descr")
		gList.DateColumn("Created", "Created")
		gList.DateColumn("Expires", "Expires")
		gList.RowEvent(func(key string) {
			Session.Navigate("/game/" + key)
		})

		div = doc.CreateElement("div").(*dom.HTMLDivElement)
		div.SetID("usergame-list")
		doc.QuerySelector("main").AppendChild(div)
		gList.Render("usergame-list", "#usergame-list", g)
	}()

}

// Add form for a new user
func userAdd(context *router.Context) {

	ranks := shared.GetRanks()

	go func() {
		user := shared.User{}

		form := formulate.EditForm{}
		form.New("fa-user", "Add New User")

		// Layout the fields

		form.Row(2).
			Add(1, "Username", "text", "Username", `id="focusme"`).
			Add(1, "Password", "text", "Passwd", `id="focusme"`)

		form.Row(3).
			Add(1, "Name", "text", "Name", "").
			Add(1, "Email", "text", "Email", "")

		form.Row(3).
			Add(1, "Rank", "select", "Rank", "")

		form.SetSelectOptions("Rank", ranks, "ID", "Name", 1, 0)

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate("/users")
		})

		form.SaveEvent(func(evt dom.Event) {
			evt.PreventDefault()
			form.Bind(&user)
			data := shared.UserRPCData{
				Channel: Session.Channel,
				User:    &user,
			}
			go func() {
				newID := 0
				rpcClient.Call("UserRPC.Insert", data, &newID)
				print("added user", newID)
				Session.Navigate("/users")
			}()
		})

		// All done, so render the form
		form.Render("edit-form", "main", &user)

	}()

}

func usersOnline(context *router.Context) {
	Session.Subscribe("login", _usersOnline)
	Session.Subscribe("nav", _usersOnline)
	go _usersOnline("show", 1)
}

func _usersOnline(action string, id int) {

	users := []shared.UserOnline{}
	rpcClient.Call("LoginRPC.UsersOnline", Session.Channel, &users)
	print("got users", users)

	form := formulate.ListForm{}
	form.New("fa-user", "Users List - All Users")

	// Define the layout

	form.Column("Channel", "Channel")
	form.Column("Username", "Username")
	form.Column("Route", "Route")
	form.Column("IP Addr", "IP")
	form.Column("Browser", "Browser")
	form.Column("Duration", "Duration")
	form.Column("Name", "Name")
	form.Column("Email", "Email")
	form.Column("Mobile", "SMS")
	form.Column("Role", "Role")
	form.BoolColumn("Tech ?", "IsTech")
	form.BoolColumn("Alloc ?", "CanAllocate")

	// Add event handlers
	form.CancelEvent(func(evt dom.Event) {
		evt.PreventDefault()
		Session.Navigate("/")
	})

	form.PrintEvent(func(evt dom.Event) {
		dom.GetWindow().Print()
	})

	form.RowEvent(func(key string) {
		Session.Navigate("/useronline/" + key)
	})

	form.Render("useronline", "main", users)

}

func userSettings(context *router.Context) {
	print("TODO - userSettings")
}

func name() {

}

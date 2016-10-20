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
	Session.Subscribe("User", _userList, context)
	Session.Subscribe("Login", _userList, context)
	_userList("Users", 0, context)
}

func _userList(action string, id int, context *router.Context) {

	go func() {
		users := []shared.User{}
		RPC("UserRPC.ListOnline", shared.UserRPCData{
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
		form.EmailAvatarColumn("Email", "Email")
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

		// Add a list of logins for this user
		l := []shared.Login{}
		RPC("LoginRPC.ListLast", shared.LoginRPCData{
			Channel: Session.Channel,
		}, &l)

		lList := formulate.ListForm{}
		lList.New("fa-signin", "Last Couple Dozen Sign-Ins")

		// Define the layout
		lList.DateColumn("Date", "Date")
		lList.Column("Username", "Username")
		lList.Column("Email", "Email")
		lList.Column("IP Address", "IPAddress")
		lList.Column("Country", "Country")

		formulate.AppendDiv("lastlogin-list")
		lList.Render("lastlogin-list", "#lastlogin-list", l)

		RPC("UserRPC.ListOffline", shared.UserRPCData{
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
		formOffline.EmailAvatarColumn("Email", "Email")
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

		formulate.AppendDiv("offline-users")
		formOffline.Render("offlineuser-list", "#offline-users", users)

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
		RPC("UserRPC.Get", shared.UserRPCData{
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

		form.Row(9).
			AddInput(3, "Blog Link", "Bloglink").
			AddCheck(1, "Disqus", "Disqus").
			AddCheck(1, "Banned", "Banned").
			AddDisplay(1, "Channel", "Channel").
			AddDisplay(1, "IP", "IPAddress")

		form.Row(2).
			AddDate(1, "Account Created", "Created").
			AddDate(1, "Commission Expires", "Expires")

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
				RPC("UserRPC.Delete", data, &done)
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
				RPC("UserRPC.Update", data, &user)
				Session.Navigate("/users")
			}()
		})

		// All done, so render the form
		form.Render("edit-form", "main", &user)

		if user.Channel != 0 {
			form.Get("Activity").SetInnerHTML("")
		}

		// Add a list of logins for this user
		l := []shared.Login{}
		RPC("LoginRPC.ListByUser", shared.LoginRPCData{
			Channel: Session.Channel,
			ID:      user.ID,
		}, &l)

		lList := formulate.ListForm{}
		lList.New("fa-signin", "Last Dozen Sign-Ins")

		// Define the layout
		lList.DateColumn("Date", "Date")
		lList.Column("IP Address", "IPAddress")

		formulate.AppendDiv("userlogin-list")
		lList.Render("userlogin-list", "#userlogin-list", l)

		// Add a list of scenarios for this user
		s := []shared.Scenario{}
		RPC("ScenarioRPC.ListByUser", shared.ScenarioRPCData{
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

		formulate.AppendDiv("userscen-list")
		sList.Render("userscen-list", "#userscen-list", s)

		// Add a list of games for this user
		g := []shared.Game{}
		RPC("GameRPC.ListByUser", shared.GameRPCData{
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
		gList.DateColumn("Starts", "StartDate")
		gList.RowEvent(func(key string) {
			Session.Navigate("/game/" + key)
		})

		formulate.AppendDiv("usergame-list")
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
				RPC("UserRPC.Insert", data, &newID)
				print("added user", newID)
				Session.Navigate("/users")
			}()
		})

		// All done, so render the form
		form.Render("edit-form", "main", &user)

	}()

}

func usersOnline(context *router.Context) {
	Session.Subscribe("login", _usersOnline, context)
	Session.Subscribe("nav", _usersOnline, context)
	go _usersOnline("show", 1, context)
}

func _usersOnline(action string, id int, context *router.Context) {

	users := []shared.UserOnline{}
	RPC("LoginRPC.UsersOnline", Session.Channel, &users)
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
	form.EmailAvatarColumn("Email", "Email")
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

	go func() {
		user := shared.User{}
		RPC("UserRPC.Me", Session.Channel, &user)
		form := formulate.EditForm{}

		// Layout the fields

		// title := fmt.Sprintf("Account Settings - %s <img src=https://www.gravatar.com/avatar/%s>",
		// 	user.Username, "205e460b479e2e5b48aec07710c08d50")

		form.New("fa-cog", "Account Settings - "+user.Username)

		// 	Username     string     `db:"username"`
		// 	Name         string     `db:"name"`
		// 	Passwd       string     `db:"passwd"`
		// 	Email        string     `db:"email"`
		// 	Rank         int        `db:"rank"`
		// 	Notes        string     `db:"notes"`
		// 	Country      string     `db:"country"`
		// 	Bloglink     string     `db:"bloglink"`
		// 	Channel      int        `db:"channel"`
		// 	IPAddress    string     `db:"ip_address"`
		// 	Created      *time.Time `db:"created"`
		// 	Expires      *time.Time `db:"expires"`
		// 	Banned       bool       `db:"banned"`
		// 	Disqus       bool       `db:"disqus"`
		// 	Newsletter   bool       `db:"newsletter"`
		// 	NumScenarios int        `db:"num_scenarios"`
		// 	NumGames     int        `db:"num_games"`
		// }

		form.Row(4).
			AddInput(2, "Full Name", "Name").
			AddDisplay(1, "Username", "Username").
			AddInput(1, "Country", "Country")

		form.Row(4).
			AddInput(2, "Email", "Email").
			AddCheck(1, "Subscribe to Newsletter", "Newsletter").
			AddCheck(1, "Disqus Forum", "Disqus")

		form.Row(4).
			AddDate(2, "Account Created", "Created").
			AddDate(2, "Commission Expires", "Expires")

		form.Row(1).
			AddTextarea(1, "Notes", "Notes")

		form.Row(1).
			AddInput(1, "Blog / Website Address", "Bloglink")

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate("/")
		})

		form.SaveEvent(func(evt dom.Event) {
			evt.PreventDefault()
			go func() {
				form.Bind(&user)
				print("bind", user)
				Session.Disqus = user.Disqus
				done := false
				err := RPC("UserRPC.SaveMe", shared.UserRPCData{
					Channel: Session.Channel,
					ID:      Session.UserID,
					User:    &user,
				}, &done)
				if err != nil {
					dom.GetWindow().Alert("Save Error: " + err.Error())
				} else {
					Session.Back()
				}
			}()
		})

		// All done, so render the form
		formulate.MainContainer("wide-container")
		form.Render("edit-form", "#main-container", &user)
		form.ReadOnly("Created", true)
		form.ReadOnly("Expires", true)

		// Add an avatar to the title
		w := dom.GetWindow()
		doc := w.Document()

		// avatar := "205e460b479e2e5b48aec07710c08d50"

		// theEmail := strings.TrimSpace(strings.ToLower(user.Email))
		// avatar := md5.Sum([]byte(theEmail))
		// avatarURL := fmt.Sprintf("https://www.gravatar.com/avatar/%x?d=wavatar", avatar)
		avatarURL := user.GetAvatar(80)
		// print("avatar", theEmail, avatar, avatarURL)
		titletext := doc.QuerySelector("#titletext")
		newSpan := doc.CreateElement("SPAN")
		titletext.AppendChild(newSpan)
		newSpan.SetInnerHTML("&nbsp;&nbsp")
		img := doc.CreateElement("IMG").(*dom.HTMLImageElement)
		newSpan.AppendChild(img)
		img.Src = avatarURL
		emailField := form.Get("Email").(*dom.HTMLInputElement)

		form.OnEvent("Email", "change", func(evt dom.Event) {
			user.Email = emailField.Value
			img.Src = user.GetAvatar(80)
			// newEmail := strings.TrimSpace(strings.ToLower(emailField.Value))
			// img.Src = fmt.Sprintf("https://www.gravatar.com/avatar/%x?d=wavatar",
			// md5.Sum([]byte(newEmail)))
		})

		// Now add a pricing table
		formulate.AppendDiv("pricing-table")
		loadTemplate("pricing-table", "#pricing-table", true)

	}()
}

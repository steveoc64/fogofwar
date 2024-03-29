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
	Session.Subscribe("Play", _play, context)
	_userList("Users", nil, context)
}

func _userList(action string, msg *shared.NetData, context *router.Context) {

	go func() {
		users := []shared.User{}
		RPC("UserRPC.ListOnline", shared.UserRPCData{
			Channel: Session.Channel,
		}, &users)

		form := formulate.ListForm{}
		form.New("fa-user", "Users Online")

		if Session.SubMobile() {
			// Define the layout
			form.Column("Rank", "GetRank")
			form.Column("Username", "Username")
			form.Column("Country", "Country")
			form.EmailAvatarColumn("Email", "Email")
			form.DateColumn("Expires", "Expires")
		} else {

			// Define the layout
			form.Column("Rank", "GetRank")
			form.Column("Username", "Username")
			form.Column("Country", "Country")
			form.Column("IP", "IPAddress")
			form.Column("Ch", "Channel")
			form.EmailAvatarColumn("Email", "Email")
			form.Column("Scenarios", "NumScenarios")
			form.Column("Games", "NumGames")
			form.DateColumn("Expires", "Expires")
		}

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
		lList.BoolColumn("Up", "Up")
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
		Session.MobileSensitive = true
		RPC("UserRPC.Get", shared.UserRPCData{
			Channel: Session.Channel,
			ID:      id,
		}, &user)

		form := formulate.EditForm{}
		form.New("fa-user", "User Details - "+user.Name)

		// Layout the fields
		if Session.Mobile() {
			form.Row(1).
				AddSelect(1, "Rank", "Rank", ranks, "ID", "Name", 1, user.Rank)

			form.Row(2).
				AddInput(1, "Username", "Username").
				AddInput(1, "Password", "Passwd")

			form.Row(1).
				AddInput(1, "Name", "Name")

			form.Row(1).
				AddInput(1, "Email", "Email")

			form.Row(1).
				AddInput(1, "Country", "Country")

			form.Row(1).
				AddInput(1, "Blog Link", "Bloglink")

			form.Row(2).
				AddCheck(1, "Disqus", "Disqus").
				AddCheck(1, "Banned", "Banned")

			form.Row(4).
				AddDisplay(1, "Channel", "Channel").
				AddDisplay(3, "IP", "IPAddress")

			form.Row(1).
				AddDate(1, "Created", "Created")

			form.Row(1).
				AddDate(1, "Expires", "Expires")

			form.Row(1).
				AddBigTextarea(1, "Notes", "Notes")

		} else {
			form.Row(3).
				AddSelect(1, "Rank", "Rank", ranks, "ID", "Name", 1, user.Rank).
				AddInput(1, "Username", "Username").
				AddInput(1, "Password", "Passwd")

			form.Row(3).
				AddInput(1, "Name", "Name").
				AddInput(1, "Email", "Email").
				AddInput(1, "Country", "Country")

			form.Row(9).
				AddInput(3, "Blog Link", "Bloglink").
				AddCheck(1, "Disqus", "Disqus").
				AddCheck(1, "Banned", "Banned").
				AddDisplay(1, "Channel", "Channel").
				AddDisplay(3, "IP", "IPAddress")

			form.Row(2).
				AddDate(1, "Account Created", "Created").
				AddDate(1, "Commission Expires", "Expires")

			form.Row(1).
				AddTextarea(1, "Notes", "Notes")
		}

		if user.Channel != 0 {
			form.Row(1).
				AddCustom(1, "Activity", "Activity", "")

		}

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
	go _usersOnline("show", nil, context)
}

func _usersOnline(action string, msg *shared.NetData, context *router.Context) {

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

func promoteMe(action string, msg *shared.NetData, context *router.Context) {
	print("Promoting Rank to", msg.ID, "with", action)
	Session.Subscriptions = make(map[string]MessageFunction)

	go func() {
		// Login again to get a fresh new set of things
		RPC("LoginRPC.Logout", Session.Channel, nil)
		Login(Session.Username, Session.Passwd)
		_userSettings("User", nil, context)
	}()

}

func userSettings(context *router.Context) {
	Session.Subscribe("Promotion", promoteMe, context)
	Session.Subscribe("Play", _play, context)
	_userSettings("User", nil, context)
}

func _userSettings(action string, msg *shared.NetData, context *router.Context) {

	go func() {
		Session.MobileSensitive = true
		user := shared.User{}
		RPC("UserRPC.Me", Session.Channel, &user)
		form := formulate.EditForm{}

		form.New("fa-cog", "Account Settings - "+user.Username)

		if Session.SubMobile() {

			form.Row(1).
				AddFocusInput(1, "Name", "Name")

			form.Row(1).
				AddDisplay(1, "Username", "Username")

			form.Row(1).
				AddInput(1, "Country", "Country")

			form.Row(1).
				AddInput(1, "Email", "Email")

			form.Row(2).
				AddCheck(1, "Newsletter", "Newsletter").
				AddCheck(1, "Disqus Forum", "Disqus")

			form.Row(1).
				AddDate(1, "Account Created", "Created")

			form.Row(1).
				AddDate(1, "Commission Expires", "Expires")

			form.Row(1).
				AddTextarea(1, "Notes", "Notes")

			form.Row(1).
				AddInput(1, "Website", "Bloglink")
		} else {

			form.Row(4).
				AddFocusInput(2, "Full Name", "Name").
				AddDisplay(1, "Username", "Username").
				AddInput(1, "Country", "Country")

			form.Row(4).
				AddInput(2, "Email", "Email").
				AddCheck(1, "Newsletter", "Newsletter").
				AddCheck(1, "Disqus Forum", "Disqus")

			form.Row(4).
				AddDate(2, "Account Created", "Created").
				AddDate(2, "Commission Expires", "Expires")

			form.Row(1).
				AddTextarea(1, "Notes", "Notes")

			form.Row(1).
				AddInput(1, "Blog / Website Address", "Bloglink")
		}

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
		loadTemplate("pricing-table", "#pricing-table", Session.Rank)

		if Session.Rank < 2 {
			doc.QuerySelector("[name=buy-commission-2]").AddEventListener("click", false, func(evt dom.Event) {
				print("buy commission 2")
				pp := doc.QuerySelector(".paypal-frame").(*dom.HTMLIFrameElement)
				if pp != nil {
					// pp.Class().Remove("hidden")
					go func() {
						url := ""
						err := RPC("PaypalRPC.CreatePayment", shared.PaypalRPCData{
							Channel: Session.Channel,
							Months:  1,
							Rank:    2,
							Descr:   "ActionFront Colonels Commission (1 Month)",
						}, &url)
						if err != nil {
							dom.GetWindow().Alert("ERROR: " + err.Error())
							// pp.Class().Add("hidden")
						} else {
							// pp.Class().Remove("hidden")
							print("set url to ", url)
							w.Open(url, "ActionFront Commission Purchase", "left=50,top=100,height=600,width=700,menubar=0,toolbar=0,location=0,status=yes")
							// pp.Src = url
						}
					}()
				}
			})
		}

		if Session.Rank < 3 {
			doc.QuerySelector("[name=buy-commission-3]").AddEventListener("click", false, func(evt dom.Event) {
				print("buy commission 3")
				pp := doc.QuerySelector(".paypal-frame").(*dom.HTMLIFrameElement)
				if pp != nil {
					go func() {
						url := ""
						err := RPC("PaypalRPC.CreatePayment", shared.PaypalRPCData{
							Channel: Session.Channel,
							Months:  1,
							Rank:    3,
							Descr:   "ActionFront Brigadier Commission (1 Month)",
						}, &url)
						if err != nil {
							dom.GetWindow().Alert("ERROR: " + err.Error())
							// pp.Class().Add("hidden")
						} else {
							// pp.Class().Remove("hidden")
							print("set url to ", url)
							w.Open(url, "ActionFront Commission Purchase", "left=50,top=100,height=600,width=700,menubar=0,toolbar=0,location=0,status=yes")
							// pp.Src = url
						}
					}()
				}
			})
		}

		if Session.Rank < 4 {
			doc.QuerySelector("[name=buy-commission-4]").AddEventListener("click", false, func(evt dom.Event) {
				print("buy commission 4")
				pp := doc.QuerySelector(".paypal-frame").(*dom.HTMLIFrameElement)
				if pp != nil {
					go func() {
						url := ""
						err := RPC("PaypalRPC.CreatePayment", shared.PaypalRPCData{
							Channel: Session.Channel,
							Months:  1,
							Rank:    4,
							Descr:   "ActionFront Marechal Commission (1 Month)",
						}, &url)
						if err != nil {
							dom.GetWindow().Alert("ERROR: " + err.Error())
							// pp.Class().Add("hidden")
						} else {
							// pp.Class().Remove("hidden")
							print("set url to ", url)
							w.Open(url, "ActionFront Commission Purchase", "left=50,top=100,height=600,width=700,menubar=0,toolbar=0,location=0,status=yes")
							// pp.Src = url
						}
					}()
				}
			})
		}

	}()
}

func contactForm(context *router.Context) {

	go func() {
		data := shared.ContactMessage{}

		form := formulate.EditForm{}

		// Layout the fields

		form.New("fa-envelope", "Contact Form - Contact Site Admin")

		form.Row(1).
			AddFocusInput(1, "Subject", "Subject")

		form.Row(1).
			AddBigTextarea(1, "Message", "Message")

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Back()
		})

		form.SaveEvent(func(evt dom.Event) {
			evt.PreventDefault()

			go func() {
				form.Bind(&data)
				newID := 0
				err := RPC("UserRPC.Contact", shared.ContactMessageRPCData{
					Channel:        Session.Channel,
					ContactMessage: &data,
				}, &newID)
				if err != nil {
					dom.GetWindow().Alert(err.Error())
				} else {
					dom.GetWindow().Alert("Thanks .. Your message has been sent, will get back to you ASAP.")
					Session.Back()
				}
			}()
		})

		// All done, so render the form
		form.Render("edit-form", "main", &data)

	}()

}

func inviteFriend(context *router.Context) {

	print("invite")
	if Session.Rank < 2 {
		return
	}

	go func() {
		data := shared.ContactMessage{}

		form := formulate.EditForm{}

		// Layout the fields

		form.New("fa-gift", "Invite a Friend")

		form.Row(1).
			AddFocusInput(1, "Friends Email", "EmailTo")

		form.Row(1).
			AddInput(1, "Subject", "Subject")

		form.Row(1).
			AddBigTextarea(1, "Message", "Message")

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Back()
		})

		form.SaveEvent(func(evt dom.Event) {
			evt.PreventDefault()

			go func() {
				form.Bind(&data)
				newID := 0
				err := RPC("UserRPC.InviteFriend", shared.ContactMessageRPCData{
					Channel:        Session.Channel,
					ContactMessage: &data,
				}, &newID)
				if err != nil {
					dom.GetWindow().Alert(err.Error())
				} else {
					dom.GetWindow().Alert("Thanks .. Your message has been sent.\n")
					Session.Back()
				}
			}()
		})

		// All done, so render the form
		data.Subject = "Invite to a new Wargaming Site"
		data.Message = ".. enter your message here"
		form.Render("edit-form", "main", &data)
	}()

}

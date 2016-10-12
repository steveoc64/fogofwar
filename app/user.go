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
		rpcClient.Call("UserRPC.List", shared.UserRPCData{
			Channel: Session.Channel,
		}, &users)
		print("got users", users)

		form := formulate.ListForm{}
		form.New("fa-user", "Users List")

		// Define the layout
		form.Column("Rank", "Rank")
		form.Column("Username", "Username")
		form.Column("Country", "Country")
		form.Column("Name", "Name")
		form.Column("Email", "Email")
		// form.Column("Bloglink", "Bloglink")
		form.DateColumn("Created", "Created")

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate("/")
		})

		form.NewRowEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate("/user/add")
		})

		form.PrintEvent(func(evt dom.Event) {
			dom.GetWindow().Print()
		})

		form.RowEvent(func(key string) {
			Session.Navigate("/user/" + key)
		})

		form.Render("user-list", "main", users)

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

		BackURL := "/users"
		form := formulate.EditForm{}
		form.New("fa-user", "User Details - "+user.Name)

		// Layout the fields

		form.Row(2).
			Add(1, "Username", "text", "Username", `id="focusme"`).
			Add(1, "Password", "text", "Passwd", "")

		form.Row(11).
			Add(3, "Name", "text", "Name", "").
			Add(3, "Email", "text", "Email", "").
			Add(3, "Mobile", "text", "SMS", "").
			AddCheck(1, "Local Carrier", "Local").
			AddCheck(1, "Send Msgs", "UseMobile")

		if Session.Rank > 9 {
			form.Row(5).
				AddSelect(2, "Rank", "Rank", ranks, "ID", "Name", 1, user.Rank).
				AddCheck(1, "Technician", "IsTech").
				AddCheck(1, "Allocate Tasks ?", "CanAllocate").
				AddDecimal(1, "Hourly Rate", "HourlyRate", 2, "1")
		} else {
			form.Row(3).
				AddSelect(2, "Rank", "Rank", ranks, "ID", "Name", 1, user.Rank)
		}

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate(BackURL)
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
				Session.Navigate(BackURL)
			}()
		})

		form.SaveEvent(func(evt dom.Event) {
			evt.PreventDefault()
			form.Bind(&user)

			data := shared.UserRPCData{
				Channel: Session.Channel,
				User:    &user,
			}
			go func() {
				done := false
				rpcClient.Call("UserRPC.Update", data, &done)
				Session.Navigate(BackURL)
			}()
		})

		form.PrintEvent(func(evt dom.Event) {
			dom.GetWindow().Print()
		})

		// All done, so render the form
		form.Render("edit-form", "main", &user)

	}()

}

// Add form for a new user
func userAdd(context *router.Context) {

	ranks := shared.GetRanks()

	go func() {
		user := shared.User{}

		BackURL := "/users"
		form := formulate.EditForm{}
		form.New("fa-user", "Add New User")

		// Layout the fields

		form.Row(2).
			Add(1, "Username", "text", "Username", `id="focusme"`).
			Add(1, "Password", "text", "Passwd", `id="focusme"`)

		form.Row(3).
			Add(1, "Name", "text", "Name", "").
			Add(1, "Email", "text", "Email", "").
			Add(1, "Mobile", "text", "SMS", "")

		form.Row(3).
			Add(1, "Rank", "select", "Rank", "")
		form.SetSelectOptions("Rank", ranks, "ID", "Name", 1, 0)

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate(BackURL)
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
				Session.Navigate(BackURL)
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

package main

import (
	"fmt"

	"github.com/steveoc64/fogofwar/shared"
	"github.com/steveoc64/formulate"

	"regexp"

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

	w := dom.GetWindow()
	doc := w.Document()

	go func() {
		user := shared.UserSignup{}
		title := "Sign Up for NEW Account"
		form := formulate.EditForm{}
		form.New("fa-thumbs-o-up", title)

		// var validEmail = regexp.MustCompile(`^(([^<>()[\\]\\.,;:\\s@\"]+(\\.[^<>()[\\]\\.,;:\\s@\"]+)*)|(\".+\"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$`)
		// var validEmail2 = regexp.MustCompile('/^(?!(?>"?(?>\\\[ -~]|[^"])"?){255,})(?!"?(?>\\\[ -~]|[^"]){65,}"?@)(?>([!#-\'*+\/-9=?^-~-]+)(?>\.(?1))*|"(?>[ !#-\[\]-~]|\\\[ -~])*")@(?!.*[^.]{64,})(?>([a-z\d](?>[a-z\d-]*[a-z\d])?)(?>\.(?2)){0,126}|\[(?:(?>IPv6:(?>([a-f\d]{1,4})(?>:(?3)){7}|(?!(?:.*[a-f\d][:\]]){8,})((?3)(?>:(?3)){0,6})?::(?4)?))|(?>(?>IPv6:(?>(?3)(?>:(?3)){5}:|(?!(?:.*[a-f\d]:){6,})(?5)?::(?>((?3)(?>:(?3)){0,4}):)?))?(25[0-5]|2[0-4]\d|1\d{2}|[1-9]?\d)(?>\.(?6)){3}))\])$/iD')
		var mailAddressRE = regexp.MustCompile(`^([a-zA-Z0-9][-_.a-zA-Z0-9]*)(@[-_.a-zA-Z0-9]+)?$`)

		// Layout the fields

		form.Row(1).
			AddCustom(1, "!!! Error !!!", "Errors", "")

		form.Row(3).
			AddInput(1, "Username", "Username").
			AddInput(2, "Email", "Email")

		form.Row(1).
			AddInput(1, "Magic Authentication Code", "Secret")

		form.Row(2).
			AddInput(1, "Password", "Passwd1").
			AddInput(1, "Repeat Password", "Passwd2")

		form.Row(3).
			AddInput(1, "What Country are you in ?", "Country").
			AddInput(2, "Full Name", "Name")

		form.Row(1).
			AddInput(1, "Link Address for Your Website / Blog / Club", "Bloglink")

		form.Row(1).
			AddBigTextarea(1, "Tell us a bit about yourself, the games you play, figs, rules preferences, etc.", "Notes")

		form.Row(1).
			AddCustom(1, "", "Graphic", "")

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			print("cancel signup")
			grid1()
		})

		form.SaveEvent(func(evt dom.Event) {
			evt.PreventDefault()
			form.Bind(&user)
			print("binded", user)

			// before we go much further, work out how far into this form we are
			graphic := doc.QuerySelector("[name=row-7]")
			print("graphic =", graphic)
			print("gr class =", graphic.Class().String(), "is hidden", graphic.Class().Contains("hidden"))
			if !graphic.Class().Contains("hidden") {
				print("Looks like we are here because we hit enter whilst we are inside the validate secret code part ... so this is only useful if the email address has been updated, and we want to try again ... need to think this one through a bit more")
				return
			}

			errors := doc.QuerySelector("[name=Errors]").(*dom.HTMLDivElement)
			errRow := doc.QuerySelector("[name=row-0]")
			errRow.Class().Add("hidden")
			goneBad := false
			finded := mailAddressRE.FindStringSubmatch(user.Email)
			// print("finded =", finded)

			// validate the input first
			if user.Username == "" {
				errRow.Class().Remove("hidden")
				errors.SetTextContent("Please enter a unique Username")
				doc.QuerySelector("[name=Username]").(*dom.HTMLInputElement).Focus()
				goneBad = true
			} else {
				if finded == nil || finded[1] == "" || finded[2] == "" {
					// print("no email match")
					errRow.Class().Remove("hidden")
					errors.SetTextContent("Please enter a valid email address")
					doc.QuerySelector("[name=Email]").(*dom.HTMLInputElement).Focus()
					goneBad = true
				} else {
					if user.Passwd1 == "" || user.Passwd2 == "" || user.Passwd1 != user.Passwd2 {
						errRow.Class().Remove("hidden")
						errors.SetTextContent("Please enter password for this account, and repeat the exact same password in the second field")

						if user.Passwd1 == "" {
							doc.QuerySelector("[name=Passwd1]").(*dom.HTMLInputElement).Focus()
						} else {
							doc.QuerySelector("[name=Passwd2]").(*dom.HTMLInputElement).Focus()
						}
						goneBad = true
					}
				}
			}

			if !goneBad {
				go func() {
					// All good, so fire the info off to the backend, and generate a blank account
					// tied to the current channel, and generate an email with a secret code

					newUser := shared.UserSignup{}
					err := rpcClient.Call("LoginRPC.NewUserRego", user, &newUser)
					if err != nil {
						print(err.Error())
						errRow.Class().Remove("hidden")
						errors.SetTextContent(err.Error())
					} else {
						// hide parts of the display, and raise some new ones
						doc.QuerySelector("[name=row-2]").Class().Remove("hidden")
						doc.QuerySelector("[name=row-3]").Class().Add("hidden")
						doc.QuerySelector("[name=row-4]").Class().Add("hidden")
						doc.QuerySelector("[name=row-5]").Class().Add("hidden")
						doc.QuerySelector("[name=row-6]").Class().Add("hidden")
						gr := doc.QuerySelector("[name=row-7]")
						loadTemplate("magic-secret", "[name=Graphic]", &user)
						gr.Class().Remove("hidden")
						doc.QuerySelector("[name=Secret]").(*dom.HTMLInputElement).Focus()
					}
				}()
			}
		})

		// All done, so render the form
		form.Render("edit-form", "main", &user)
		doc.QuerySelector("[name=Username]").(*dom.HTMLInputElement).Focus()

		errors := doc.QuerySelector("[name=Errors]").(*dom.HTMLDivElement)
		errRow := doc.QuerySelector("[name=row-0]")
		errRow.Class().Add("hidden")
		magicRow := doc.QuerySelector("[name=row-2]")
		magicRow.Class().Add("hidden")
		doc.QuerySelector("[name=row-7]").Class().Add("hidden")

		doc.QuerySelector("[name=Username]").AddEventListener("change", false, func(evt dom.Event) {
			username := evt.Target().(*dom.HTMLInputElement)
			// print("username has changed .. check it with the backend", username.Value)
			go func() {
				ok := false
				err := rpcClient.Call("LoginRPC.CheckUsername", username.Value, &ok)
				if err != nil {
					print("call returns", err.Error())
				} else {
					if !ok {
						errRow.Class().Remove("hidden")
						errors.SetTextContent(`Looks like the username "` + username.Value + `" has already been used ...
					 please try something a little different, this will be YOUR unique username on the system.`)
						username.Value = ""
						username.Focus()
					} else {
						// errRow.Class().Add("hidden")
					}
				}
			}()
		})

		doc.QuerySelector("[name=Email]").AddEventListener("change", false, func(evt dom.Event) {
			email := evt.Target().(*dom.HTMLInputElement)
			// print("email has changed to", email.Value)
			finded := mailAddressRE.FindStringSubmatch(email.Value)
			if finded == nil || finded[1] == "" || finded[2] == "" {
				// print("no email match")
				errRow.Class().Remove("hidden")
				errors.SetTextContent("Please enter a valid email address")
				doc.QuerySelector("[name=Email]").(*dom.HTMLInputElement).Focus()
			} else {
				go func() {
					ok := false
					rpcClient.Call("LoginRPC.CheckEmail", email.Value, &ok)
					if !ok {
						errRow.Class().Remove("hidden")
						errors.SetTextContent(`Looks like the email address "` + email.Value + `" is already registered ...
						If that is YOUR email, then try signing in with that from the SignIn page. Thanks.`)
						email.Value = ""
						email.Focus()
					} else {
						// errRow.Class().Add("hidden")
					}
				}()
			}
		})

		doc.QuerySelector("[name=Passwd1]").AddEventListener("blur", false, func(evt dom.Event) {
			pw1 := doc.QuerySelector("[name=Passwd1]").(*dom.HTMLInputElement)
			if pw1.Value == "" {
				errRow.Class().Remove("hidden")
				errors.SetTextContent(`Please enter a non-blank password to proceed`)
				pw1.Focus()
			}
		})

		doc.QuerySelector("[name=Passwd2]").AddEventListener("blur", false, func(evt dom.Event) {
			pw2 := doc.QuerySelector("[name=Passwd2]").(*dom.HTMLInputElement)
			if pw2.Value == "" {
				errRow.Class().Remove("hidden")
				errors.SetTextContent(`Please enter your new password in BOTH fields`)
				pw2.Focus()
			}
		})

		doc.QuerySelector("[name=Passwd2]").AddEventListener("change", false, func(evt dom.Event) {
			pw1 := doc.QuerySelector("[name=Passwd1]").(*dom.HTMLInputElement)
			pw2 := doc.QuerySelector("[name=Passwd2]").(*dom.HTMLInputElement)
			goneBad := false

			if pw1.Value == "" {
				errRow.Class().Remove("hidden")
				errors.SetTextContent(`Please enter your new password in BOTH fields`)
				pw1.Focus()
				goneBad = true
			}
			if pw2.Value == "" {
				errRow.Class().Remove("hidden")
				errors.SetTextContent(`Please enter your new password in BOTH fields`)
				pw2.Focus()
				goneBad = true
			}
			if pw1.Value != pw2.Value {
				errRow.Class().Remove("hidden")
				errors.SetTextContent(`That's no good - those passwords don't exactly match. Please enter the EXACT SAME password in each field.`)
				pw2.Focus()
				goneBad = true
			}
			if !goneBad {
				// errRow.Class().Add("hidden")
			}
		})

		doc.QuerySelector("[name=Secret]").AddEventListener("change", false, func(evt dom.Event) {
			secret := evt.Target().(*dom.HTMLInputElement)
			print("SecretCode has changed", secret.Value)

		})
	}()

}

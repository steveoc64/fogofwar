package main

import (
	"fmt"

	"./shared"
	"github.com/steveoc64/formulate"

	"regexp"

	"github.com/go-humble/router"
	"honnef.co/go/js/dom"
)

func Login(username string, passwd string) {

	Session.Username = ""
	Session.Passwd = ""
	Session.Rank = 0
	Session.UserID = 0

	lc := &shared.LoginCredentials{
		Username: username,
		Password: passwd,
		Channel:  Session.Channel,
	}
	// print("login params", lc)

	lr := &shared.LoginReply{}
	err := RPC("LoginRPC.Login", lc, lr)
	if err != nil {
		dom.GetWindow().Alert(err.Error())
		return
	}
	if lr.Result == "OK" {
		// createMenu(lr.Menu)
		Session.Username = lc.Username
		Session.Passwd = lc.Password
		Session.Rank = lr.Rank
		Session.UserID = lr.ID
		Session.Disqus = lr.Disqus
		Session.Lookup = lr.LookupTable
		shared.Lookups = &Session.Lookup
		Session.Lookup.GridSizes = AllowedGridSizes
		Session.Lookup.GridSizesMobile = AllowedGridSizesMobile
		Session.MaxGames = lr.MaxGames
		Session.MaxScenarios = lr.MaxScenarios
		Session.MaxPlayers = lr.MaxPlayers
		Session.Version = lr.Version
		print("Code Version -", lr.Version)

		loadRoutes(lr.Rank, lr.Routes)

		// print("Got Lookups", Session.Lookup)

		// print("got a list of valid routes", lr.Routes)

		// Create the slideout menu once and for all
		// Get the users name and set the menu option to that
		loadTemplate("slidemenu", "#slidemenu-div", Session)
		myName := fmt.Sprintf(`%s %s`, Session.GetRank(), Session.Username)
		w := dom.GetWindow()
		doc := w.Document()
		doc.QuerySelector("#myname").SetTextContent(myName)
		doc.QuerySelector("#hamburger").Class().Remove("hidden")
		// doc.QuerySelector("#signin-btn").Class().Add("hidden")
		// doc.QuerySelector("#signin-mobile").Class().Add("hidden")
		doc.QuerySelector("#faq").Class().Add("hidden")

		menu := doc.QuerySelector("#slidemenu")
		menu.AddEventListener("click", false, func(evt dom.Event) {
			menu.Class().Remove("cbp-spmenu-open")
		})

		if Session.Rank > 9 {
			doc.QuerySelector("#menu-users").AddEventListener("click", false, func(evt dom.Event) {
				evt.PreventDefault()
				Session.Navigate("/users")
			})
		}

		doc.QuerySelector("#menu-settings").AddEventListener("click", false, func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate("/settings")
		})
		// 	evt.PreventDefault()
		// 	print("TODO - Campaigns")
		// })
		doc.QuerySelector("#menu-scenario").AddEventListener("click", false, func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate("/scenarios")
		})
		doc.QuerySelector("#menu-game").AddEventListener("click", false, func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate("/")
		})
		if Session.Rank > 1 {
			doc.QuerySelector("#menu-invite").AddEventListener("click", false, func(evt dom.Event) {
				evt.PreventDefault()
				Session.Navigate("/invite")
			})
		}
		doc.QuerySelector("#menu-manpages").AddEventListener("click", false, func(evt dom.Event) {
			evt.PreventDefault()
			loc := dom.GetWindow().Location()
			dom.GetWindow().Open(loc.Origin+"/manual", "actionfront-manual", "")
		})
		doc.QuerySelector("#menu-contact").AddEventListener("click", false, func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate("/contact")
		})

		doc.QuerySelector("#menu-signout").AddEventListener("click", false, func(evt dom.Event) {
			evt.PreventDefault()
			el := doc.QuerySelector("#md-confirm-signout")
			el.Class().Add("md-show")
		})

		// if el := doc.QuerySelector(".md-confirm-signout"); el != nil {
		// 	el.AddEventListener("click", false, Logout)
		// }

		// el.AddEventListener("click", false, func(evt dom.Event) {
		// 	doc.QuerySelector("#confirm-delete").Class().Add("md-show")
		// })

		// if el := doc.QuerySelector(".md-close-del"); el != nil {
		// 	el.AddEventListener("click", false, func(evt dom.Event) {
		// 		doc.QuerySelector("#confirm-delete").Class().Remove("md-show")
		// 	})
		// }

		// if el := doc.QuerySelector("#confirm-delete"); el != nil {
		// 	el.AddEventListener("keyup", false, func(evt dom.Event) {
		// 		if evt.(*dom.KeyboardEvent).KeyCode == 27 {
		// 			evt.PreventDefault()
		// 			doc.QuerySelector("#confirm-delete").Class().Remove("md-show")
		// 		}
		// 	})
		// }
		Session.Navigate("/")
		// doc.QuerySelector(".embedly-card").Class().Remove("hidden")
	} else {
		print("login failed")
		dom.GetWindow().Alert("Login Failed")
	}
}

func Logout() {
	print("log out")

	go func() {
		RPC("LoginRPC.Logout", Session.Channel, nil)
	}()

	// showLoginForm()
	initRouter() // reset all the routes to nothing
	// js.Global.Get("location").Set("hash", "")

	w := dom.GetWindow()
	doc := w.Document()

	doc.GetElementByID("slidemenu-div").SetInnerHTML("")
	doc.GetElementByID("hamburger").Class().Add("hidden")
	// doc.GetElementByID("signin-btn").Class().Remove("hidden")
	// doc.GetElementByID("signin-mobile").Class().Remove("hidden")
	doc.GetElementByID("faq").Class().Add("hidden")

	Session.Navigate("/")

	grid1()

}

func initForms() {
	w := dom.GetWindow()
	doc := w.Document()

	// doc.QuerySelector("#signin-btn").AddEventListener("click", false, func(evt dom.Event) {
	// 	evt.PreventDefault()
	// 	loginForm()
	// })

	// doc.QuerySelector("#signin-mobile").AddEventListener("click", false, func(evt dom.Event) {
	// 	evt.PreventDefault()
	// 	loginForm()
	// })

	doc.QuerySelector("#hamburger").AddEventListener("click", false, func(evt dom.Event) {
		el := doc.QuerySelector("#slidemenu")
		el.Class().Add("cbp-spmenu-open")
	})

	doc.QuerySelector("#homepage").AddEventListener("click", false, func(evt dom.Event) {
		evt.PreventDefault()
		Session.Navigate("/")
	})

	doc.QuerySelector("#md-cancel-signout").AddEventListener("click", false, func(evt dom.Event) {
		evt.PreventDefault()
		el := doc.QuerySelector("#md-confirm-signout")
		el.Class().Remove("md-show")
	})

	doc.QuerySelector("#md-really-signout").AddEventListener("click", false, func(evt dom.Event) {
		print("really sign out")
		evt.PreventDefault()
		el := doc.QuerySelector("#md-confirm-signout")
		el.Class().Remove("md-show")
		Logout()
	})

}

func signIn(context *router.Context) {
	loginForm()
}

func loginForm() {
	w := dom.GetWindow()
	doc := w.Document()

	// doc.QuerySelector("#signin-btn").Class().Add("hidden")
	// doc.QuerySelector("#signin-mobile").Class().Add("hidden")
	doc.QuerySelector("#hamburger").Class().Add("hidden")
	doc.QuerySelector("#faq").Class().Add("hidden")
	loadTemplate("loginform", "main", nil)

	doc.QuerySelector("#l-loginbtn").AddEventListener("click", false, func(evt dom.Event) {
		// print("clickd on loginbtn")
		evt.PreventDefault()
		username := doc.GetElementByID("l-username").(*dom.HTMLInputElement).Value
		passwd := doc.GetElementByID("l-passwd").(*dom.HTMLInputElement).Value
		go Login(username, passwd)
	})

	doc.QuerySelector("#l-cancelbtn").AddEventListener("click", false, func(evt dom.Event) {
		evt.PreventDefault()
		grid1()
	})

	// doc.QuerySelector(".embedly-card").Class().Add("hidden")
}

func grid1() {
	loadTemplate("grid1", "main", nil)
	formulate.AppendDiv("pricing-table")
	loadTemplate("pricing-table", "#pricing-table", 0)

	w := dom.GetWindow()
	doc := w.Document()

	// el := doc.QuerySelector("#signin-btn")
	// el.Class().Remove("hidden")
	// el.AddEventListener("click", false, func(evt dom.Event) {
	// 	evt.PreventDefault()
	// 	loginForm()
	// })

	// el = doc.QuerySelector("#signin-mobile")
	// el.Class().Remove("hidden")
	// el.AddEventListener("click", false, func(evt dom.Event) {
	// 	evt.PreventDefault()
	// 	loginForm()
	// })

	// doc.QuerySelector("#main-tute").AddEventListener("click", false, func(evt dom.Event) {
	// 	evt.PreventDefault()
	// 	Session.Navigate("/tute")
	// })

	doc.QuerySelector("#main-faq").AddEventListener("click", false, func(evt dom.Event) {
		evt.PreventDefault()
		Session.Navigate("/faq")
	})

	doc.QuerySelector("#main-signup").AddEventListener("click", false, func(evt dom.Event) {
		evt.PreventDefault()
		Session.Navigate("/signup")
	})

	doc.QuerySelector("#main-signin").AddEventListener("click", false, func(evt dom.Event) {
		evt.PreventDefault()
		Session.Navigate("/signin")
	})

	doc.QuerySelector("[name=account_1]").AddEventListener("click", false, func(evt dom.Event) {
		evt.PreventDefault()
		Session.Navigate("/signup")
	})
	doc.QuerySelector("[name=buy-commission-2]").AddEventListener("click", false, func(evt dom.Event) {
		evt.PreventDefault()
		Session.Navigate("/signup")
	})
	doc.QuerySelector("[name=buy-commission-3]").AddEventListener("click", false, func(evt dom.Event) {
		evt.PreventDefault()
		Session.Navigate("/signup")
	})
	doc.QuerySelector("[name=buy-commission-4]").AddEventListener("click", false, func(evt dom.Event) {
		evt.PreventDefault()
		Session.Navigate("/signup")
	})

	w.ScrollTo(0, 0)

}

func signUp(context *router.Context) {

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
			AddTextarea(1, "Tell us a bit about yourself, the games you play, figs, rules preferences, etc.", "Notes")

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
			user.Channel = Session.Channel
			print("binded", user)

			// before we go much further, work out how far into this form we are
			graphic := form.GetRow(7)
			// print("graphic =", graphic)
			// print("gr class =", graphic.Class().String(), "is hidden", graphic.Class().Contains("hidden"))
			if !graphic.Class().Contains("hidden") {
				print("Looks like we are here because we hit enter whilst we are inside the validate secret code part ... so this is only useful if the email address has been updated, and we want to try again ... need to think this one through a bit more")
				return
			}

			errors := form.Get("Errors").(*dom.HTMLDivElement)
			errRow := form.GetRow(0)
			errRow.Class().Add("hidden")
			goneBad := false
			finded := mailAddressRE.FindStringSubmatch(user.Email)

			// validate the input first
			if user.Username == "" {
				errRow.Class().Remove("hidden")
				errors.SetTextContent("Please enter a unique Username")
				form.Focus("Username")
				goneBad = true
			} else {
				if finded == nil || finded[1] == "" || finded[2] == "" {
					// print("no email match")
					errRow.Class().Remove("hidden")
					errors.SetTextContent("Please enter a valid email address")
					form.Focus("Email")
					goneBad = true
				} else {
					if user.Passwd1 == "" || user.Passwd2 == "" || user.Passwd1 != user.Passwd2 {
						errRow.Class().Remove("hidden")
						errors.SetTextContent("Please enter password for this account, and repeat the exact same password in the second field")

						if user.Passwd1 == "" {
							form.Focus("Passwd1")
						} else {
							form.Focus("Passwd2")
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
					err := RPC("LoginRPC.NewUserRego", user, &newUser)
					if err != nil {
						print(err.Error())
						errRow.Class().Remove("hidden")
						errors.SetTextContent(err.Error())
					} else {
						// hide parts of the display, and raise some new ones
						form.Show("row-2")
						form.Hide("row-3")
						form.Hide("row-4")
						form.Hide("row-5")
						form.Hide("row-6")
						loadTemplate("magic-secret", "[name=Graphic]", &user)
						form.Show("row-7")
						form.Focus("Secret")
					}
				}()
			}
		})

		// All done, so render the form
		form.Render("edit-form", "main", &user)
		form.Focus("Username")

		errors := form.Get("Errors").(*dom.HTMLDivElement)
		errRow := form.GetRow(0)
		errRow.Class().Add("hidden")

		magicRow := form.GetRow(2)
		magicRow.Class().Add("hidden")

		form.Hide("row-7")

		form.OnEvent("Username", "change", func(evt dom.Event) {

			username := evt.Target().(*dom.HTMLInputElement)
			// print("username has changed .. check it with the backend", username.Value)
			go func() {
				ok := false
				err := RPC("LoginRPC.CheckUsername", username.Value, &ok)
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

		form.OnEvent("Email", "change", func(evt dom.Event) {
			email := evt.Target().(*dom.HTMLInputElement)
			// print("email has changed to", email.Value)
			finded := mailAddressRE.FindStringSubmatch(email.Value)
			if finded == nil || finded[1] == "" || finded[2] == "" {
				// print("no email match")
				errRow.Class().Remove("hidden")
				errors.SetTextContent("Please enter a valid email address")
				form.Focus("Email")
			} else {
				go func() {
					ok := false
					RPC("LoginRPC.CheckEmail", email.Value, &ok)
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

		form.OnEvent("Passwd1", "blur", func(evt dom.Event) {
			pw1 := form.Get("Passwd1").(*dom.HTMLInputElement)
			if pw1.Value == "" {
				errRow.Class().Remove("hidden")
				errors.SetTextContent(`Please enter a non-blank password to proceed`)
				pw1.Focus()
			}
		})

		form.OnEvent("Passwd2", "blur", func(evt dom.Event) {
			pw2 := form.Get("Passwd2").(*dom.HTMLInputElement)
			if pw2.Value == "" {
				errRow.Class().Remove("hidden")
				errors.SetTextContent(`Please enter your new password in BOTH fields`)
				pw2.Focus()
			}
		})

		form.OnEvent("Passwd2", "change", func(evt dom.Event) {
			pw1 := form.Get("Passwd1").(*dom.HTMLInputElement)
			pw2 := form.Get("Passwd2").(*dom.HTMLInputElement)
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

		form.OnEvent("Secret", "change", func(evt dom.Event) {
			secret := evt.Target().(*dom.HTMLInputElement)
			print("SecretCode has changed", secret.Value)
			go func() {
				form.Bind(&user)
				print("binded", user)
				ok := false
				err := RPC("LoginRPC.ValidateNewUser", user, &ok)
				if err != nil {
					print(err.Error())
					errRow.Class().Remove("hidden")
					errors.SetTextContent(err.Error())
				} else {
					// We are now validated .. autologin
					go Login(user.Username, user.Passwd1)
				}
			}()

		})
	}()

}

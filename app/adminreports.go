package main

import (
	"github.com/go-humble/router"
	"github.com/steveoc64/formulate"
	"honnef.co/go/js/dom"
)

func adminUtils(context *router.Context) {

	BackURL := "/"
	title := "Admin Utilities"
	form := formulate.EditForm{}
	form.New("fa-gear", title)

	form.Row(1).AddCodeBlock(1, "Results", "Results")

	// Add event handlers
	form.CancelEvent(func(evt dom.Event) {
		evt.PreventDefault()
		Session.Navigate(BackURL)
	})

	// All done, so render the form
	form.Render("edit-form", "main", nil)

	w := dom.GetWindow()
	doc := w.Document()

	// el := doc.QuerySelector("[name=Results]").(*dom.HTMLTextAreaElement)
	el := doc.QuerySelector("[name=Results]")

	isSteve := false
	if Session.Rank > 9 && Session.Username == "steve" {
		isSteve = true
	}
	form.ActionGrid("admin-util-actions", "#action-grid", isSteve, func(url string) {
		retval := ""
		go func() {
			switch url {
			case "backup":
				RPC("UtilRPC.Backup", Session.Channel, &retval)
			case "top":
				RPC("UtilRPC.Top", Session.Channel, &retval)
			case "logs":
				RPC("UtilRPC.Logs", Session.Channel, &retval)
			case "machine":
				if w.Confirm("Generate Machine Parts ?") {
					RPC("UtilRPC.Machine", Session.Channel, &retval)
				}
			case "part":
				if w.Confirm("Generate Part Class ?") {
					RPC("UtilRPC.Parts", Session.Channel, &retval)
				}
			case "cat":
				if w.Confirm("Generate Category ?") {
					RPC("UtilRPC.Cats", Session.Channel, &retval)
				}
			case "mtt":
				if w.Confirm("Generat MTT Links ?") {
					RPC("UtilRPC.MTT", Session.Channel, &retval)
				}
			// case "photomove":
			// 	if w.Confirm("Generate Photos ?") {
			// 		RPC("UtilRPC.PhotoMove", Session.Channel, &retval)
			// 	}
			case "sms":
				Session.Navigate("/sms")
				return
			case "hashtag":
				Session.Navigate("/hashtags")
				return
			case "editor":
				Session.Navigate("/testeditor")
			case "taskfigs":
				if w.Confirm("Generate Accumulators on all Tasks ?") {
					RPC("UtilRPC.TaskFigs", Session.Channel, &retval)
				}
			case "phototest":
				Session.Navigate("/phototest")
			case "thumbnails":
				if w.Confirm("Generate New Thumbnails and Previews ?") {
					RPC("UtilRPC.Thumbnails", Session.Channel, &retval)
				}
			case "users":
				Session.Navigate("/usersonline")
			default:
				print("ERROR - unknown utility", url)
				return
			}
			// el.Value = retval
			el.SetTextContent(retval)
		}()
	})

}

func showProgress(txt string) {

	// display the photo upload progress widget
	w := dom.GetWindow()
	doc := w.Document()

	if ee := doc.QuerySelector("#photoprogress"); ee != nil {
		ee.Class().Add("md-show")
		if pt := doc.QuerySelector("#progresstext"); pt != nil {
			pt.SetInnerHTML(txt)
		}
	}
}

func hideProgress() {

	// display the photo upload progress widget
	w := dom.GetWindow()
	doc := w.Document()

	if ee := doc.QuerySelector("#photoprogress"); ee != nil {
		ee.Class().Remove("md-show")
		if pt := doc.QuerySelector("#progresstext"); pt != nil {
			pt.SetInnerHTML("")
		}
	}
}

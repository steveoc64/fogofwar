package main

import "honnef.co/go/js/dom"

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

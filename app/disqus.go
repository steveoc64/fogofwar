package main

import (
	"github.com/gopherjs/gopherjs/js"
	"honnef.co/go/js/dom"
)

func showDisqus(id string, title string) {
	if Session.Disqus {
		w := dom.GetWindow()
		doc := w.Document()
		el := doc.QuerySelector("#disqus_thread")
		el.Class().Remove("hidden")

		// DISQUS.reset({
		//   reload: true,
		//   config: function () {
		//     this.page.identifier = "newidentifier";
		//     this.page.url = "http://example.com/#!newthread";
		//   }
		// });

		js.Global.Get("DISQUS").Call("reset", js.M{
			"reload": true,
			"config": js.MakeFunc(func(this *js.Object, args []*js.Object) interface{} {
				// print("inside the config function")
				page := this.Get("page")
				page.Set("identifier", id)
				page.Set("url", "http://wargaming.io/#!"+Session.URL[1:])
				page.Set("title", title)
				// page.Set("category_id", id)
				// print("DISQUS reset", title, id, Session.URL)
				return nil
			}),
		})
	}

}

func hideDisqus() {
	if Session.Disqus {
		w := dom.GetWindow()
		doc := w.Document()
		el := doc.QuerySelector("#disqus_thread")
		if el != nil {
			el.Class().Add("hidden")
		}
	}
}

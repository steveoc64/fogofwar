package main

import (
	"fmt"

	"./shared"
	"github.com/go-humble/router"
	"github.com/steveoc64/formulate"
	"honnef.co/go/js/dom"
)

type MessageFunction func(string, int)

type GlobalSessionData struct {
	Username      string
	Rank          int
	UserID        int
	CanAllocate   bool
	Channel       int
	Router        *router.Router
	AppFn         map[string]router.Handler
	Subscriptions map[string]MessageFunction
	ID            map[string]int
	URL           string
	Disqus        bool
	Lookup        shared.LookupTable
}

func (g *GlobalSessionData) GetRank() string {
	switch g.Rank {
	case 1:
		return "Lt"
	case 2:
		return "Capt"
	case 3:
		return "Maj"
	case 4:
		return "Col"
	case 5:
		return "General"
	case 10:
		return "Marshal"
	default:
		return fmt.Sprintf("%d", g.Rank)
	}
}

var Session GlobalSessionData

func (s *GlobalSessionData) Navigate(url string) {
	// print("Navigate to", url)
	// On navigate, clear out any subscriptions on events
	s.Subscriptions = make(map[string]MessageFunction)
	s.Router.Navigate(url)
	s.URL = url
	go rpcClient.Call("LoginRPC.Nav", shared.Nav{
		Channel: s.Channel,
		Route:   url,
	}, &url)
	hideDisqus()
}

func (s *GlobalSessionData) Subscribe(msg string, fn MessageFunction) {
	s.Subscriptions[msg] = fn
}

func (s *GlobalSessionData) Reload(context *router.Context) {
	s.Router.Navigate(context.Path)
}

func main() {
	initRouter()
	formulate.Templates(GetTemplate)
	websocketInit()
	initForms()
	grid1()
}

func mainPage(context *router.Context) {

	go func() {
		// users := []shared.User{}
		// rpcClient.Call("UserRPC.List", Session.Channel, &users)

		form := formulate.ListForm{}
		form.New("fa-bookmark", "Games")

		// Define the layout
		form.Column("Game", "Game")
		form.Column("Players", "Players")
		form.Column("Turn", "Turn")
		form.Column("Hosted By", "HostedBy")
		form.DateColumn("Created", "Created")
		form.DateColumn("Expires", "Expires")

		// Add event handlers
		form.CancelEvent(func(evt dom.Event) {
			evt.PreventDefault()
			Session.Navigate("/")
		})

		// form.NewRowEvent(func(evt dom.Event) {
		// 	evt.PreventDefault()
		// 	Session.Navigate("/game/add")
		// })

		form.RowEvent(func(key string) {
			Session.Navigate("/game/" + key)
		})

		form.Render("game-list", "main", nil)

		// print("add action grid")
		form.ActionGrid("main-actions", "#action-grid", Session, func(url string) {
			// print("clicked on", url)
			Session.Navigate(url)
		})

	}()

}

package main

import (
	"fmt"

	"github.com/go-humble/router"
	"github.com/steveoc64/formulate"
	// "honnef.co/go/js/dom"
	"github.com/steveoc64/fogofwar/shared"
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
	// On navigate, clear out any subscriptions on events
	s.Subscriptions = make(map[string]MessageFunction)
	s.Router.Navigate(url)
	go rpcClient.Call("LoginRPC.Nav", shared.Nav{
		Channel: s.Channel,
		Route:   url,
	}, &url)
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
	loadTemplate("main-page", "main", nil)
}

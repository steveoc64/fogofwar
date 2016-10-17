package main

import (
	"fmt"

	"./shared"
	"github.com/go-humble/router"
	"github.com/steveoc64/formulate"
)

type MessageFunction func(string, int, *router.Context)

type GlobalSessionData struct {
	Username      string
	Passwd        string
	Rank          int
	UserID        int
	CanAllocate   bool
	Channel       int
	Router        *router.Router
	AppFn         map[string]router.Handler
	Subscriptions map[string]MessageFunction
	Context       *router.Context
	ID            map[string]int
	URL           string
	Disqus        bool
	Lookup        shared.LookupTable
	MaxGames      int
	MaxScenarios  int
	MaxPlayers    int
}

func (g *GlobalSessionData) GetRank() string {
	switch g.Rank {
	case 0:
		return "NCO."
	case 1:
		return "Lt"
	case 2:
		return "Colonel"
	case 3:
		return "Brigadier"
	case 4:
		return "Marechal"
	case 10:
		return "Le Empereur"
	default:
		return fmt.Sprintf("Rank %d", g.Rank)
	}
}

var Session GlobalSessionData

func (s *GlobalSessionData) Navigate(url string) {
	print("Navigate to", url)
	// On navigate, clear out any subscriptions on events
	s.Subscriptions = make(map[string]MessageFunction)
	s.Context = nil
	s.Router.Navigate(url)
	s.URL = url
	// go RPC("LoginRPC.Nav", shared.Nav{
	// 	Channel: s.Channel,
	// 	Route:   url,
	// }, &url)
	hideDisqus()
}

func (s *GlobalSessionData) Back() {
	// On navigate, clear out any subscriptions on events
	s.Subscriptions = make(map[string]MessageFunction)
	s.Context = nil
	s.URL = ""
	s.Router.Back()
	hideDisqus()
}

func (s *GlobalSessionData) Subscribe(msg string, fn MessageFunction, context *router.Context) {
	s.Subscriptions[msg] = fn
	s.Context = context
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

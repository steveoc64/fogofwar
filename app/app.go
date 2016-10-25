package main

import (
	"fmt"

	"./shared"
	"github.com/go-humble/router"
	"github.com/gopherjs/gopherjs/js"
	"github.com/steveoc64/formulate"
	"honnef.co/go/js/dom"
)

type MessageFunction func(string, int, *router.Context)

type GlobalSessionData struct {
	Version         string
	Username        string
	Passwd          string
	Rank            int
	UserID          int
	CanAllocate     bool
	Channel         int
	Router          *router.Router
	AppFn           map[string]router.Handler
	Subscriptions   map[string]MessageFunction
	Context         *router.Context
	ID              map[string]int
	URL             string
	Disqus          bool
	Lookup          shared.LookupTable
	MaxGames        int
	MaxScenarios    int
	MaxPlayers      int
	EditGame        *shared.Game
	RedrawOnResize  bool
	MobileSensitive bool
	wasMobile       bool
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
	// print("Navigate to", url)
	// On navigate, clear out any subscriptions on events
	s.Subscriptions = make(map[string]MessageFunction)
	s.Context = nil
	s.Router.Navigate(url)
	s.URL = url
	s.RedrawOnResize = false
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
	if context == nil {
		print("reload to ", s.URL)
		s.Router.Navigate(s.URL)
	} else {
		s.Router.Navigate(context.Path)
	}
}

func (s *GlobalSessionData) Mobile() bool {
	return dom.GetWindow().InnerWidth() < 740
}

func (s *GlobalSessionData) Resize() {
	// print("resize event", dom.GetWindow().InnerWidth(), dom.GetWindow().InnerHeight(), Session.Mobile())
	doIt := false
	if s.RedrawOnResize {
		doIt = true
		print("Redraw due to resize")
	}
	if !doIt && s.MobileSensitive && (s.Mobile() != s.wasMobile) {
		doIt = true
		print("Major Redraw due to change from mobile to non-mobile or vise versa")
	}
	s.wasMobile = s.Mobile()
	if doIt {
		formulate.Templates(GetTemplate)
		s.Reload(s.Context)
	}
}

func main() {
	initRouter()
	formulate.Templates(GetTemplate)
	websocketInit()
	initForms()
	grid1()

	js.Global.Set("resize", func() {
		Session.Resize()
	})
}

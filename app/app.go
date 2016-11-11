package main

import (
	"fmt"
	"strconv"

	"./shared"
	"github.com/go-humble/locstor"
	"github.com/go-humble/router"
	"github.com/gopherjs/gopherjs/js"
	"github.com/steveoc64/formulate"
	"honnef.co/go/js/dom"
)

type MessageFunction func(string, *shared.NetData, *router.Context)

type GlobalSessionData struct {
	Version              string
	Username             string
	Passwd               string
	Rank                 int
	UserID               int
	CanAllocate          bool
	Channel              int
	Router               *router.Router
	AppFn                map[string]router.Handler
	Subscriptions        map[string]MessageFunction
	Context              *router.Context
	ID                   map[string]int
	URL                  string
	Disqus               bool
	Lookup               shared.LookupTable
	MaxGames             int
	MaxScenarios         int
	MaxPlayers           int
	EditGame             *shared.Game
	RedrawOnResize       bool
	MobileSensitive      bool
	OrientationSensitive bool
	wasMobile            bool
	LastWidth            int
	Orientation          string
	wasSubmobile         bool
	TilesChanged         bool
	TeamsChanged         bool
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

func (s *GlobalSessionData) SynchEditGame() {

	go func() {
		if s.TeamsChanged {
			s.TeamsChanged = false
			done := false
			err := RPC("GameRPC.UpdateTeams", shared.GameRPCData{
				Channel: Session.Channel,
				ID:      s.EditGame.ID,
				Game:    s.EditGame,
			}, &done)
			if err != nil {
				print(err.Error())
			}
		}
		if s.TilesChanged {
			s.TilesChanged = false
			err := RPC("GameRPC.SaveTiles", shared.GameRPCData{
				Channel: Session.Channel,
				ID:      s.EditGame.ID,
				Game:    s.EditGame,
			}, &s.EditGame.CheckTable)
			if err != nil {
				print(err.Error())
			}
		}
	}()
}

func (s *GlobalSessionData) Navigate(url string) {

	if s.TeamsChanged || s.TilesChanged {
		s.SynchEditGame()
	}
	// print("Navigate to", url)
	// On navigate, clear out any subscriptions on events
	locstor.SetItem("navigate", url)
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
	if s.TeamsChanged || s.TilesChanged {
		s.SynchEditGame()
	}
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
		// print("reload to ", s.URL)
		s.Router.Navigate(s.URL)
	} else {
		s.Router.Navigate(context.Path)
	}
}

func (s *GlobalSessionData) Mobile() bool {
	return dom.GetWindow().InnerWidth() < 740
}

func (s *GlobalSessionData) SubMobile() bool {
	return dom.GetWindow().InnerWidth() < 700
}

func (s *GlobalSessionData) Resize() {
	// print("resize event", dom.GetWindow().InnerWidth(), dom.GetWindow().InnerHeight(), Session.Mobile())
	if s.OrientationSensitive {
		w := dom.GetWindow()
		o := s.Orientation
		s.Orientation = "Landscape"
		if w.InnerHeight() > w.InnerWidth() {
			s.Orientation = "Portrait"
		}
		if s.Orientation != o {
			// print("Redraw due to orientation change")
			// dom.GetWindow().Alert("orientation change")
			formulate.Templates(GetTemplate)
			s.Reload(s.Context)
		}
	}

	doIt := false
	if s.RedrawOnResize {
		doIt = true
		// print("Redraw due to resize")
	}
	if !doIt && s.MobileSensitive {
		if s.Mobile() != s.wasMobile {
			doIt = true
			// print("Major Redraw due to change from mobile to non-mobile or vise versa")
			// dom.GetWindow().Alert("changed to mobile")
		}
		if s.SubMobile() != s.wasSubmobile {
			doIt = true
			// print("redraw due to change of orientation only, inside mobile mode")
			// dom.GetWindow().Alert("changed to submobile")
		}
	}

	s.wasMobile = s.Mobile()
	s.wasSubmobile = s.SubMobile()
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
	// gob.RegisterName("shared.Game", shared.Game{})

	// cv := js.Global.Get("codeVersion")
	// print("cv", cv)
	// doc.DocumentElement().Underlying().Call("requestFullScreen")

	Session.LastWidth = dom.GetWindow().InnerWidth()
	Session.Orientation = "Landscape"
	if dom.GetWindow().InnerHeight() > dom.GetWindow().InnerWidth() {
		Session.Orientation = "Portrait"
	}
	if Session.Mobile() {
		Session.wasMobile = true
	}
	if Session.SubMobile() {
		Session.wasSubmobile = true
	}

	js.Global.Set("resize", func() {
		Session.Resize()
	})

	username, _ := locstor.GetItem("username")
	pw, _ := locstor.GetItem("secret")
	url, _ := locstor.GetItem("navigate")
	game_id, _ := locstor.GetItem("game_id")
	// print("u", username, "p", pw, "url", url, "game_id", game_id)
	if username != "" && pw != "" {
		_Login(username, pw, false)
		if Session.UserID != 0 {
			if game_id != "" {
				gid, err := strconv.Atoi(game_id)
				if err != nil {
					print(err.Error())
				} else { // has a gameid on file
					go func() {
						err = RPC("GameRPC.Get", shared.GameRPCData{
							Channel: Session.Channel,
							ID:      gid,
						}, &Session.EditGame)
						if err == nil {
							// print("loaded game and nav to", Session.EditGame, url)
							if url != "/" {
								Session.Navigate(url)
							}
						}
					}()
				}
			} else if url != "" {
				// print("no game set, but nav to ", url)
				if url != "/" {
					Session.Navigate(url)
				}
			}
		} else { // login failed
			// print("autologin failed")
			grid1()
			loginForm()
		}
	} else { // no username and passwd on file
		// print("no up on file")
		grid1()
	}
}

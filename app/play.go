package main

import (
	"strconv"

	"./shared"
	"github.com/go-humble/router"
	"honnef.co/go/js/dom"
)

func play(context *router.Context) {
	Session.Subscribe("Play", _play, context)
	_play("Edit", 0, context)
}

func _play(action string, actionID int, context *router.Context) {
	id, err := strconv.Atoi(context.Params["id"])
	if err != nil {
		print(err.Error())
		return
	}

	switch action {
	default:
		print("play", action, actionID)
	}

	// w := dom.GetWindow()
	// doc := w.Document()
	Session.MobileSensitive = true
	Session.OrientationSensitive = true

	go func() {
		game := shared.Game{}
		// TheCmd := &shared.GameCmd{}
		// TheUnit := &shared.Unit{}
		flipped := false

		err := RPC("GameRPC.GetPlay", shared.GameRPCData{
			Channel: Session.Channel,
			ID:      id,
		}, &game)
		if err != nil || game.ID == 0 {
			dom.GetWindow().Alert("Cannot load game" + err.Error())
			Session.Navigate("/")
		}

		if game.Red {
			flipped = game.RedFlip
		} else {
			if game.Blue {
				flipped = game.BlueFlip
			}
		}
		print("flipped", flipped)
		Session.MobileSensitive = true
		if Session.Mobile() {
			loadTemplate("play-console-mobile", "main", &game)
		} else {
			loadTemplate("play-console", "main", &game)
		}
		w := dom.GetWindow()
		doc := w.Document()
		doc.QuerySelector("[name=play-console]").AddEventListener("click", false, func(evt dom.Event) {
			if evt.Target().TagName() == "INPUT" {
				if evt.Target().(*dom.HTMLInputElement).Value == "Close" {
					Session.Navigate("/")
				}
			}
		})
	}()
}

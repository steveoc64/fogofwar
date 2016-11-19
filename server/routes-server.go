package main

import "../shared"

func getRoutes(uid int, rank int) []shared.UserRoute {

	if uid < 1 || rank < 1 {
		return []shared.UserRoute{}
	}

	retval := []shared.UserRoute{
		{Route: "/", Func: "mainpage"},
		{Route: "/games", Func: "mainpage"},
		{Route: "/manual", Func: "manual"},
		{Route: "/contact", Func: "contact"},
		{Route: "/invite", Func: "invite"},
		{Route: "/settings", Func: "settings"},
		{Route: "/scenarios", Func: "scenarios"},
		{Route: "/scenario/add", Func: "scenario-add"},
		{Route: "/scenario/{id}", Func: "scenario-edit"},
		{Route: "/scenario/{id}/fork", Func: "scenario-fork"},
		{Route: "/scenario/{id}/red", Func: "scenario-red"},
		{Route: "/scenario/{id}/red/add", Func: "scenario-red-add"},
		{Route: "/force/{id}", Func: "force-edit"},
		{Route: "/scenario/{id}/blue", Func: "scenario-blue"},
		{Route: "/scenario/{id}/blue/add", Func: "scenario-blue-add"},
		{Route: "/game/invite/{id}", Func: "game-invite"},
		{Route: "/game/new", Func: "game-new"},
		{Route: "/game/{id}", Func: "game-edit-checklist"},
		{Route: "/game/{id}/overview", Func: "game-edit-overview"},
		{Route: "/game/{id}/checklist", Func: "game-edit-checklist"},
		{Route: "/game/{id}/red", Func: "game-edit-red"},
		{Route: "/game/{id}/blue", Func: "game-edit-blue"},
		{Route: "/game/{id}/hosting", Func: "game-edit-hosting"},
		// {Route: "/game/{id}/table", Func: "game-edit-table"},
		{Route: "/game/{id}/table/{mode}", Func: "game-edit-table"},
		{Route: "/game/{id}/players", Func: "game-edit-players"},

		{Route: "/play/{game}", Func: "play"},
		{Route: "/play/{game}/orders", Func: "play-orders"},
		{Route: "/play/{game}/orders/{corps}", Func: "play-orders-corps"},
		{Route: "/play/{game}/commander", Func: "play-commander-action"},

		{Route: "/play/{game}/map", Func: "play-map"},
		{Route: "/play/{game}/units", Func: "play-units"},
		{Route: "/play/{game}/units/div", Func: "play-units-div"},
		{Route: "/play/{game}/fight/new", Func: "play-new-fight"},
		{Route: "/play/{game}/fight/{fight}", Func: "play-fight"},

		{Route: "/play/{game}/bombard", Func: "play-bombard"},
		{Route: "/play/{game}/bombard/unit", Func: "play-bombard-unit"},
		{Route: "/play/{game}/bombard/target", Func: "play-bombard-target"},
		{Route: "/play/{game}/bombard/fire", Func: "play-bombard-fire"},
	}

	more := []shared.UserRoute{}
	switch rank {
	case 2: // Captain gets more options
	case 3: // Major gets more options
	case 4: // Colonel gets more options
	case 5: // Brigadier gets more options
	case 6: // General gets more options
	case 10: // Emporer gets more options
		more = []shared.UserRoute{
			{Route: "/usersonline", Func: "usersonline"},
			{Route: "/users", Func: "users"},
			{Route: "/user/{id}", Func: "user-edit"},
		}
	}
	if len(more) > 0 {
		retval = append(retval, more...)
	}

	return retval
}

package main

import "../shared"

func getRoutes(uid int, rank int) []shared.UserRoute {

	if uid < 1 || rank < 1 {
		return []shared.UserRoute{}
	}

	retval := []shared.UserRoute{
		{Route: "/", Func: "mainpage"},
		{Route: "/settings", Func: "settings"},
		{Route: "/manual", Func: "manual"},
		{Route: "/scenarios", Func: "scenarios"},
		{Route: "/scenario/add", Func: "scenario-add"},
		{Route: "/scenario/{id}", Func: "scenario-edit"},
		{Route: "/scenario/{id}/fork", Func: "scenario-fork"},
		{Route: "/scenario/{id}/red", Func: "scenario-red"},
		{Route: "/scenario/{id}/red/add", Func: "scenario-red-add"},
		{Route: "/force/{id}", Func: "force-edit"},
		{Route: "/scenario/{id}/blue", Func: "scenario-blue"},
		{Route: "/scenario/{id}/blue/add", Func: "scenario-blue-add"},
		{Route: "/game/new", Func: "game-new"},
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

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
		{Route: "/campaign", Func: "campaign"},
		{Route: "/campaign/add", Func: "campaign-add"},
		{Route: "/campaign/{id}", Func: "campaign-edit"},
		{Route: "/army/{campaign}/add", Func: "army-add"},
		{Route: "/army/{id}", Func: "army-edit"},
		{Route: "/command/{army}/add", Func: "command-add"},
		{Route: "/command/{id}", Func: "command-edit"},
		{Route: "/scenario/{campaign}/add", Func: "scenario-add"},
		{Route: "/scenario/{id}", Func: "scenario-edit"},
		{Route: "/scommand/{scenario}/add", Func: "scommand-add"},
		{Route: "/scommand/{id}", Func: "scommand-edit"},
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
		}
	}
	if len(more) > 0 {
		retval = append(retval, more...)
	}

	return retval
}

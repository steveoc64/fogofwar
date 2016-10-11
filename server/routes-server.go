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
		{Route: "/scenario", Func: "scenario"},
		{Route: "/scenario/add", Func: "scenario-add"},
		{Route: "/scenario/{id}", Func: "scenario-edit"},
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

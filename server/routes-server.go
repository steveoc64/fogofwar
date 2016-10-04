package main

import "../shared"

func getRoutes(uid int, rank int) []shared.UserRoute {

	switch rank {
	default:
		return []shared.UserRoute{
			{Route: "/", Func: "main"},
			{Route: "/usersonline", Func: "usersonline"},
		}
	}
	return []shared.UserRoute{}

}

package main

import (
	"fmt"
	"time"

	"../shared"
)

type GameRPC struct{}

func (g *GameRPC) List(data shared.GameRPCData, retval *[]shared.Game) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	err := DB.SQL(`select
			g.*,u.username as host_name,u.email as host_email,
				coalesce(p_red.reds, 0) as num_red_players,
				coalesce(p_blue.blues, 0) as num_blue_players
		from game g
			left join users u on u.id=g.hosted_by
	 		left join (select game_id, count(*) as reds from game_players where red_team group by 1) p_red on p_red.game_id=g.id
	 		left join (select game_id, count(*) as blues from game_players where blue_team group by 1) p_blue on p_blue.game_id=g.id
		where g.hosted_by=$1`, conn.UserID).QueryStructs(retval)

	logger(start, "Game.List", conn,
		"",
		fmt.Sprintf("%d Records", len(*retval)))

	return err
}

func (g *GameRPC) ListInvites(data shared.GameRPCData, retval *[]shared.Game) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	err := DB.SQL(`select
			g.*,u.username as host_name,u.email as host_email,
				coalesce(p_red.reds, 0) as num_red_players,
				coalesce(p_blue.blues, 0) as num_blue_players
		from game g
			left join users u on u.id=g.hosted_by
	 		left join (select game_id, count(*) as reds from game_players where red_team group by 1) p_red on p_red.game_id=g.id
	 		left join (select game_id, count(*) as blues from game_players where blue_team group by 1) p_blue on p_blue.game_id=g.id
		where g.hosted_by != $1
			and g.id in (select game_id from game_players where player_id=$1)`, conn.UserID).QueryStructs(retval)

	logger(start, "Game.ListInvites", conn,
		"",
		fmt.Sprintf("%d Records", len(*retval)))

	return err
}

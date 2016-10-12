package shared

import "time"

type Game struct {
	ID         int        `db:"id"`
	ScenarioID int        `db:"scenario_id"`
	HostedBy   int        `db:"hosted_by"`
	Created    *time.Time `db:"created"`
	Expires    *time.Time `db:"expires"`
	Turn       int        `db:"turn"`
	TurnLimit  int        `db:"turn"`
}

type GameRPCData struct {
	Channel int
	ID      int
	Game    *Game
}

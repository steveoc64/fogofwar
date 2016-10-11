package shared

import "time"

type Scenario struct {
	ID         int        `db:"id"`
	CampaignID int        `db:"campaign_id"`
	AuthorID   int        `db:"author_id"`
	AuthorName string     `db:"author_name"`
	ForkedFrom int        `db:"forked_from"`
	Name       string     `db:"name"`
	Year       int        `db:"year"`
	Descr      string     `db:"descr"`
	Notes      string     `db:"notes"`
	Created    *time.Time `db:"created"`
	LatLon     *[]int     `db:"latlon"`
	Public     bool       `db:"public"`
	RedTeam    string     `db:"red_team"`
	RedBrief   string     `db:"red_brief"`
	BlueTeam   string     `db:"blue_team"`
	BlueBrief  string     `db:"blue_brief"`
}

type ScenarioRPCData struct {
	Channel  int
	ID       int
	Scenario *Scenario
}

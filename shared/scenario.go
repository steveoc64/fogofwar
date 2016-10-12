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

type Force struct {
	ID           int    `db:"id"`
	ScenarioID   int    `db:"scenario_id"`
	ScenarioName string `db:"scenario_name"`
	RedTeam      bool   `db:"red_team"`
	BlueTeam     bool   `db:"blue_team"`
	Nation       string `db:"nation"`
	Name         string `db:"name"`
	CmdrName     string `db:"cmdr_name"`
	Level        int    `db:"level"`
	LevelName    string `db:"level_name"`
	Descr        string `db:"descr"`
	Rating       int    `db:"rating"`
	Insipration  int    `db:"inspiration"`
	Condition    int    `db:"condition"`
}

type ForceRPCData struct {
	Channel int
	ID      int
	Force   *Force
}

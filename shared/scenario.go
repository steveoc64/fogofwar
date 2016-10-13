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
	ID            int         `db:"id"`
	ScenarioID    int         `db:"scenario_id"`
	ScenarioName  string      `db:"scenario_name"`
	RedTeam       bool        `db:"red_team"`
	BlueTeam      bool        `db:"blue_team"`
	Nation        string      `db:"nation"`
	Name          string      `db:"name"`
	CommanderName string      `db:"cmdr_name"`
	Level         int         `db:"level"`
	LevelName     string      `db:"level_name"`
	Descr         string      `db:"descr"`
	Rating        int         `db:"rating"`
	Inspiration   int         `db:"inspiration"`
	Condition     int         `db:"condition"`
	Units         []ForceUnit `db:"units"`
}

func (f *Force) DifferentTo(other Force) bool {
	if f.Nation == other.Nation &&
		f.Name == other.Name &&
		f.CommanderName == other.CommanderName &&
		f.Level == other.Level &&
		f.Descr == other.Descr &&
		f.Rating == other.Rating &&
		f.Inspiration == other.Inspiration &&
		f.Condition == other.Condition {
		return false
	}
	return true
}

type ForceRPCData struct {
	Channel int
	ID      int
	Force   *Force
}

type ForceUnit struct {
	ID            int    `db:"id"`
	ForceID       int    `db:"force_id"`
	Path          string `db:"path"`
	Name          string `db:"name"`
	CommanderName string `db:"commander_name"`
	Nation        string `db:"nation"`
	UType         int    `db:"utype"`
	CmdLevel      int    `db:"cmd_level"`
	Drill         int    `db:"drill"`
	Bayonets      int    `db:"bayonets"`
	SmallArms     int    `db:"small_arms"`
	EliteArms     int    `db:"elite_arms"`
	LtCoy         int    `db:"lt_coy"`
	JgCoy         int    `db:"jg_coy"`
	Rating        int    `db:"rating"`
	Sabres        int    `db:"sabres"`
	CavType       int    `db:"cav_type"`
	CavRating     int    `db:"cav_rating"`
	Guns          int    `db:"guns"`
	GunneryType   int    `db:"gunnery_type"`
	GunCondition  int    `db:"gun_condition"`
}

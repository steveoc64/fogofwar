package shared

import (
	"fmt"
	"time"
)

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
	ScenarioName  string      `db:"scenario_name"` // derived data
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
	Bayonets      *int        `db:"bayonets"` // derived data
	Sabres        *int        `db:"sabres"`   // derived data
	Guns          *int        `db:"guns"`     // derived data
}

func (f *Force) Summarize() string {
	retval := "( "
	if f.Bayonets != nil {
		retval += fmt.Sprintf("%d", *f.Bayonets)
	}
	retval += " / "
	if f.Sabres != nil {
		retval += fmt.Sprintf("%d", *f.Sabres)
	}
	retval += " / "
	if f.Guns != nil {
		retval += fmt.Sprintf("%d", *f.Guns)
	}
	retval += " )"
	return retval
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
	HorseGuns     bool   `db:"horse_guns"`
	GunneryType   int    `db:"gunnery_type"`
	GunCondition  int    `db:"gun_condition"`
}

func (u *ForceUnit) GetBases() string {
	retval := ""
	if u.Bayonets > 75 {
		cnt := ((u.Bayonets + 350) / 450)
		if cnt > 1 {
			if cnt%2 > 0 {
				retval += fmt.Sprintf(" %d½ Bn", cnt/2)
			} else {
				retval += fmt.Sprintf(" %d Bn", cnt/2)
			}
		} else {
			retval += " ½Bn"
		}
	}

	x := u.LtCoy + u.JgCoy
	if x > 0 {
		retval += fmt.Sprintf(" +%d LtCoy", x)
	}

	if u.Sabres > 0 {
		if retval != "" {
			retval += "<br>\n"
		}
		cnt := (u.Sabres + 60) / 75 // total number of half sqns
		if cnt > 1 {
			if cnt%2 > 0 {
				retval += fmt.Sprintf(" %d½ Sqn", cnt/2)
			} else {
				retval += fmt.Sprintf(" %d Sqn", cnt/2)
			}
		} else {
			retval += " ½Sqn"
		}
	}
	if u.Guns > 0 {
		if retval != "" {
			retval += "<br>\n"
		}
		cnt := u.Guns // Actual Guns
		gunType := ""
		addGun := " gun"
		horse := ""
		if u.HorseGuns {
			horse = "Horse "
		}
		switch u.GunneryType {
		case 1:
			gunType = " 12lb"
		case 2:
			gunType = " 6lb"
		case 3:
			gunType = " 3lb"
		case 4:
			gunType = " Hw"
			horse = ""
			addGun = ""
		}

		// Based on 2 guns to a section
		// 3-4 is a Half Bty
		// Up to 8 is a Bty
		if cnt >= 2 { // Then its at least a section
			if cnt >= 3 { // Then its at least a half bty
				if cnt > 4 { // Then its at least a Bty
					if cnt > 8 { // Then its multiple Btys
						halfBtys := (cnt + 3) / 4
						if halfBtys%2 > 0 { // has a half Bty in there somewhere
							retval += fmt.Sprintf(" %d½ %s %sBtys", halfBtys/2, gunType, horse)
						} else {
							retval += fmt.Sprintf(" %d %s %sBtys", halfBtys/2, gunType, horse)
						}

					} else {
						retval += gunType + " " + horse + "Bty"
					}
				} else {
					retval += " ½Bty of" + gunType
					if u.HorseGuns {
						retval += " Horse Art."
					}
				}
			} else {
				retval += " Sect of" + gunType
				if u.HorseGuns {
					retval += " Horse Art."
				}
			}
		} else if cnt > 0 {
			if retval != "" {
				retval += " and"
			}
			retval += " a" + gunType + addGun
		}
	}
	return "&nbsp;" + retval
}

type ForceUnitRPCData struct {
	Channel    int
	ID         int
	UType      int
	ParentPath string
	ForceUnit  *ForceUnit
}

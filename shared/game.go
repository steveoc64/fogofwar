package shared

import (
	"crypto/md5"
	"fmt"
	"strings"
	"time"
)

const (
	TileClear int = iota
	TileRough
	TileWoods
	TileBuilding
	TileFort
	TileWater
	TileWater1
	TileWater2
)

type Tile struct {
	X       int `db:"x"`
	Y       int `db:"y"`
	I       int `db:"i"`
	Height  int `db:"height"`
	Content int `db:"content"`
	Owner   int `db:"owner"` // 0 neutral  -1/-2 red 1/2 blue
}

func (t *Tile) GetCSS() string {
	return fmt.Sprintf("tile-content-%d-%d", t.Height, t.Content)
}

func (t *Tile) ApplyTerrain(mode string) {
	// print("ApplyMode", mode, "to tile", t)
	switch mode {
	case "Clear":
		t.Content = TileClear
	case "Rough":
		t.Content = TileRough
	case "Woods":
		t.Content = TileWoods
	case "Built":
		t.Content = TileBuilding
	case "Fort":
		t.Content = TileFort
	case "Water -":
		t.Content = TileWater
		t.Height = 0
	case "Water /":
		t.Content = TileWater1
		t.Height = 0
	case `Water \`:
		t.Content = TileWater2
		t.Height = 0
	case "Higher":
		if t.Height < 1 {
			t.Height++
			if t.Content >= TileWater {
				t.Content = TileClear
			}
		}
	case "Lower":
		if t.Height > 0 {
			t.Height--
		}
	case "Both Sides":
	case "Red Objective":
	case "Blue Objective":
	case "Neutral":
		t.Owner = 0
	case "Red":
		t.Owner--
		if t.Owner < -3 {
			t.Owner = -3
		}
	case "Blue":
		t.Owner++
		if t.Owner > 3 {
			t.Owner = 3
		}

	}
}

func (t *Tile) ApplyObjective(mode string) {
	print("creating tile objective")
}

type Game struct {
	ID              int              `db:"id"`
	ScenarioID      int              `db:"scenario_id"`
	HostedBy        int              `db:"hosted_by"`
	HostName        string           `db:"host_name"`
	HostEmail       string           `db:"host_email"`
	Created         *time.Time       `db:"created"`
	StartDate       *time.Time       `db:"start_date"`
	Expires         *time.Time       `db:"expires"`
	Turn            int              `db:"turn"`
	TurnLimit       int              `db:"turn_limit"`
	Name            string           `db:"name"`
	Descr           string           `db:"descr"`
	Notes           string           `db:"notes"`
	Year            int              `db:"year"`
	LatLon          *[]int           `db:"latlon"`
	RedTeam         string           `db:"red_team"`
	RedBrief        string           `db:"red_brief"`
	BlueTeam        string           `db:"blue_team"`
	BlueBrief       string           `db:"blue_brief"`
	NumRedPlayers   int              `db:"num_red_players"`
	NumBluePlayers  int              `db:"num_blue_players"`
	RedCmd          []*GameCmd       `db:"red_cmd"`
	BlueCmd         []*GameCmd       `db:"blue_cmd"`
	Objectives      []*GameObjective `db:"objectives"`
	TableX          int              `db:"table_x"`
	TableY          int              `db:"table_y"`
	KmX             int              `db:"km_x"`
	KmY             int              `db:"km_y"`
	GridSize        int              `db:"grid_size"`
	GridX           int              `db:"grid_x"`
	GridY           int              `db:"grid_y"`
	Tiles           []*Tile          `db:"tiles"`
	TileX           int              `db:"tile_x"`
	TileY           int              `db:"tile_y"`
	InMode          string           `db:"in_mode"`
	CheckTable      bool             `db:"check_table"`
	CheckObjectives bool             `db:"check_objectives"`
	CheckZones      bool             `db:"check_zones"`
	CheckForces     bool             `db:"check_forces"`
	CheckPlayers    bool             `db:"check_players"`
}

type GameRPCData struct {
	Channel int
	ID      int
	Red     bool
	Blue    bool
	Game    *Game
}

func (g *Game) AddObjective(x, y int) *GameObjective {

	// Firstly, see if its already there
	for _, v := range g.Objectives {
		if v.X == x && v.Y == y {
			print("got existing at that location")
			return v
		}
	}

	// Need to create a new one
	newObj := &GameObjective{
		X:         x,
		Y:         y,
		RedVP:     20,
		BlueVP:    20,
		VPPerTurn: 1,
	}
	g.Objectives = append(g.Objectives, newObj)
	print("added new obj", g.Objectives)
	return newObj
}

func (g *Game) GoodToGo() bool {
	return g.CheckTable && g.CheckObjectives && g.CheckZones && g.CheckPlayers && g.CheckForces
}

func (g *Game) CalcKm() {
	if g.GridSize == 0 {
		g.KmX = 0
		g.KmY = 0
	} else {
		g.KmX = (g.TableX * 4800) / g.GridSize
		g.KmY = (g.TableY * 4800) / g.GridSize
	}
}

func (g *Game) CalcGrid() {
	if g.GridSize == 0 {
		g.GridX = 0
		g.GridY = 0
	} else {
		g.GridX = (g.TableX * 12) / g.GridSize
		g.GridY = (g.TableY * 12) / g.GridSize
	}
}

func (g *Game) InitTiles() {
	g.CalcGrid()
	g.Tiles = make([]*Tile, g.GridX*g.GridY)
	g.TileX = g.GridX
	g.TileY = g.GridY

	// and then stamp the coords on the actual tile objects
	i := 0
	for y := 0; y < g.GridY; y++ {
		for x := 0; x < g.GridX; x++ {
			g.Tiles[i] = &Tile{
				X: x,
				Y: y,
				I: i,
			}
			// g.Tiles[i].X = x
			// g.Tiles[i].Y = y
			i++
		}
	}
	// print("done all that, and tiles is now", g.Tiles)
}

// Utility func for getting the tile X and Y coords in sync with the grid size
func (g *Game) XYTiles() {
	g.CalcGrid()
	print("XY stamping all the tiles")

	// and then stamp the coords on the actual tile objects
	i := 0
	for y := 0; y < g.GridY; y++ {
		for x := 0; x < g.GridX; x++ {
			g.Tiles[i].X = x
			g.Tiles[i].Y = y
			i++
		}
	}
	// print("done all that, and tiles is now", g.Tiles)
}

func (g *Game) GetTile(i int) *Tile {
	// print("GetTile", i)
	if i < 0 {
		print("index too low")
		return nil
	}
	if i >= g.TileY*g.TileX {
		print("too far out")
		return nil
	}
	// print("I can see", g.Tiles[i])
	if g.TileX > 0 {
		row := i / g.TileX
		print("that looks to be on row", row)
		g.Tiles[i].Y = row
		col := i - (row * g.TileX)
		print("col looks like", col)
		g.Tiles[i].X = col
	}
	return g.Tiles[i]
}

func (g *Game) GetTileXY(x, y int) *Tile {
	i := (y * g.TileX) + x
	// print("getting old tile ", x, y, i)
	return g.Tiles[i]
}

func (g *Game) ResizeTiles() {
	g.CalcGrid()

	if g.TableX > 16 {
		g.TableX = 16
	}
	if g.TableY > 8 {
		g.TableY = 8
	}

	newTiles := make([]*Tile, g.GridX*g.GridY)
	i := 0
	for y := 0; y < g.GridY; y++ {
		i = y * g.GridX
		for x := 0; x < g.GridX; x++ {
			// print("new offset", x, y, i)
			if x < g.TileX && y < g.TileY {
				// then the tile exists in the old grid, so grab it into the new grid
				oldTile := g.GetTileXY(x, y)
				newTiles[i] = &Tile{
					X:       oldTile.X,
					Y:       oldTile.Y,
					I:       i,
					Height:  oldTile.Height,
					Content: oldTile.Content,
					Owner:   oldTile.Owner,
				}
				// print("made new tile from old", x, y, i, newTiles[i], oldTile)
			} else { // else new tile is completely fresh
				newTiles[i] = &Tile{
					X:       x,
					Y:       y,
					I:       i,
					Height:  0,
					Content: 0,
					Owner:   0,
				}
				// print("Fresh new tile", x, y, i, newTiles[i])
			}

			// And restamp the coords on the new tile
			i++
		}
	}
	g.TileX = g.GridX
	g.TileY = g.GridY
	g.Tiles = newTiles
	print("is complete", g.Tiles)
}

func (g *Game) ShowKmX() string {
	// print("computing kmx")
	return fmt.Sprintf("%02f", float64(g.KmX)/1000.0)
}
func (g *Game) ShowKmY() string {
	// print("computing kmy")
	return fmt.Sprintf("%02f", float64(g.KmY)/1000.0)
}

func (g *Game) GetAvatar(size int) string {
	theEmail := strings.TrimSpace(strings.ToLower(g.HostEmail))
	avatar := md5.Sum([]byte(theEmail))
	// print("compute avatar for", theEmail)
	avatarURL := fmt.Sprintf("https://www.gravatar.com/avatar/%x?d=wavatar&s=%d", avatar, size)
	// print("got", avatarURL)
	return avatarURL
}

func (g *Game) GetPlayers() string {
	return fmt.Sprintf("%d vs %d", g.NumRedPlayers, g.NumBluePlayers)
}

type GameCmd struct {
	ID            int    `db:"id"`
	GameID        int    `db:"game_id"`
	GameName      string `db:"game_name"` // derived data
	RedTeam       bool   `db:"red_team"`
	BlueTeam      bool   `db:"blue_team"`
	Nation        string `db:"nation"`
	Name          string `db:"name"`
	CommanderName string `db:"commander_name"`
	Level         int    `db:"level"`
	LevelName     string `db:"level_name"`
	Descr         string `db:"descr"`
	Rating        int    `db:"rating"`
	Inspiration   int    `db:"inspiration"`
	Condition     int    `db:"condition"`
	PlayerID      *int   `db:"player_id"`
	Disabled      bool   `db:"disabled"`
	Units         []Unit `db:"units"`
	Bayonets      *int   `db:"bayonets"` // derived data
	Sabres        *int   `db:"sabres"`   // derived data
	Guns          *int   `db:"guns"`     // derived data
}

func (f *GameCmd) Summarize() string {
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

type Unit struct {
	ID               int    `db:"id"`
	CmdID            int    `db:"cmd_id"`
	Path             string `db:"path"`
	Name             string `db:"name"`
	Descr            string `db:"descr"`
	CommanderName    string `db:"commander_name"`
	CommanderControl int    `db:"commander_control"`
	Condition        int    `db:"condition"`
	Nation           string `db:"nation"`
	UType            int    `db:"utype"`
	CmdLevel         int    `db:"cmd_level"`
	Drill            int    `db:"drill"`
	Bayonets         int    `db:"bayonets"`
	SmallArms        int    `db:"small_arms"`
	EliteArms        int    `db:"elite_arms"`
	LtCoy            int    `db:"lt_coy"`
	JgCoy            int    `db:"jg_coy"`
	Rating           int    `db:"rating"`
	Sabres           int    `db:"sabres"`
	CavType          int    `db:"cav_type"`
	CavRating        int    `db:"cav_rating"`
	Guns             int    `db:"guns"`
	HorseGuns        bool   `db:"horse_guns"`
	GunneryType      int    `db:"gunnery_type"`
	GunCondition     int    `db:"gun_condition"`
	TableSecton      int    `db:"table_section"`
	DeployTo         int    `db:"deploy_to"`
	GTFormation      int    `db:"gt_formation"`
	SKOut            bool   `db:"sk_out"`
	Woods            bool   `db:"woods"`
	Rough            bool   `db:"rough"`
	Cover            bool   `db:"cover"`
	RFlank           bool   `db:""`
	LFlank           bool   `db:""`
	HasSupport       bool   `db:""`
	BayonetsLost     int    `db:""`
	BayonetsMState   int    `db:""`
	BayonetsMoved    bool   `db:""`
	BayonetsFired    bool   `db:""`
	LTLost           int    `db:"lt_lost"`
	LTMState         int    `db:"lt_mstate"`
	SabresLost       int    `db:"sabres_lost"`
	SabresMState     int    `db:"sabres_mstate"`
	GunsLost         int    `db:"guns_lost"`
	GunsFired        bool   `db:"guns_fired"`
	GunsMoved        bool   `db:"guns_moved"`
	GunsLimbered     bool   `db:"guns_limbered"`
	GunsMState       int    `db:"guns_mstate"`
	GunMaxCondition  int    `db:"gun_max_condition"`
}

func (u *Unit) GetBases() string {
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
			gunType = " 9lb"
		case 3:
			gunType = " 6lb"
		case 4:
			gunType = " 3lb"
		case 5:
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

type GameObjective struct {
	ID           int    `db:"id"`
	Name         string `db:"name"`
	GameID       int    `db:"game_id"`
	X            int    `db:"x"`
	Y            int    `db:"y"`
	VPPerTurn    int    `db:"vp_per_turn"`
	RedVP        int    `db:"red_vp"`
	BlueVP       int    `db:"blue_vp"`
	CurrentOwner int    `db:"current_owner"`
}

func (g *GameObjective) GetCSS() string {
	return "tile-objective"
}

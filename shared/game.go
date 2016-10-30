package shared

import (
	"crypto/md5"
	"fmt"
	"math/rand"
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
	case "River -":
		t.Content = TileWater
		t.Height = 0
	case "River /":
		t.Content = TileWater1
		t.Height = 0
	case `River \`:
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
	ID              int `db:"id"`
	Red             bool
	Blue            bool
	Team            string
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
	CheckForces     bool             `db:"check_forces"`
	CheckPlayers    bool             `db:"check_players"`
	CheckConnected  bool             `db:"check_connected"`
	RedFlip         bool             `db:"red_flip"`
	Mobile          bool             // Derived field based on is mobile - useful for templates
	AssignToPlayer  string           // scratchpad used for editting
	Included        bool             // scratchpad
	StartTurn       int              // scratchpad
	ObjectiveName   string
	VPPerTurn       int
	RedVP           int
	BlueVP          int
	RedPlayers      []GamePlayerData
	BluePlayers     []GamePlayerData
}

type GamePlayerData struct {
	Username string `db:"username"`
	Accepted bool   `db:"accepted"`
}

type GamePlayers struct {
	GameID   int  `db:"game_id"`
	PlayerID int  `db:"player_id"`
	RedTeam  bool `db:"red_team"`
	BlueTeam bool `db:"blue_team"`
	Accepted bool `db:"accepted"`
}

type GameRPCData struct {
	Channel  int
	ID       int
	Red      bool
	Blue     bool
	GetUnits bool
	Game     *Game
}

func (g *Game) GetStartDate() string {
	return g.StartDate.Format("Mon, Jan 2 2006")
}

type GamePlayerRow struct {
	Red  GamePlayerData
	Blue GamePlayerData
}

func (g *Game) GetPlayerRows() []GamePlayerRow {
	lr := len(g.RedPlayers)
	lb := len(g.BluePlayers)
	numRows := lr
	if lb > lr {
		numRows = lb
	}
	retval := make([]GamePlayerRow, numRows)
	for i, v := range g.RedPlayers {
		retval[i].Red = v
	}
	for i, v := range g.BluePlayers {
		retval[i].Blue = v
	}
	return retval
}

func (g *Game) GoodToGo() bool {
	return g.CheckTable && g.CheckObjectives && g.CheckPlayers && g.CheckForces && g.CheckConnected
}

func (g *Game) GetStatusIcon() string {
	// print("getting status icon")
	if !g.CheckTable {
		return "fa fa-table fa-lg"
	}
	if !g.CheckObjectives {
		return "fa fa-star fa-lg"
	}
	if !g.CheckForces {
		return "fa fa-flag fa-lg"
	}
	if !g.CheckPlayers {
		return "fa fa-user fa-lg"
	}
	if !g.CheckConnected {
		return "fa fa-circle-o-notch fa-spin fa-lg"
	}
	return "fa fa-check-square fa-lg"
}

func (g *Game) GetObjective(x, y int) *GameObjective {

	// Firstly, see if its already there
	for _, v := range g.Objectives {
		if v.X == x && v.Y == y {
			print("got existing objective at that location")
			return v
		}
	}
	return nil
}

func (g *Game) RemoveObjective(x, y int) {
	for i, v := range g.Objectives {
		if v.X == x && v.Y == y {
			g.Objectives = append(g.Objectives[:i], g.Objectives[i+1:]...)
		}
	}
}

func (g *Game) AddObjective(x, y int) *GameObjective {

	// Firstly, see if its already there
	for _, v := range g.Objectives {
		if v.X == x && v.Y == y {
			print("got existing objective at that location")
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
		// print("that looks to be on row", row)
		g.Tiles[i].Y = row
		col := i - (row * g.TileX)
		// print("col looks like", col)
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
	// print("is complete", g.Tiles)
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

func (g *Game) GetCmd(team string, id int) *GameCmd {
	cmds := g.RedCmd
	if team == "Blue" {
		cmds = g.BlueCmd
	}
	for _, v := range cmds {
		if v.ID == id {
			return v
		}
	}
	return nil
}

func (g *Game) GetUnit(team string, id int) *Unit {
	// is it red ?
	cmds := g.RedCmd
	if team == "Blue" {
		cmds = g.BlueCmd
	} else if team == "" {
		retval := g.GetUnit("Red", id)
		if retval != nil {
			return retval
		}
		return g.GetUnit("Blue", id)
	}
	for _, c := range cmds {
		for _, v := range c.Units {
			if v.ID == id {
				return v
			}
		}
	}
	return nil
}

type GameCmd struct {
	ID            int     `db:"id"`
	GameID        int     `db:"game_id"`
	GameName      string  `db:"game_name"` // derived data
	StartTurn     int     `db:"start_turn"`
	StartX        int     `db:"start_x"`
	StartY        int     `db:"start_y"`
	RedTeam       bool    `db:"red_team"`
	BlueTeam      bool    `db:"blue_team"`
	Nation        string  `db:"nation"`
	Name          string  `db:"name"`
	CommanderName string  `db:"commander_name"`
	Level         int     `db:"level"`
	LevelName     string  `db:"level_name"`
	Descr         string  `db:"descr"`
	Rating        int     `db:"rating"`
	Inspiration   int     `db:"inspiration"`
	Condition     int     `db:"condition"`
	PlayerID      int     `db:"player_id"`
	PlayerName    string  `db:"player_name"`  // derived data
	PlayerEmail   string  `db:"player_email"` // derived data
	PlayerReady   bool    `db:"player_ready"` // derived data
	Units         []*Unit `db:"units"`
	VP            int     `db:"vp"`
	Cull          bool    `db:"cull"` // Dont use in game
	Cmdrs         int
	Bayonets      int
	Sabres        int
	Guns          int
}

type GameCmdRPCData struct {
	Channel  int
	ID       int
	PlayerID int
	Team     string
}

func (g *GameCmd) GetAvatar(size int) string {
	theEmail := strings.TrimSpace(strings.ToLower(g.PlayerEmail))
	avatar := md5.Sum([]byte(theEmail))
	// print("compute avatar for", theEmail)
	avatarURL := fmt.Sprintf("https://www.gravatar.com/avatar/%x?d=wavatar&s=%d", avatar, size)
	// print("got", avatarURL)
	return avatarURL
}

func (g *GameCmd) GetCSS() string {
	if g.RedTeam {
		return "tile-red"
	}
	return "tile-blue"
}

func (f *GameCmd) CalcTotals() {
	f.Bayonets = 0
	f.Sabres = 0
	f.Guns = 0
	f.Cmdrs = 0
	for _, v := range f.Units {
		f.Bayonets += v.Bayonets - v.BayonetsLost
		f.Sabres += v.Sabres - v.SabresLost
		f.Guns += v.Guns - v.GunsLost
		if v.UType == 1 {
			f.Cmdrs++
		}
	}
}

func (f *GameCmd) Summarize() string {
	retval := "( "
	retval += fmt.Sprintf("%d Bayonets", f.Bayonets)
	retval += " / "
	retval += fmt.Sprintf("%d Sabres", f.Sabres)
	retval += " / "
	retval += fmt.Sprintf("%d Guns", f.Guns)
	retval += " )"
	return retval
}

type Unit struct {
	ID               int    `db:"id"`
	GameID           int    `db:"game_id"`
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
	Rifles           bool   `db:"rifles"`
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
	RFlank           bool   `db:"rflank"`
	LFlank           bool   `db:"lflank"`
	HasSupport       bool   `db:"has_support"`
	BayonetsLost     int    `db:"bayonets_lost"`
	BayonetsMState   int    `db:"bayonets_mstate"`
	BayonetsMoved    bool   `db:"bayonets_moved"`
	BayonetsFired    bool   `db:"bayonets_fired"`
	LTLost           int    `db:"lt_lost"`
	LTMState         int    `db:"lt_mstate"`
	SabresLost       int    `db:"sabres_lost"`
	SabresMState     int    `db:"sabres_mstate"`
	SabresCharged    int    `db:"sabres_charged"`
	GunsLost         int    `db:"guns_lost"`
	GunsFired        bool   `db:"guns_fired"`
	GunsMoved        bool   `db:"guns_moved"`
	GunsLimbered     bool   `db:"guns_limbered"`
	GunsMState       int    `db:"guns_mstate"`
	GunMaxCondition  int    `db:"gun_max_condition"`
	Summary          string `db:"summary"` // derived data
}

func (u *Unit) GetSummary(corps *GameCmd) string {
	// Loop through the Corp, and work out which units are childs of this, and sum
	// up the total bayonets and sabres and guns

	mode := 0
	b := u.Bayonets
	bl := u.BayonetsLost
	s := u.Sabres
	sl := u.SabresLost
	g := u.Guns
	gl := u.GunsLost
	for _, v := range corps.Units {
		switch v.UType {
		case 1:
			if mode == 1 {
				mode = 2
			}
			if v.ID == u.ID {
				mode = 1
				// everything from here is mine until we hit the next thing
			}
		default:
			if mode == 1 {
				b += v.Bayonets
				bl += v.BayonetsLost
				s += v.Sabres
				sl += v.SabresLost
				g += v.Guns
				gl += v.GunsLost
			}
		}
	}

	retval := ""
	if b > 0 {
		retval += fmt.Sprintf("Total of %d Bayonets (%d unfit for duty)\n", b, bl)
	}
	if s > 0 {
		retval += fmt.Sprintf("Total of %d Sabres (%d out of action)\n", s, sl)
	}
	if g > 0 {
		retval += fmt.Sprintf("Total of %d Guns (%d under repair)\n", g, gl)
	}
	return retval
}

func (u *Unit) GetSitrep() string {
	return "todo - add some long winded write up on the individual unit "
}

func (u *Unit) GetRating() string {
	switch u.UType {
	case 1:
		return Lookups.CmdRating[u.Rating-1].Name
	case 2, 3, 5:
		return Lookups.UnitRating[u.Rating-1].Name
	}
	return ""
}

func (u *Unit) GetRatingData() *UnitRating {
	switch u.UType {
	case 1:
		return nil
	case 2, 3, 5:
		return &Lookups.UnitRating[u.Rating-1]
	}
	return nil
}

func (u *Unit) GetDrillData() *DrillType {
	switch u.UType {
	case 1, 3, 4:
		return nil
	case 2, 5:
		return &Lookups.DrillType[u.Drill-1]
	}
	return nil
}

func (u *Unit) GetAppraisal() string {
	switch u.UType {
	case 2, 5:
		d := Lookups.DrillType[u.Drill-1].Control
		r := Lookups.UnitRating[u.Rating-1].FireBonus
		cond := Lookups.Condition[u.Condition-1].Effect
		if cond < 0 {
			cond *= 2
		}
		c := cond + d + r + rand.Intn(3) - 1
		switch c {
		case -1, -2, -3:
			return "This unit is unfit for battle Sir. They must be taken out of the line, or Surrender is our only option."
		case 0, 1, 2:
			return "This unit, Sir, is a discrace. A total discrace to arms, infested with the worst sort of criminal, scoundrel and skiving laggard."
		case 3:
			return "Terribly poor discipline, illiterate, often drunk, and uncouth in the extreme. They understand the Lash ... and little else."
		case 4:
			return "A sorry looking bunch of threadbare miserables, barely able to tie their own shoelaces ... let alone fight. I pity them Sir ... Pity their sorry backsides I do."
		case 5:
			return "They might look like soldiers, and sometimes act like them ... but I wouldnt trust them to care for my dog."
		case 6:
			return "Their muskets are dirty and their boots are clean ... Aye ... but they are learning the trade. We will make soldiers out of them yet, Sir."
		case 7:
			return "Not the most pleasant company this lot, and they are looking a little worn around the edges Sir ... but the enemy wont go near em either. Run in fear for their lives whenever this lot turns up they do, Sir."
		case 8:
			return "Dependable, and well disciplined they are Sir. They will follow orders without question or hesitation"
		case 9:
			return "A fine group of Lads they are Sir. They know how to handle a musket, and they polish up allght too. Good Soldiers they are."
		case 10, 11, 12:
			return "Remarkable ! I have rarely seen a better prepared unit Sir, and it will be an honour to fight with them."
		case 13, 14, 15:
			return "Splendid ! Let us at em Sir, we can take this battle single handed ... the enemy stands no chance against these fine men !"
		}
	}
	return ""
}

func (u *Unit) GetCavData() *CavType {
	switch u.UType {
	default:
		return nil
	case 3:
		return &Lookups.CavType[u.CavType-1]
	}
	return nil
}

func (u *Unit) GetBayonets() string {
	return fmt.Sprintf("%d", u.Bayonets-u.BayonetsLost)
}

func (u *Unit) GetSupport() string {
	retval := ""
	switch u.UType {
	case 2:
		if u.LtCoy > 0 {
			if u.EliteArms == 0 {
				u.EliteArms = 1
			}
			retval += fmt.Sprintf("+ %d Elite Company %s\n", u.LtCoy, Lookups.SmallArms[u.EliteArms].Name)
		}
		if u.JgCoy > 0 {
			retval += fmt.Sprintf(" + %d Attached Jager/Rifle Coy\n", u.JgCoy)
		}
		if u.Sabres > 0 {
			print("here with u", u)
			retval += fmt.Sprintf(" + %d Attached %s %s\n",
				u.Sabres, Lookups.UnitRating[u.CavRating-1].Name, Lookups.CavType[u.CavType-1].Name)
		}
		if u.Guns > 0 {
			if u.GunCondition == 0 {
				u.GunCondition = 3
			}
			retval += fmt.Sprintf(" + %d %s in %s Condition\n",
				u.Guns, Lookups.Gunnery[u.GunneryType-1].Name, Lookups.Condition[u.GunCondition-1].Name)
		}
	}
	return retval
	// if retval != "" {
	// 	return retval
	// }
	// return ".. and no additional support units."
}

func (u *Unit) GetCondition() string {
	return Lookups.Condition[u.Condition-1].Name
}

func (u *Unit) GetCavType() string {
	return Lookups.CavType[u.CavType-1].Name
}

func (u *Unit) GetCavRating() string {
	return Lookups.UnitRating[u.CavRating-1].Name
}

func (u *Unit) GetDrill() string {
	return Lookups.DrillType[u.Drill-1].Name
}

func (u *Unit) GetGunType() string {
	return Lookups.Gunnery[u.GunneryType-1].Name
}

func (u *Unit) GetArms() string {
	return Lookups.SmallArms[u.SmallArms-1].Name
}

func (u *Unit) GetBases() string {
	retval := ""
	bb := u.Bayonets - u.BayonetsLost
	ss := u.Sabres - u.SabresLost
	gg := u.Guns - u.GunsLost
	if bb > 75 {
		cnt := ((bb + 350) / 450)
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

	if ss > 0 {
		if retval != "" {
			retval += "<br>\n"
		}
		cnt := (ss + 60) / 75 // total number of half sqns
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
	if gg > 0 {
		if retval != "" {
			retval += "<br>\n"
		}
		cnt := gg // Actual Guns
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

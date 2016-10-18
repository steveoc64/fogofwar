package shared

type CmdLevel struct {
	ID     int    `db:"id"`
	Name   string `db:"name"`
	Effect int    `db:"effect"`
}

type Condition struct {
	ID     int    `db:"id"`
	Name   string `db:"name"`
	Effect int    `db:"effect"`
}

type Inspiration struct {
	ID     int    `db:"id"`
	Name   string `db:"name"`
	Effect int    `db:"effect"`
}

type CmdRating struct {
	ID     int    `db:"id"`
	Name   string `db:"name"`
	Effect int    `db:"effect"`
}

type UnitRating struct {
	ID             int    `db:"id"`
	Name           string `db:"name"`
	Code           string `db:"code"`
	Shock          bool   `db:"shock"`
	FormClose      bool   `db:"form_close"`
	FormEngage     bool   `db:"form_engage"`
	SKClose        bool   `db:"sk_close"`
	AttackSuperior bool   `db:"attack_superior"`
	AttackGuns     bool   `db:"attack_guns"`
	FireBonus      int    `db:"fire_bonus"`
	MeleeBonus     int    `db:"melee_bonus"`
	Ammo           int    `db:"ammo"`
}

type CavType struct {
	ID      int    `db:"id"`
	Name    string `db:"name"`
	Weight  int    `db:"weight"`
	Battle  bool   `db:"battle"`
	Lances  bool   `db:"lances"`
	Dragoon bool   `db:"dragoon"`
	Cossack bool   `db:"cossack"`
	Dubious bool   `db:"dubious"`
}

type Gunnery struct {
	ID           int    `db:"id"`
	Name         string `db:"name"`
	Cannister    []byte `db:"cannister"`
	CannisterBad []byte `db:"cannister_bad"`
	Ranges       []byte `db:"ranges"`
	GoodEffect   []byte `db:"good_effect"`
	BadEffect    []byte `db:"bad_effect"`
	HW           bool   `db:"hw"`
}

type DrillType struct {
	ID        int    `db:"id"`
	Name      string `db:"name"`
	Ranks     int    `db:"ranks"`
	Flankers  bool   `db:"flankers"`
	EliteCoy  bool   `db:"elite_coy"`
	ThirdRank bool   `db:"third_rank"`
	OpenOrder bool   `db:"open_order"`
	Line      bool   `db:"line"`
	Mixed     bool   `db:"mixed"`
	AttCol    bool   `db:"att_col"`
	CloseCol  bool   `db:"close_col"`
	Oblique   bool   `db:"oblique"`
	Square    bool   `db:"square"`
	Mob       bool   `db:"mob"`
	Control   int    `db:"control"`
	Speed     int    `db:"speed"`
}

type SmallArms struct {
	ID      int    `db:"id"`
	Name    string `db:"name"`
	Ranges  []byte `db:"ranges"`
	Effects []byte `db:"effects"`
	Covered []byte `db:"covered"`
}

type GridSize struct {
	ID   int
	Name string
}

type LookupTable struct {
	CmdLevel    []CmdLevel
	Condition   []Condition
	Inspiration []Inspiration
	CmdRating   []CmdRating
	UnitRating  []UnitRating
	CavType     []CavType
	Gunnery     []Gunnery
	DrillType   []DrillType
	SmallArms   []SmallArms
	GridSizes   []GridSize
}

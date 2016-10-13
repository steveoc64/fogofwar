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
	ID int `db:"id"`
	Name string `db:"name"`
	Ranks int ``
	Flankers bool ``
	EliteCoy bool ``
	ThirdRank bool ``
	OpenOrder bool ``
	Line bool ``
	Mixed bool ``
	AttCol bool ``
	CloseCol bool ``
	Oblique bool ``
	Square bool ``
	Mob bool ``
	Control int ``
	Speed int ``
		id serial not null primary key,
	name text not null default '',
	ranks int not null default 3,
	flankers bool,
	elite_coy bool,
	third_rank bool,
	open_order bool,
	line bool,
	mixed bool,
	att_col bool,
	close_col bool,
	oblique bool,
	square bool,
	mob bool,
	control int not null default 1,
	speed int not null default 1
}
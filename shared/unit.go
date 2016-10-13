package shared

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

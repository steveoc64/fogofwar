package shared

type Fight struct {
	GameID int     `db:"game_id"`
	Name   string  `db:"name"`
	ID     int     `db:"id"`
	Rough  bool    `db:"rough"`
	Woods  bool    `db:"woods"`
	Built  bool    `db:"built"`
	Fort   bool    `db:"fort"`
	Red    []*Unit `db:"red"`
	Blue   []*Unit `db:"blue"`
}

type FightData struct {
	Channel int
	GameID  int
	ID      int
	DivID   int
	BdeD    int
	Fight   *Fight
}

package shared

type Fight struct {
	ID     int     `db:"id"`
	GameID int     `db:"game_id"`
	Name   string  `db:"name"`
	Rough  bool    `db:"rough"`
	Woods  bool    `db:"woods"`
	Built  bool    `db:"built"`
	Fort   bool    `db:"fort"`
	Red    []*Unit `db:"red"`
	Blue   []*Unit `db:"blue"`
}

type GameFight struct {
	ID     int
	GameID int
	Name   string
	Rough  bool
	Woods  bool
	Built  bool
	Fort   bool
	Red    []int
	Blue   []int
}

type FightData struct {
	Channel int
	GameID  int
	ID      int
	DivID   int
	BdeID   int
	Fight   *Fight
}

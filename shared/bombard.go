package shared

type Bombard struct {
	GameID    int  `db:"game_id"`
	ID        int  `db:"id"`
	UnitID    int  `db:"unit_id"`
	FirerID   int  `db:"firer_id"`
	TargetID  int  `db:"target_id"`
	TargetUID int  `db:"target_uid"`
	RangeMax  int  `db:"range_max"`
	RangeMin  int  `db:"range_min"`
	Disputed  bool `db:"disputed"`
}

type BombardData struct {
	Channel int
	GameID  int
	ID      int
	Bombard *Bombard
}

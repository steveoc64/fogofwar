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

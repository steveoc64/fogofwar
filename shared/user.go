package shared

type User struct {
	ID       int    `db:"id"`
	Username string `db:"username"`
	Name     string `db:"name"`
	Passwd   string `db:"passwd"`
	Email    string `db:"email"`
	Rank     int    `db:"rank"`
	Notes    string `db:"notes"`
}

type UserRPCData struct {
	Channel int
	ID      int
	User    *User
}

type UserUpdate struct {
	Channel  int    `db:"channel"`
	ID       int    `db:"id"`
	Username string `db:"username"`
	Name     string `db:"name"`
	Passwd   string `db:"passwd"`
	Email    string `db:"email"`
}

type UserOnline struct {
	ID       int      `db:"id"`
	Username string   `db:"username"`
	Browser  string   `db:"browser"`
	IP       string   `db:"ip"`
	Name     string   `db:"name"`
	Email    string   `db:"email"`
	Rank     int      `db:"rank"`
	Route    string   `db:"route"`
	Routes   []string `db:"routes"`
	Duration string   `db:"duration"`
	Channel  int      `db:"channel"`
}

package shared

import "time"

type LoginCredentials struct {
	Username   string
	Password   string
	RememberMe bool
	Channel    int
}

type LoginReply struct {
	Result string
	Token  string
	Rank   int
	ID     int
	Routes []UserRoute
	Disqus bool
}

// type UserMenu struct {
// 	Icon  string
// 	Title string
// 	URL   string
// }

type UserRoute struct {
	Route string
	Func  string
}

type Nav struct {
	Channel int
	Route   string
}

type Login struct {
	ID        int        `db:"user_id"`
	Date      *time.Time `db:"date"`
	IPAddress string     `db:"ip_address"`
	Channel   int        `db:"channel"`
}

type LoginRPCData struct {
	Channel int
	ID      int
	Login   *Login
}

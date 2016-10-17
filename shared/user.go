package shared

import (
	"crypto/md5"
	"fmt"
	"strings"
	"time"
)

type User struct {
	ID           int        `db:"id"`
	Username     string     `db:"username"`
	Name         string     `db:"name"`
	Passwd       string     `db:"passwd"`
	Email        string     `db:"email"`
	Rank         int        `db:"rank"`
	Notes        string     `db:"notes"`
	Country      string     `db:"country"`
	Bloglink     string     `db:"bloglink"`
	Channel      int        `db:"channel"`
	IPAddress    string     `db:"ip_address"`
	Created      *time.Time `db:"created"`
	Expires      *time.Time `db:"expires"`
	Banned       bool       `db:"banned"`
	Disqus       bool       `db:"disqus"`
	Newsletter   bool       `db:"newsletter"`
	NumScenarios int        `db:"num_scenarios"`
	NumGames     int        `db:"num_games"`
}

func (u *User) GetAvatar(size int) string {
	theEmail := strings.TrimSpace(strings.ToLower(u.Email))
	avatar := md5.Sum([]byte(theEmail))
	avatarURL := fmt.Sprintf("https://www.gravatar.com/avatar/%x?d=wavatar&s=%d", avatar, size)
	return avatarURL
}

func (u *User) GetRank() string {

	switch u.Rank {
	case 1:
		return "Lieutenant"
	case 2:
		return "Colonel"
	case 3:
		return "Brigadier"
	case 4:
		return "General"
	case 5:
		return "Marshal"
	case 10:
		return "Le Empereur"
	}
	return "NCO."
}

func (u *User) GetCreated() string {
	print("formatting created", u.Created, u.Created.Format("Mon, Jan 2 2006"))
	return u.Created.Format("Mon, Jan 2 2006")
}

func (u *User) GetExpires() string {
	print("formatting expires", u.Expires, u.Expires.Format("Mon, Jan 2 2006"))
	return u.Expires.Format("Mon, Jan 2 2006")
}

type Rank struct {
	ID   int
	Name string
}

func GetRanks() []Rank {
	ranks := []Rank{
		{1, "Lieutenant"},
		{2, "Captain"},
		{3, "Major"},
		{4, "Colonel"},
		{5, "General"},
		{7, "Marshal"},
		{10, "Emporer"},
	}
	return ranks
}

type UserSignup struct {
	ID       int    `db:"id"`
	Channel  int    `db:"channel"`
	Username string `db:"username"`
	Name     string `db:"name"`
	Passwd1  string `db:"passwd"`
	Passwd2  string `db:"passwd2"`
	Email    string `db:"email"`
	Notes    string `db:"notes"`
	Country  string `db:"country"`
	Bloglink string `db:"bloglink"`
	Secret   string `db:"secret"`
	Rank     int    `db:"rank"`
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

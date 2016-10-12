package main

import (
	"errors"
	"fmt"
	"log"
	"strings"
	"time"

	"../shared"
	"github.com/steveoc64/godev/mail"
)

type LoginRPC struct{}

type dbLoginResponse struct {
	ID       int    `db:"id"`
	Username string `db:"username"`
	Name     string `db:"name"`
	Rank     int    `db:"rank"`
}

func (l *LoginRPC) Nav(data shared.Nav, r *string) error {
	conn := Connections.Get(data.Channel)
	conn.Routes = append(conn.Routes, data.Route)
	conn.Route = data.Route
	*r = conn.Route
	println("\n----------------------------------")
	log.Printf("%s:%s -> %s\n", conn.Username, conn.GetRank(), conn.Route)
	conn.BroadcastAdmin("nav", data.Route, data.Channel)
	return nil
}

func (l *LoginRPC) Login(lc *shared.LoginCredentials, lr *shared.LoginReply) error {
	start := time.Now()

	// do some authentication here

	// send a login reply

	// Get the connection we are on
	// log.Println("channel is", lc.Channel)
	conn := Connections.Get(lc.Channel)
	// log.Println("got conn", conn)
	if conn != nil {
		// validate that username and passwd is correct
		res := &dbLoginResponse{}

		// log.Println(`select u.id,u.username,u.name,u.role,u.site_id,s.name as sitename
		// 	from users u
		// 	left join site s on (s.id = u.site_id)
		// 	where lower(u.username) = lower('`, lc.Username, `') and lower(passwd) = lower('`, lc.Password, `')`)

		// err := DB.
		// 	Select("u.id,u.username,u.name,u.role,u.site_id,s.name as sitename,u.can_allocate as can_allocate").
		// 	From(`users u
		// 	left join site s on (s.id = u.site_id)`).
		// 	Where("lower(u.username) = lower($1) and lower(passwd) = lower($2)",
		// 		lc.Username, lc.Password).
		// 	QueryStruct(res)
		// // log.Println(res)

		err := DB.SQL(`select
			id,username,name,rank
			from users
			where (lower(username) = lower($1) and lower(passwd) = lower($2))
			or (lower(email) = lower($1) and lower(passwd) = lower($2))`, lc.Username, lc.Password).
			QueryStruct(res)

		// println(`select
		// 	id,username,name,rank
		// 	from users
		// 	where (lower(username) = lower($1) and lower(passwd) = lower($2))
		// 	or (lower(email) = lower($1) and lower(passwd) = lower($2))`, lc.Username, lc.Password)

		if err != nil {
			log.Println("Login Failed:", err.Error())
			lr.Result = "Failed"
			lr.Token = ""
			// lr.Menu = []shared.UserMenu{}
			lr.Routes = []shared.UserRoute{}
			lr.Rank = 0
			lr.Disqus = false
		} else {
			// log.Println("Login OK")
			lr.Result = "OK"
			lr.Token = fmt.Sprintf("%d", lc.Channel)

			//lr.Menu = []string{"RPC Dashboard", "Events", "Sites", "Machines", "Tools", "Parts", "Vendors", "Users", "Skills", "Reports"}
			// lr.Menu = getMenu(res.Role)
			lr.Routes = getRoutes(res.ID, res.Rank)
			lr.Rank = res.Rank
			lr.ID = res.ID
			lr.Disqus = Config.Disqus
			conn.Login(lc.Username, res.ID, res.Rank)
			Connections.Show("connections after new login")
			conn.Broadcast("login", "insert", lr.ID)
		}
	}

	logger(start, "Login.Login", conn,
		fmt.Sprintf("%v", lc),
		fmt.Sprintf("%v", lr))

	return nil
}

func (l *LoginRPC) UsersOnline(channel int, u *[]shared.UserOnline) error {
	start := time.Now()
	conn := Connections.Get(channel)
	if conn.Rank > 9 {

		for _, k := range Connections.Keys() {
			v := Connections.Get(k)
			println("k,v = ", k, v)
			req := v.Socket.Request()
			theIP := ""
			if theIP = req.Header.Get("X-Real-Ip"); theIP == "" {
				theIP = req.RemoteAddr
			}
			user := shared.UserOnline{
				ID:       v.UserID,
				Username: v.Username,
				Browser:  fmt.Sprintf("%s", req.Header["User-Agent"]),
				IP:       theIP,
				Name:     "lookup",
				Email:    "lookup",
				Rank:     v.Rank,
				Route:    v.Route,
				Routes:   v.Routes,
				Duration: time.Since(v.Time).String(),
				Channel:  v.ID,
			}

			if user.ID == 0 {
				user.Duration = ""
			}
			*u = append(*u, user)

		}

	}

	logger(start, "Login.UsersOnline", conn,
		"",
		fmt.Sprintf("%d Users Online", len(*u)))

	return nil
}

func (l *LoginRPC) CheckUsername(u string, ok *bool) error {
	id := 0
	*ok = false
	DB.SQL(`select id from users where lower(username) = lower($1)`, u).QueryScalar(&id)
	// println("got id of", id, "for", u)
	if id == 0 {
		*ok = true // could find no user with the same name
	}
	return nil
}

func (l *LoginRPC) CheckEmail(e string, ok *bool) error {
	id := 0
	*ok = false
	DB.SQL(`select id from users where lower(email) = lower($1)`, e).QueryScalar(&id)
	// println("got id of", id, "for", e)
	if id == 0 {
		*ok = true // could find no user with the same email
	}
	return nil
}

func (l *LoginRPC) NewUserRego(u shared.UserSignup, newUser *shared.UserSignup) error {
	// attempt to create the new user
	u.Rank = 0
	if u.Passwd1 != u.Passwd2 {
		println("Passwd mismatch")
		return errors.New("Password Mismatch")
	}

	cnt := 0
	// Zap any un-authenticated user with the same name
	DB.SQL(`delete from users where username=$1 and rank=0`, u.Username).Exec()

	// Reject the request if someone else has the name
	DB.SQL(`select count(*) from users where username=$1`, u.Username).QueryScalar(&cnt)
	if cnt > 0 {
		return errors.New("Username in use")
	}

	// Reject the request if someone else has the email
	DB.SQL(`select count(*) from users where email=$1`, u.Email).QueryScalar(&cnt)
	if cnt > 0 {
		return errors.New("Email is in use")
	}

	// Looks valid, so add the new user
	DB.InsertInto("users").
		Whitelist("username", "name", "passwd", "email", "rank", "notes", "country", "bloglink", "channel").
		Record(u).
		Returning("id").
		QueryScalar(&u.ID)

	fmt.Printf("Looks ok new user =%v\n", u)

	// and create a new VCODE record for them
	vcode := "224556"
	DB.SQL(`delete from vcode where expires > now()`).Exec()
	DB.SQL(`delete from vcode where uid=$1`, u.ID).Exec()
	DB.SQL(`insert into vcode (uid,code) values ($1,$2)`, u.ID, vcode).Exec()

	if Config.MailServer != "" {

		m := mail.NewMail()
		m.SetHeader("From", "ActionFront <welcome@wargaming.io>")
		m.SetHeader("To", u.Email)
		m.SetHeader("Subject", "Welcome to ActionFront")
		m.SetBody("text/html", fmt.Sprintf(`Your activation code is:
<br>
%s
<br>
<br>
Many Thanks,<br>
The Team at wargaming.io`, vcode))
		MailChannel <- m
	}

	*newUser = u
	return nil
}

func (l *LoginRPC) ValidateNewUser(u *shared.UserSignup, ok *bool) error {

	*ok = false
	println("Validating New User", u.Username, u.Secret)

	uid := 0
	DB.SQL(`select id from users where rank=0 and username=$1`, u.Username).QueryScalar(&uid)
	if uid == 0 {
		return errors.New("Invalid New Username")
	}

	vcode := ""
	DB.SQL(`select code from vcode where uid=$1 and expires > now()`, uid).QueryScalar(&vcode)
	println("Required vcode =", vcode)

	if vcode == "" {
		return errors.New("No Validation Code on file")
	}

	if vcode != strings.Trim(u.Secret, " ") {
		return errors.New("Codes dont match")
	}

	// They are validated, so upgrade the user account, and remove the validation code
	DB.SQL(`delete from vcode where uid=$1`, uid).Exec()
	DB.SQL(`update users set rank=1 where id=$1 and rank=0`, uid).Exec()

	*ok = true
	return nil
}

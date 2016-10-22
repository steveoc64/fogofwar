package main

import (
	"errors"
	"fmt"
	"log"
	"math/rand"
	"strings"
	"time"

	"../shared"
	// "github.com/steveoc64/godev/mail"
)

type LoginRPC struct{}

type dbLoginResponse struct {
	ID       int    `db:"id"`
	Username string `db:"username"`
	Name     string `db:"name"`
	Rank     int    `db:"rank"`
	Disqus   bool   `db:"disqus"`
}

func (l *LoginRPC) Nav(data shared.Nav, r *string) error {
	conn := Connections.Get(data.Channel)
	conn.Routes = append(conn.Routes, data.Route)
	conn.Route = data.Route
	*r = conn.Route
	println("\n----------------------------------")
	log.Printf("%s:%s -> %s\n", conn.Username, conn.GetRank(), conn.Route)
	conn.BroadcastAdmin("Nav", data.Route, data.Channel)
	return nil
}

func (l *LoginRPC) Login(lc *shared.LoginCredentials, lr *shared.LoginReply) error {
	start := time.Now()

	retval := error(nil)

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
			id,username,name,rank,disqus
			from users
			where banned = false 
			and ((lower(username) = lower($1) and lower(passwd) = lower($2))
			or (lower(email) = lower($1) and lower(passwd) = lower($2)))`, lc.Username, lc.Password).
			QueryStruct(res)
		println("attempt login with", lc.Username, lc.Password)
		if err != nil {
			println(err.Error())
		} else {
			println("here with no error so far")
		}

		// println(`select
		// 	id,username,name,rank
		// 	from users
		// 	where (lower(username) = lower($1) and lower(passwd) = lower($2))
		// 	or (lower(email) = lower($1) and lower(passwd) = lower($2))`, lc.Username, lc.Password)

		// Init to blank, and then proceed from there
		lr.Version = CodeVersion
		lr.Result = "Failed"
		lr.Token = ""
		// lr.Menu = []shared.UserMenu{}
		lr.Routes = []shared.UserRoute{}
		lr.Rank = 0
		lr.Disqus = false
		lr.MaxGames = 0
		lr.MaxScenarios = 0
		lr.MaxPlayers = 0

		if err == nil {
			println("lets chck the login table")
			// So far so good - now, check that the user isn't already logged in somewhere else !!
			count := 0
			ipa := ""
			DB.SQL(`select
				ip_address,count(*)
				from login
				where user_id=$1 and up
				group by ip_address limit 1`, res.ID).QueryScalar(&ipa, &count)
			if count > 0 {
				retval = errors.New(`Sorry, but you are already logged in on another machine with this account:

IP Address: ` + ipa + `

Please logout from the other machine if you want to use this one instead.`)
			} else {

				// log.Println("Login OK")
				lr.Result = "OK"
				lr.Token = fmt.Sprintf("%d", lc.Channel)
				lr.Version = CodeVersion

				//lr.Menu = []string{"RPC Dashboard", "Events", "Sites", "Machines", "Tools", "Parts", "Vendors", "Users", "Skills", "Reports"}
				// lr.Menu = getMenu(res.Role)
				lr.Routes = getRoutes(res.ID, res.Rank)
				lr.LookupTable = getLookupTable()
				lr.Rank = res.Rank

				switch res.Rank {
				case 1:
					lr.MaxGames = 1
					lr.MaxScenarios = 2
					lr.MaxPlayers = 2
				case 2:
					lr.MaxGames = 2
					lr.MaxScenarios = 8
					lr.MaxPlayers = 4
				case 3:
					lr.MaxGames = 4
					lr.MaxScenarios = 16
					lr.MaxPlayers = 8
				case 4:
					lr.MaxGames = 8
					lr.MaxScenarios = 32
					lr.MaxPlayers = 16
				case 10:
					lr.MaxGames = 8
					lr.MaxScenarios = 64
					lr.MaxPlayers = 16
				}

				lr.ID = res.ID
				lr.Disqus = Config.Disqus && res.Disqus
				conn.Login(lc.Username, res.ID, res.Rank)
				Connections.Show("connections after new login")
				conn.BroadcastAdmin("Login", "Login", lr.ID)

				// Create a login record
				req := conn.Socket.Request()
				theIP := ""
				if theIP = req.Header.Get("X-Real-Ip"); theIP == "" {
					theIP = req.RemoteAddr
				}

				// Update the user
				DB.SQL(`update users set channel=$2,ip_address=$3 where id=$1`, res.ID, conn.ID, theIP).Exec()

				// Create a login record
				DB.SQL(`insert into login (user_id,ip_address,channel,up) values ($1,$2,$3,'t')`,
					res.ID, theIP, conn.ID).Exec()
			} // didnt find an existing login

		}
	} // if con != nil

	logger(start, "Login.Login", conn,
		fmt.Sprintf("%v", lc),
		lr.Result)
	// fmt.Sprintf("%v", lr.))

	return retval
}

func (l *LoginRPC) Logout(channel int, retval *shared.Login) error {
	start := time.Now()

	conn := Connections.Get(channel)

	DB.SQL(`update user set channel=0 where id=$1`, conn.UserID).Exec()
	DB.SQL(`update login set up='f',channel=0 where channel=$1`, conn.ID).Exec()

	logger(start, "Login.Logout", conn,
		fmt.Sprintf("ID %d", channel), "")

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

var vcodes []string

func initVCode() {
	vcodes = []string{
		"Austerlitz", "Jena", "Talavera", "Ulm", "Smolensk", "Eylau",
		"Borodino", "Hastings", "Marathon", "Adrennes", "Verdun", "Tobruk", "Kokoda", "Gallipoli", "Somme",
		"Vendee", "Wellington", "Sharpe", "Elba", "Marengo",
		"Brusilov", "Rommel", "Zhukov", "Patton", "General", "Napoleon", "IwoJima",
		"Stalingrad", "Gettysburg", "KheSan", "Inchon", "Sebastopol", "Leningrad",
		"Abrams", "Leopard", "Tiger", "Cannae", "Blucher", "Brunswick", "Potsdam", "Corporal",
		"Major", "Adjudant", "LeeEnfield", "Isandhlwana", "Ombudurman", "Fulcrum", "Eurofighter",
		"Typhoon", "Mustang", "Thunderbolt", "Lavochkin", "Lockheed", "Hornet", "Musket",
		"Bayonet", "Lancer", "Chasseur", "Cuirassier", "Dragoon", "Landwehr", "Fusilier", "Voltigeur",
		"Jager",
	}

}

func getVCode() string {
	v := vcodes[rand.Intn(len(vcodes))]
	return fmt.Sprintf("%s%04d", v, 1000+rand.Intn(10000))
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
	vcode := getVCode()
	DB.SQL(`delete from vcode where expires > now()`).Exec()
	DB.SQL(`delete from vcode where uid=$1`, u.ID).Exec()
	DB.SQL(`insert into vcode (uid,code) values ($1,$2)`, u.ID, vcode).Exec()

	if Config.MailServer != "" {

		m := NewMail()
		m.SetHeader("From", "ActionFront <welcome@wargaming.io>")
		m.SetHeader("To", u.Email)
		m.SetHeader("Bcc", "steveoc64@gmail.com")
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

	if strings.ToLower(vcode) != strings.ToLower(u.Secret) {
		return errors.New("Codes dont match")
	}

	// They are validated, so upgrade the user account, and remove the validation code
	DB.SQL(`delete from vcode where uid=$1`, uid).Exec()
	DB.SQL(`update users set rank=1 where id=$1 and rank=0`, uid).Exec()

	*ok = true
	return nil
}

func (l *LoginRPC) ListByUser(data shared.LoginRPCData, retval *[]shared.Login) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	err := DB.SQL(`select * from login where user_id=$1 order by date desc limit 12`, data.ID).QueryStructs(retval)

	logger(start, "Login.ListByUser", conn,
		fmt.Sprintf("User %d", data.ID),
		fmt.Sprintf("%d Records", len(*retval)))

	return err
}

func (l *LoginRPC) ListLast(data shared.LoginRPCData, retval *[]shared.Login) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	err := DB.SQL(`select l.*,u.username,u.country,u.email
		from login l
		left join users u on u.id=l.user_id
		order by date desc
		limit 20`, data.ID).QueryStructs(retval)

	logger(start, "Login.ListLast", conn,
		"",
		fmt.Sprintf("%d Records", len(*retval)))

	return err
}

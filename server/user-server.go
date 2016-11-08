package main

import (
	"crypto/md5"
	"errors"
	"fmt"
	"strings"
	"time"

	"../shared"
)

type UserRPC struct{}

func (u *UserRPC) List(data shared.UserRPCData, retval *[]shared.User) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	if conn.Rank < 10 {
		return errors.New("Insufficient Privileges")
	}

	err := DB.SQL(`select * from users order by lower(username)`).QueryStructs(retval)
	print("retval", retval)

	logger(start, "User.List", conn,
		"",
		fmt.Sprintf("%d Users", len(*retval)))

	return err
}

func (u *UserRPC) ListOnline(data shared.UserRPCData, retval *[]shared.User) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	if conn.Rank < 10 {
		return errors.New("Insufficient Privileges")
	}

	err := DB.SQL(`select u.*,
		coalesce(g.ct, 0) as num_games,
		coalesce(s.ct, 0) as num_scenarios
	 from users u 
	 	left join (select hosted_by, count(*) as ct from game group by 1) g on g.hosted_by=u.id
	 	left join (select author_id, count(*) as ct from scenario group by 1) s on s.author_id=u.id
	 where u.channel != 0 
	 order by lower(u.username)`).QueryStructs(retval)
	print("retval", retval)

	logger(start, "User.ListOnline", conn,
		"",
		fmt.Sprintf("%d Users", len(*retval)))

	return err
}

func (u *UserRPC) ListOffline(data shared.UserRPCData, retval *[]shared.User) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	if conn.Rank < 10 {
		return errors.New("Insufficient Privileges")
	}

	err := DB.SQL(`select u.*,
		coalesce(g.ct, 0) as num_games,
		coalesce(s.ct, 0) as num_scenarios
	 from users u 
	 	left join (select hosted_by, count(*) as ct from game group by 1) g on g.hosted_by=u.id
	 	left join (select author_id, count(*) as ct from scenario group by 1) s on s.author_id=u.id
	 where u.channel = 0 
	 order by lower(u.username)`).QueryStructs(retval)
	print("retval", retval)

	logger(start, "User.ListOffline", conn,
		"",
		fmt.Sprintf("%d Users", len(*retval)))

	return err
}

func (u *UserRPC) Get(data shared.UserRPCData, retval *shared.User) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	err := DB.SQL(`select * from users where id=$1`, data.ID).QueryStruct(retval)

	logger(start, "User.Get", conn,
		fmt.Sprintf("ID %d", data.ID),
		fmt.Sprintf("%v", *retval))

	return err
}

func (u *UserRPC) Me(Channel int, retval *shared.User) error {
	start := time.Now()

	conn := Connections.Get(Channel)

	err := DB.SQL(`select * from users where id=$1`, conn.UserID).QueryStruct(retval)

	logger(start, "User.Me", conn,
		fmt.Sprintf("ID %d", retval.ID),
		fmt.Sprintf("%v", *retval))

	return err
}

func (u *UserRPC) SaveMe(data shared.UserRPCData, done *bool) error {
	start := time.Now()

	// check that email is not in use by someone else
	otherID := 0
	DB.SQL(`select id from users where email=$1 and id != $2`, data.User.Email, data.ID).QueryScalar(&otherID)
	if otherID != 0 {
		return errors.New("That email address is already used")
	}
	conn := Connections.Get(data.Channel)
	if data.User.ID != conn.UserID {
		return errors.New("Invalid User ID")
	}

	_, err := DB.Update("users").
		SetWhitelist(data.User, "name", "email", "notes", "country",
			"bloglink", "disqus", "newsletter").
		Where("id = $1", data.ID).
		Exec()

	if err == nil {
		*done = true
		conn.BroadcastAdmin("User", &shared.NetData{Action: "Update", ID: conn.UserID})
	}
	logger(start, "User.SaveMe", conn,
		fmt.Sprintf("%v", data.User), "")

	return err
}

func (u *UserRPC) Update(data shared.UserRPCData, retval *shared.User) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	_, err := DB.Update("users").
		SetWhitelist(data.User, "username", "name", "email", "rank", "notes", "country",
			"passwd", "created", "expires",
			"bloglink", "banned", "disqus", "newsletter").
		Where("id = $1", data.ID).
		Exec()

	print("err", err)

	if err == nil {
		err = DB.SQL(`select * from users where id=$1`, data.ID).
			QueryStruct(retval)
		conn.BroadcastAdmin("User", &shared.NetData{Action: "Update", ID: data.ID})
	}

	logger(start, "User.Update", conn,
		fmt.Sprintf("ID %d %v", data.ID, data.User),
		fmt.Sprintf("%v", *retval))

	return err
}

func (u *UserRPC) Delete(data shared.UserRPCData, done *bool) error {
	start := time.Now()

	*done = false
	conn := Connections.Get(data.Channel)
	if conn.Rank < 9 {
		return errors.New("Insufficient Privilege")
	}

	_, err := DB.SQL(`delete from users where id=$1`, data.ID).Exec()
	if err == nil {
		*done = true
		conn.BroadcastAdmin("User", &shared.NetData{Action: "Update", ID: data.ID})
	}

	logger(start, "User.Delete", conn,
		fmt.Sprintf("ID %d", data.ID),
		"")

	return err
}

func (u *UserRPC) GetIDByName(data shared.UserRPCData, retval *int) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	*retval = 0
	println("getidbyusername", data.Username)
	err := DB.SQL(`select id from users where lower(username)=lower($1)`, data.Username).QueryScalar(retval)
	if err != nil {
		println("error", err.Error())
	}
	println("got ", *retval)

	logger(start, "User.GetIDByName", conn,
		fmt.Sprintf("Name %s", data.Username),
		fmt.Sprintf("%d", *retval))

	return err
}

func (u *UserRPC) Contact(data shared.ContactMessageRPCData, retval *int) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	// Lookup the user
	user := shared.User{}
	DB.SQL(`select email from users where id=$1`, conn.UserID).QueryStruct(&user)

	*retval = 0

	err := DB.SQL(`insert into contact_message
		(user_id, email_to, subject, message) 
		values ($1, 'steveoc64@gmail.com', $2, $3)
		returning id`, conn.UserID, data.ContactMessage.Subject, data.ContactMessage.Message).
		QueryScalar(retval)

	if Config.MailServer != "" {

		m := NewMail()
		m.SetHeader("From", "ActionFront <actionfront@wargaming.io>")
		m.SetHeader("To", "steveoc64@gmail.com")
		m.SetHeader("Subject", "ActionFront ContactForm Msg")
		m.SetBody("text/html", fmt.Sprintf(`From: User %d<br>
Username: %s<br>
Email: %s<br>
Subject: %s <br>
Message: <br>

%s<br>
`, conn.UserID, conn.Username, user.Email, data.ContactMessage.Subject, data.ContactMessage.Message))

		MailChannel <- m
	}

	logger(start, "User.Contact", conn,
		fmt.Sprintf("%s", data.ContactMessage.Subject),
		fmt.Sprintf("MsgID: %d", *retval))

	return err
}

func (u *UserRPC) InviteFriend(data shared.ContactMessageRPCData, retval *int) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)
	if conn.Rank < 2 {
		return errors.New("Insufficient Priv")
	}

	// Lookup the user
	user := shared.User{}
	DB.SQL(`select email from users where id=$1`, conn.UserID).QueryStruct(&user)

	*retval = 0

	err := DB.SQL(`insert into contact_message
		(user_id, email_to, subject, message) 
		values ($1, $2, $3, $4)
		returning id`,
		conn.UserID,
		data.ContactMessage.EmailTo,
		data.ContactMessage.Subject,
		data.ContactMessage.Message).
		QueryScalar(retval)

	if Config.MailServer != "" {

		msg := fmt.Sprintf("Message sent from %s %s\n<br><br>", user.Username, user.Email)
		msg += data.ContactMessage.Message
		msg += "\n<p>Click <a href=https://wargaming.io>https://wargaming.io</a> to sign up and start playing for free.</p>\n"

		m := NewMail()
		m.SetHeader("From", "ActionFront <actionfront@wargaming.io>")
		m.SetHeader("To", data.ContactMessage.EmailTo)
		m.SetHeader("Subject", data.ContactMessage.Subject)
		m.SetBody("text/html", msg)
		MailChannel <- m
	}

	logger(start, "User.InviteFriends", conn,
		fmt.Sprintf("%s", data.ContactMessage.Subject),
		fmt.Sprintf("MsgID: %d", *retval))

	return err
}

func (u *UserRPC) GetAvatar(data shared.AvatarRequest, avatar *string) error {
	start := time.Now()

	*avatar = ""
	conn := Connections.Get(data.Channel)

	email := ""
	err := error(nil)
	data.Username = strings.TrimSpace(data.Username)
	if data.Username != "" {
		err := DB.SQL(`select email from users where lower(username)=lower($1)`, data.Username).QueryScalar(&email)
		if err == nil {
			em5 := md5.Sum([]byte(email))
			// print("compute avatar for", theEmail)
			*avatar = fmt.Sprintf("https://www.gravatar.com/avatar/%x?d=wavatar&s=%d", em5, data.Size)
		} else {
			println(err.Error())
		}
	}

	logger(start, "User.GetAvatar", conn,
		fmt.Sprintf("Username %s Size %d", data.Username, data.Size), *avatar)

	return err
}

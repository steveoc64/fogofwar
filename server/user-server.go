package main

import (
	"errors"
	"fmt"
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

	err := DB.SQL(`select * from users order by username`).QueryStructs(retval)
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
	 order by u.username`).QueryStructs(retval)
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
	 order by u.username`).QueryStructs(retval)
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
	}

	logger(start, "User.Update", conn,
		fmt.Sprintf("ID %d %v", data.ID, data.User),
		fmt.Sprintf("%v", *retval))

	return err
}

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
	print("here")

	conn := Connections.Get(data.Channel)
	print("got con", conn)
	if conn.Rank < 10 {
		return errors.New("Insufficient Privileges")
	}

	err := DB.SQL(`select * from users order by username`, data.ID).QueryStructs(retval)
	print("retval", retval)

	logger(start, "User.List", conn,
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

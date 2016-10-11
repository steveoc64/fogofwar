package main

import (
	"fmt"
	"time"

	"../shared"
)

type UserRPC struct{}

///////////////////////////////////////////////////////////
// SQL
const UserGetQuery = `select 
u.id,u.username,u.passwd,u.email,u.role,u.sms,u.name,u.hourly_rate,u.use_mobile,u.local,u.is_tech,u.can_allocate
	from users u
	where id=$1`

const UserListQuery = `select 
u.id,u.username,u.passwd,u.email,u.role,u.sms,u.name,u.hourly_rate,u.use_mobile,u.local,u.is_tech,u.can_allocate
	from users u
	order by u.username`

const TechniciansListQuery = `select 
u.id,u.username,u.passwd,u.email,u.role,u.sms,u.name,u.hourly_rate,u.use_mobile,u.local,u.is_tech,u.can_allocate
	from users u
	left join user_site x on x.user_id=u.id and x.site_id=$1
	where u.is_tech = true and x.site_id=$1
	order by u.username`

const ManagersListQuery = `select 
u.id,u.username,u.passwd,u.email,u.role,u.sms,u.name,u.hourly_rate,u.use_mobile,u.local,u.is_tech,u.can_allocate
	from users u
	left join user_site x on x.user_id=u.id and x.site_id=$1
	where u.role='Site Manager' and x.site_id=$1
	order by u.username`

const ManagersAllQuery = `select 
u.id,u.username,u.passwd,u.email,u.role,u.sms,u.name,u.hourly_rate,u.use_mobile,u.local,u.is_tech,u.can_allocate
	from users u
	where u.role='Site Manager'
	order by u.username`

const TechniciansAllQuery = `select 
u.id,u.username,u.passwd,u.email,u.role,u.sms,u.name,u.hourly_rate,u.use_mobile,u.local,u.is_tech,u.can_allocate
	from users u
	where u.is_tech = true
	order by u.username`

const AdminsListQuery = `select 
u.id,u.username,u.passwd,u.email,u.role,u.sms,u.name,u.hourly_rate,u.use_mobile,u.local,u.is_tech,u.can_allocate
	from users u
	where u.role='Admin'
	order by u.username`

///////////////////////////////////////////////////////////
// Code

// Get all users
func (u *UserRPC) List(channel int, profs *[]shared.User) error {
	start := time.Now()

	conn := Connections.Get(channel)

	DB.SQL(UserListQuery, conn.UserID).QueryStructs(profs)

	logger(start, "User.List", conn,
		"",
		fmt.Sprintf("%d Users", len(*profs)))

	return nil
}

// Get the user for the given channel
func (u *UserRPC) Me(channel int, prof *shared.User) error {
	start := time.Now()

	conn := Connections.Get(channel)

	DB.SQL(UserGetQuery, conn.UserID).QueryStruct(prof)

	logger(start, "User.Me", conn,
		"",
		fmt.Sprintf("%s %s", prof.Email, prof.Name))

	return nil
}

// Get the user for the given id
func (u *UserRPC) Get(data shared.UserRPCData, prof *shared.User) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	DB.SQL(UserGetQuery, data.ID).QueryStruct(prof)

	logger(start, "User.Get", conn,
		fmt.Sprintf("%d", data.ID),
		fmt.Sprintf("%s %s", prof.Email, prof.Name))

	return nil
}

// Set the user profile from the popdown list at the top
func (u *UserRPC) Set(req shared.UserUpdate, done *bool) error {
	start := time.Now()

	conn := Connections.Get(req.Channel)

	DB.Update("users").
		SetWhitelist(req, "name", "passwd", "email", "sms").
		Where("id = $1", req.ID).
		Exec()

	logger(start, "User.Set", conn,
		fmt.Sprintf("%v", req),
		"")

	// *done = true

	return nil
}

// Full update of user record, including username
func (u *UserRPC) Update(data shared.UserRPCData, done *bool) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	DB.Update("users").
		SetWhitelist(data.User, "username", "name", "passwd", "email", "sms",
			"role", "hourly_rate", "use_mobile", "local", "is_tech", "can_allocate").
		Where("id = $1", data.User.ID).
		Exec()

	logger(start, "User.Update", conn,
		fmt.Sprintf("%v", data.User),
		"")

	*done = true

	return nil
}

// Add a new user record
func (u *UserRPC) Insert(data shared.UserRPCData, id *int) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	DB.InsertInto("users").
		Whitelist("username", "name", "passwd", "email", "sms", "hourly_rate", "use_mobile", "local", "is_tech", "can_allocate").
		Record(data.User).
		Returning("id").
		QueryScalar(id)

	logger(start, "User.Insert", conn,
		fmt.Sprintf("%v", data.User),
		"")

	return nil
}

// Delete a user
func (u *UserRPC) Delete(data shared.UserRPCData, ok *bool) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	*ok = false
	id := data.User.ID
	DB.DeleteFrom("users").
		Where("id=$1", id).
		Exec()

	logger(start, "User.Delete", conn,
		fmt.Sprintf("%d", id), "")

	return nil
}

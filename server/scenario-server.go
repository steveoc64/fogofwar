package main

import (
	"errors"
	"fmt"
	"time"

	"../shared"
)

type ScenarioRPC struct{}

func (s *ScenarioRPC) List(channel int, scenarios *[]shared.Scenario) error {
	start := time.Now()

	conn := Connections.Get(channel)

	DB.SQL(`select s.id,s.author_id,a.username as author_name,s.name,s.descr,s.year
		from scenario s
			left join users a on a.id=s.author_id
		where author_id = $1
		order by year`, conn.UserID).
		QueryStructs(scenarios)

	logger(start, "Scenario.List", conn,
		"",
		fmt.Sprintf("%d Scenarios", len(*scenarios)))

	return nil
}

func (c *ScenarioRPC) ListPublic(channel int, scenarios *[]shared.Scenario) error {
	start := time.Now()

	conn := Connections.Get(channel)

	DB.SQL(`select s.id,s.author_id,a.username as author_name,s.name,s.descr,s.year
		from scenario s
			left join users a on a.id=s.author_id
		where author_id != $1
			and public
		order by year`, conn.UserID).
		QueryStructs(scenarios)

	logger(start, "Scenario.ListPublic", conn,
		"",
		fmt.Sprintf("%d Scenarios", len(*scenarios)))

	return nil
}

func (s *ScenarioRPC) ListByUser(data shared.ScenarioRPCData, scenarios *[]shared.Scenario) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)
	if conn.Rank < 9 {
		return errors.New("Insufficient Privilege")
	}

	DB.SQL(`select s.id,s.author_id,a.username as author_name,s.name,s.descr,s.year
		from scenario s
			left join users a on a.id=s.author_id
		where author_id = $1
		order by year`, data.ID).
		QueryStructs(scenarios)

	logger(start, "Scenario.ListByUser", conn,
		"",
		fmt.Sprintf("%d Scenarios", len(*scenarios)))

	return nil
}

func (c *ScenarioRPC) Get(data shared.ScenarioRPCData, retval *shared.Scenario) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	DB.SQL(`select * from scenario where id=$1`, data.ID).QueryStruct(retval)

	logger(start, "Scenario.Get", conn,
		fmt.Sprintf("%d", data.ID),
		fmt.Sprintf("%v", *retval))

	return nil
}

func (c *ScenarioRPC) Update(data shared.ScenarioRPCData, retval *shared.Scenario) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	_, err := DB.Update("scenario").
		SetWhitelist(data.Scenario, "name", "year", "public", "descr", "notes", "red_team", "red_brief", "blue_team", "blue_brief").
		Where("id = $1 and author_id=$2", data.ID, conn.UserID).
		Exec()

	DB.Select("name", "year", "public", "descr", "notes", "red_team", "red_brief", "blue_team", "blue_brief").
		From("scenario").
		Where("id=$1", data.ID).
		Limit(1).
		QueryStruct(retval)

	logger(start, "Scenario.Update", conn,
		fmt.Sprintf("%d", data.ID),
		fmt.Sprintf("%v", *retval))

	return err
}

func (s *ScenarioRPC) Insert(data shared.ScenarioRPCData, retval *shared.Scenario) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)
	if conn == nil || conn.UserID == 0 {
		return errors.New("Invalid User, cannot create new scenario")
	}

	id := 0
	data.Scenario.AuthorID = conn.UserID
	data.Scenario.Public = false

	err := DB.InsertInto("scenario").
		// Whitelist("name", "author_id", "year", "public", "descr", "notes", "red_team", "red_brief", "blue_team", "blue_brief").
		Whitelist("name", "author_id", "year", "descr").
		Record(data.Scenario).
		Returning("id").
		QueryScalar(&id)

	if err == nil {

		err = DB.Select("*").
			From("scenario").
			Where("id=$1", id).
			Limit(1).
			QueryStruct(retval)
	}

	logger(start, "Scenario.Insert", conn,
		fmt.Sprintf("%v", data.Scenario),
		fmt.Sprintf("%d", id))

	return err
}

package main

import (
	"errors"
	"fmt"
	"strings"
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

func (c *ScenarioRPC) UpdateRed(data shared.ScenarioRPCData, retval *shared.Scenario) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	_, err := DB.Update("scenario").
		SetWhitelist(data.Scenario, "red_team", "red_brief").
		Where("id = $1 and author_id=$2", data.ID, conn.UserID).
		Exec()

	DB.Select("red_team", "red_brief").
		From("scenario").
		Where("id=$1", data.ID).
		Limit(1).
		QueryStruct(retval)

	logger(start, "Scenario.UpdateRed", conn,
		fmt.Sprintf("%d", data.ID),
		fmt.Sprintf("%v", *retval))

	return err
}

func (c *ScenarioRPC) UpdateBlue(data shared.ScenarioRPCData, retval *shared.Scenario) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	_, err := DB.Update("scenario").
		SetWhitelist(data.Scenario, "blue_team", "blue_brief").
		Where("id = $1 and author_id=$2", data.ID, conn.UserID).
		Exec()

	DB.Select("blue_team", "blue_brief").
		From("scenario").
		Where("id=$1", data.ID).
		Limit(1).
		QueryStruct(retval)

	logger(start, "Scenario.UpdateBlue", conn,
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

func (s *ScenarioRPC) GetRedForces(data shared.ScenarioRPCData, retval *[]shared.Force) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	err := DB.SQL(`select f.*,l.name as level_name,s.name as scenario_name 
		from force f 
			left join cmd_level l on l.id=f.level
			left join scenario s on s.id=f.scenario_id
		where f.red_team and f.scenario_id=$1
		order by id`, data.ID).QueryStructs(retval)

	logger(start, "Scenario.GetRedForces", conn,
		fmt.Sprintf("Scenario %d", data.ID),
		fmt.Sprintf("%d Red Forces", len(*retval)))

	return err
}

func (s *ScenarioRPC) GetBlueForces(data shared.ScenarioRPCData, retval *[]shared.Force) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	err := DB.SQL(`select f.*,l.name as level_name,s.name as scenario_name 
		from force f 
			left join cmd_level l on l.id=f.level
			left join scenario s on s.id=f.scenario_id
		where f.blue_team and f.scenario_id=$1
		order by id`, data.ID).QueryStructs(retval)

	logger(start, "Scenario.GetBlueForces", conn,
		fmt.Sprintf("Scenario %d", data.ID),
		fmt.Sprintf("%d Blue Forces", len(*retval)))

	return err
}

func (s *ScenarioRPC) InsertForce(data shared.ForceRPCData, retval *shared.Force) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	id := 0
	err := DB.InsertInto("force").
		Whitelist("nation", "name", "level", "scenario_id", "red_team", "blue_team",
			"cmdr_name", "inspiration", "rating", "condition").
		Record(data.Force).
		Returning("id").
		QueryScalar(&id)

	if err == nil {
		DB.SQL(`select * from force where id=$1`, id).QueryStruct(retval)
	}

	logger(start, "Scenario.InsertForce", conn,
		fmt.Sprintf("ID %d", id),
		fmt.Sprintf("%v", *retval))

	return err
}

func (s *ScenarioRPC) GetForce(data shared.ScenarioRPCData, retval *shared.Force) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	err := DB.SQL(`select * from force where id=$1`, data.ID).QueryStruct(retval)

	// now get the units attached
	if err == nil {
		DB.SQL(`select * from force_unit where force_id=$1 order by path`, data.ID).QueryStructs(&retval.Units)
	}

	logger(start, "Session.GetForce", conn,
		fmt.Sprintf("ID %d", data.ID),
		fmt.Sprintf("%v", *retval))

	return err
}

func (s *ScenarioRPC) GetForceUnits(data shared.ScenarioRPCData, retval *[]shared.ForceUnit) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	err := DB.SQL(`select * from force_unit where force_id=$1 order by path`, data.ID).QueryStructs(retval)

	logger(start, "Session.GetForceUnits", conn,
		fmt.Sprintf("ID %d", data.ID),
		fmt.Sprintf("%d Units", len(*retval)))

	return err
}

func (s *ScenarioRPC) UpdateForce(data shared.ForceRPCData, retval *shared.Force) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	_, err := DB.Update("force").
		SetWhitelist(data.Force, "nation", "name", "cmdr_name", "level", "rating", "inspiration", "condition").
		Where("id = $1", data.ID).
		Exec()

	if err == nil {
		err = DB.SQL(`select * from force where id=$1`, data.ID).QueryStruct(retval)
	}

	logger(start, "Scenario.UpdateForce", conn,
		fmt.Sprintf("ID %d", data.ID),
		fmt.Sprintf("%v", *retval))

	return err
}

func (s *ScenarioRPC) AddCommand(data shared.ScenarioRPCData, retval *shared.ForceUnit) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	unit := shared.ForceUnit{
		ForceID:  data.ID,
		Path:     "New_Division",
		UType:    1,
		CmdLevel: 3,
	}
	err := DB.InsertInto("force_unit").
		Whitelist("force_id", "path", "utype", "cmd_level").
		Record(unit).
		Returning("id").
		QueryScalar(&unit.ID)

	if err == nil {
		DB.SQL(`select * from force_unit where id=$1`, unit.ID).QueryStruct(retval)
	}

	logger(start, "Scenario.AddCommand", conn,
		fmt.Sprintf("Force %d", data.ID),
		fmt.Sprintf("%v", *retval))

	return err
}

func (s *ScenarioRPC) AddUnit(data shared.ForceUnitRPCData, retval *shared.ForceUnit) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	// Strip the ParentPath down
	paths := strings.Split(data.ParentPath, ".")

	unit := shared.ForceUnit{
		ForceID:  data.ID,
		Path:     paths[0],
		UType:    data.UType,
		CmdLevel: 4,
		Name:     "",
	}
	switch data.UType {
	case 2:
		unit.Path += "._Brigade"
		unit.Bayonets = 2000
		unit.Drill = 3
		unit.SmallArms = 1
		unit.Rating = 5
	case 3:
		unit.Path += "._Cavalry"
		unit.Sabres = 600
	case 4:
		unit.Path += "._Battery"
		unit.Guns = 8
		unit.GunneryType = 2
		unit.GunCondition = 3
	case 5:
		unit.Path += "._Detachment"
	}
	err := DB.InsertInto("force_unit").
		Whitelist("name", "force_id", "path", "utype", "cmd_level", "bayonets", "drill", "small_arms",
			"rating", "sabres", "guns", "gunnery_type", "gun_condition").
		Record(unit).
		Returning("id").
		QueryScalar(&unit.ID)

	if err != nil {
		println("err = ", err.Error())

	}

	DB.SQL(`select * from force_unit where id=$1`, unit.ID).QueryStruct(retval)

	logger(start, "Scenario.AddUnit", conn,
		fmt.Sprintf("Force %d", data.ID),
		fmt.Sprintf("%v", *retval))

	return err
}

func (s *ScenarioRPC) UpdateUnit(data shared.ForceUnitRPCData, retval *shared.ForceUnit) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	// Calculate the Part of the Path
	paths := strings.Split(data.ForceUnit.Path, ".")
	println("paths", paths, len(paths))
	if len(paths) > 0 {
		hackPath := paths[len(paths)-1]
		println("hackpath", hackPath)
		hackPath = strings.NewReplacer(" ", "_", ".", "-", ",", "_").Replace(data.ForceUnit.Name)
		println("hackedpath", hackPath)
		paths[len(paths)-1] = hackPath
		data.ForceUnit.Path = strings.Join(paths, ".")
		println("new path", data.ForceUnit.Path)
	}

	// Get the existing path
	oldPath := ""
	DB.SQL(`select path from force_unit where id=$1`, data.ID).QueryScalar(&oldPath)
	if oldPath != data.ForceUnit.Path {
		println("execute path change from ", oldPath, "to", data.ForceUnit.Path)
		_, eerr := DB.SQL(`update force_unit 
			set path = $1::ltree || subpath(path,1)
			where nlevel(path) > 1 and path <@ $2::ltree`, data.ForceUnit.Path, oldPath).Exec()
		if eerr != nil {
			println(eerr.Error())
		}
	}

	_, err := DB.Update("force_unit").
		SetWhitelist(data.ForceUnit, "path", "name", "commander_name", "nation", "cmd_level", "drill", "bayonets", "small_arms",
			"elite_arms", "lt_coy", "jg_coy", "rating", "sabres", "cav_type", "cav_rating", "guns", "gunnery_type", "gun_condition").
		Where("id = $1", data.ID).
		Exec()

	if err == nil {
		DB.SQL(`select * from force_unit where id=$1`, data.ID).QueryStruct(retval)
	}

	logger(start, "Scenario.UpdateUnit", conn,
		fmt.Sprintf("ID %d", data.ID),
		fmt.Sprintf("%v", *retval))

	return err
}

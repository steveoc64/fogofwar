package main

import (
	"errors"
	"fmt"
	"strings"
	"time"

	"unicode"

	"../shared"

	"golang.org/x/text/transform"
	"golang.org/x/text/unicode/norm"
)

type ScenarioRPC struct{}

func (s *ScenarioRPC) List(channel int, scenarios *[]shared.Scenario) error {
	start := time.Now()

	conn := Connections.Get(channel)

	DB.SQL(`select 
		s.id,s.author_id,a.username as author_name,a.email as author_email,
		s.name,s.descr,s.year,s.public,s.review
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

	err := error(nil)
	// if Admin, then include the review flag
	if conn.Rank > 9 {
		err = DB.SQL(`select 
			s.id,s.author_id,a.username as author_name,a.email as author_email,
			s.name,s.descr,s.year,s.review
		from scenario s
			left join users a on a.id=s.author_id
		where author_id != $1
			and (public or review)
		order by year`, conn.UserID).
			QueryStructs(scenarios)
	} else {
		err = DB.SQL(`select 
			s.id,s.author_id,a.username as author_name,a.email as author_email,
			s.name,s.descr,s.year
		from scenario s
			left join users a on a.id=s.author_id
		where author_id != $1
			and public
		order by year`, conn.UserID).
			QueryStructs(scenarios)
	}

	logger(start, "Scenario.ListPublic", conn,
		"",
		fmt.Sprintf("%d Scenarios", len(*scenarios)))

	return err
}

func (s *ScenarioRPC) ListByUser(data shared.ScenarioRPCData, scenarios *[]shared.Scenario) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)
	if conn.Rank < 9 {
		return errors.New("Insufficient Privilege")
	}

	err := DB.SQL(`select 
			s.id,s.author_id,a.username as author_name,a.email as author_email,
			s.name,s.descr,s.year
		from scenario s
			left join users a on a.id=s.author_id
		where author_id = $1
		order by year`, data.ID).
		QueryStructs(scenarios)

	logger(start, "Scenario.ListByUser", conn,
		"",
		fmt.Sprintf("%d Scenarios", len(*scenarios)))

	return err
}

func (s *ScenarioRPC) GetForks(data shared.ScenarioRPCData, scenarios *[]shared.Scenario) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	err := DB.SQL(`select 
			s.id,s.author_id,a.username as author_name,a.email as author_email,
			s.name,s.descr,s.year
		from scenario s
			left join users a on a.id=s.author_id
		where forked_from = $1
		and public
		order by year`, data.ID).
		QueryStructs(scenarios)

	logger(start, "Scenario.GetForks", conn,
		fmt.Sprintf("ID: %d", data.ID),
		fmt.Sprintf("%d Scenarios", len(*scenarios)))

	return err
}

func (c *ScenarioRPC) Get(data shared.ScenarioRPCData, retval *shared.Scenario) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	err := DB.SQL(`select s.*,u.username as author_name,u.email as author_email
	 from scenario s
	 left join users u on u.id=s.author_id
	 where s.id=$1`, data.ID).QueryStruct(retval)

	retval.IsMine = false
	if err == nil {
		retval.IsMine = retval.AuthorID == conn.UserID
		println("ismine", retval.AuthorID, conn.UserID, retval.IsMine)

		numForks := 0
		DB.SQL(`select count(*) 
			from scenario 
			where forked_from=$1 and public`, data.ID).QueryScalar(&numForks)
		retval.NumForks = numForks
	}

	logger(start, "Scenario.Get", conn,
		fmt.Sprintf("%d", data.ID),
		fmt.Sprintf("%s", retval.Name))

	return err
}

func (c *ScenarioRPC) Unlock(data shared.ScenarioRPCData, done *bool) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	*done = false

	err := error(nil)
	if conn.Rank > 9 {
		_, err = DB.SQL(`update scenario
		set public=true
		where id=$1 and author_id=$2`, data.ID, conn.UserID).Exec()
	} else {
		_, err = DB.SQL(`update scenario
		set review=true
		where id=$1 and author_id=$2`, data.ID, conn.UserID).Exec()
	}
	if err == nil {
		*done = true
		conn.Broadcast("Scenario", "Unlock", data.ID)
	}

	logger(start, "Scenario.Unlock", conn,
		fmt.Sprintf("ID %d", data.ID), "")

	return err
}

func (c *ScenarioRPC) Lock(data shared.ScenarioRPCData, done *bool) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	*done = false

	_, err := DB.SQL(`update scenario
		set review=false,public=false
		where id=$1 and author_id=$2`, data.ID, conn.UserID).Exec()

	if err == nil {
		*done = true
		conn.Broadcast("Scenario", "Unlock", data.ID)
	}

	logger(start, "Scenario.Lock", conn,
		fmt.Sprintf("ID %d", data.ID), "")

	return err
}

func (c *ScenarioRPC) Accept(data shared.ScenarioRPCData, done *bool) error {
	start := time.Now()

	*done = false
	conn := Connections.Get(data.Channel)
	if conn.Rank < 9 {
		return errors.New("Insufficient Priv")
	}

	_, err := DB.SQL(`update scenario
		set public=true,review=false
		where id=$1 and review=true`, data.ID).Exec()

	if err == nil {
		*done = true
		conn.Broadcast("Scenario", "Unlock", data.ID)
	}

	logger(start, "Scenario.Accept", conn,
		fmt.Sprintf("ID %d", data.ID), "")

	return err
}

func (c *ScenarioRPC) Update(data shared.ScenarioRPCData, retval *shared.Scenario) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	err := error(nil)

	if conn.Rank > 9 {
		_, err = DB.Update("scenario").
			SetWhitelist(data.Scenario, "name", "year", "public", "review", "descr", "notes",
				"red_team", "red_brief", "blue_team", "blue_brief").
			Where("id = $1", data.ID, conn.UserID).
			Exec()
	} else {
		_, err = DB.Update("scenario").
			SetWhitelist(data.Scenario, "name", "year", "public", "descr", "notes",
				"red_team", "red_brief", "blue_team", "blue_brief").
			Where("id = $1 and author_id=$2", data.ID, conn.UserID).
			Exec()
	}

	if err == nil {

		DB.Select("name", "year", "public", "descr", "notes", "red_team", "red_brief", "blue_team", "blue_brief").
			From("scenario").
			Where("id=$1", data.ID).
			Limit(1).
			QueryStruct(retval)

		conn.Broadcast("Scenario", "Change", data.ID)
	}

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

	if err == nil {
		conn.Broadcast("Scenario", "Insert", id)
	}

	return err
}

func (s *ScenarioRPC) GetRedForces(data shared.ScenarioRPCData, retval *[]shared.Force) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	// err := DB.SQL(`select f.*,l.name as level_name,s.name as scenario_name
	// 	from force f
	// 		left join cmd_level l on l.id=f.level
	// 		left join scenario s on s.id=f.scenario_id
	// 	where f.red_team and f.scenario_id=$1
	// 	order by id`, data.ID).QueryStructs(retval)
	err := DB.SQL(`select f.*,l.name as level_name,s.name as scenario_name,
		sum(u.bayonets) as bayonets, 
		sum(u.sabres) as sabres,
		sum(u.guns) as guns
		from force f 
			left join cmd_level l on l.id=f.level
			left join scenario s on s.id=f.scenario_id
			left join force_unit u on u.force_id=f.id
		where f.red_team and f.scenario_id=$1
		group by f.id,l.name,s.name
		order by f.id`, data.ID).QueryStructs(retval)

	logger(start, "Scenario.GetRedForces", conn,
		fmt.Sprintf("Scenario %d", data.ID),
		fmt.Sprintf("%d Red Forces", len(*retval)))

	return err
}

func (s *ScenarioRPC) GetBlueForces(data shared.ScenarioRPCData, retval *[]shared.Force) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	err := DB.SQL(`select f.*,l.name as level_name,s.name as scenario_name,
		sum(u.bayonets) as bayonets, 
		sum(u.sabres) as sabres,
		sum(u.guns) as guns
		from force f 
			left join cmd_level l on l.id=f.level
			left join scenario s on s.id=f.scenario_id
			left join force_unit u on u.force_id=f.id
		where f.blue_team and f.scenario_id=$1
		group by f.id,l.name,s.name
		order by f.id`, data.ID).QueryStructs(retval)

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
			"commander_name", "inspiration", "rating", "condition").
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
		SetWhitelist(data.Force, "nation", "name", "commander_name", "level", "rating", "inspiration", "condition").
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
		Rating:   3,
	}
	err := DB.InsertInto("force_unit").
		Whitelist("force_id", "path", "utype", "cmd_level", "rating").
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
	if unit.Path != "" {
		unit.Path += "."
	}
	switch data.UType {
	case 2:
		unit.Path += "_Brigade"
		unit.Bayonets = 1800
		unit.Drill = 3
		unit.SmallArms = 1
		unit.Rating = 5 // default to regular morale
	case 3:
		unit.Path += "_Cavalry"
		unit.Sabres = 600
		unit.Rating = 3 // default to Elite morale
	case 4:
		unit.Path += "_Battery"
		unit.Guns = 8
		unit.GunneryType = 3
		unit.GunCondition = 3
		unit.Rating = 4 // default to crack line morale
	case 5:
		unit.Path += "_Detachment"
		unit.Bayonets = 200
		unit.LtCoy = 4
		unit.Drill = 9
		unit.SmallArms = 1
		unit.EliteArms = 2
		unit.Rating = 3 // default to elite
	}

	err := DB.InsertInto("force_unit").
		Whitelist("name", "force_id", "path", "utype", "cmd_level",
			"bayonets", "drill", "small_arms",
			"lt_coy", "jg_coy", "elite_arms",
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

	if data.ForceUnit.Name == "" {
		return errors.New("Enter a name to save")
	}

	if data.ForceUnit.Name == "New Division" && data.ForceUnit.UType == 1 {
		return errors.New("The name New_Division is reserved, please chosse another name")
	}

	conn := Connections.Get(data.Channel)

	// Calculate the Part of the Path
	paths := strings.Split(data.ForceUnit.Path, ".")
	// println("paths", paths, len(paths))
	if len(paths) > 0 {
		hackPath := paths[len(paths)-1]
		// println("hackpath", hackPath)
		hackPath = strings.NewReplacer(
			"ß", "ss", "ð", "d",
			"/", "_",
			`'`, "",
			`’`, "",
			`"`, "",
			"\"", "",
			" ", "_",
			".", "",
			`°`, "e",
			"&", "",
			"(", "",
			")", "",
			"[", "",
			"]", "",
			"!", "",
			"-", "",
			",", "").Replace(data.ForceUnit.Name)
		// println("hackedpath", hackPath)
		paths[len(paths)-1] = hackPath
		data.ForceUnit.Path = strings.Join(paths, ".")
		// println("new path", data.ForceUnit.Path)
	}

	if data.ForceUnit.Path == "" {
		return errors.New("Blank name .. will not record this change")
	}

	isMn := func(r rune) bool {
		return unicode.Is(unicode.Mn, r) // Mn: nonspacing marks
	}

	t := transform.Chain(norm.NFD, transform.RemoveFunc(isMn), norm.NFC)
	result, _, _ := transform.String(t, data.ForceUnit.Path)
	//"žůžo")
	// fmt.Println(result)
	// return nil

	// For double safety, check that the computed path is not blank when converted to an ltree
	lresult := ""
	treeErr := DB.SQL(`select $1::ltree`, result).QueryScalar(&lresult)
	if treeErr != nil {
		return errors.New("Cannot convert " + result + " to ltree .. try cutting back on the non-printable characters.")
	}
	// println("was", result, "is", lresult)
	// return nil

	if lresult == "" {
		return errors.New("Converted unit full path name " + result + " is blank - cant save, try another name")
	}

	// Finally, check that the newly computed path is unique within this force
	samePathCount := 0
	DB.SQL(`select count(*) from force_unit 
		where force_id=$2
		and id != $1
		and path=$3`, data.ID, data.ForceUnit.ForceID, result).
		QueryScalar(&samePathCount)

	if samePathCount > 0 {
		return errors.New("Another Unit in this force uses the same name .. not saved")
	}

	data.ForceUnit.Path = result

	// Get the existing path
	oldPath := ""
	DB.SQL(`select path from force_unit where id=$1`, data.ID).QueryScalar(&oldPath)
	if oldPath != "" && oldPath != data.ForceUnit.Path {
		println("execute path change from ", oldPath, "to", data.ForceUnit.Path, "for force", data.ForceUnit.ForceID)
		// println(`update force_unit
		// 	set path = '` + data.ForceUnit.Path + `'::ltree || subpath(path,1)
		// 	where force_id=27
		// 	and nlevel(path) > 1 and path <@ '` + oldPath + `'::ltree`)

		// println("exec the update")

		_, eerr := DB.SQL(`update force_unit 
			set path = $1::ltree || subpath(path,1)
			where force_id=$3
			and nlevel(path) > 1 and path <@ $2::ltree`, data.ForceUnit.Path, oldPath, data.ForceUnit.ForceID).Exec()

		// println("eerr is", eerr)

		if eerr != nil {
			println(eerr.Error())
			return errors.New(eerr.Error())
			// } else {
			// println("so we are here now")
		}
	}

	_, err := DB.Update("force_unit").
		SetWhitelist(data.ForceUnit, "path", "name", "descr", "commander_name", "nation", "cmd_level",
			"drill", "bayonets", "small_arms", "elite_arms", "lt_coy", "jg_coy", "rating",
			"sabres", "cav_type", "cav_rating",
			"guns", "gunnery_type", "gun_condition", "horse_guns").
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

func (s *ScenarioRPC) DeleteUnit(data shared.ForceUnitRPCData, retval *[]shared.ForceUnit) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	// Get the record to be deleted
	oldUnit := shared.ForceUnit{}
	err := DB.SQL(`select * from force_unit where id=$1`, data.ID).QueryStruct(&oldUnit)
	if err != nil {
		println(err.Error())
		return err
	}

	// Kill off subunits IN THE SAME FORCE
	if oldUnit.Path != "" && oldUnit.UType == 1 {
		_, err = DB.SQL(`delete
	 from force_unit 
	 where path <@ $1::ltree 
	 and utype > 1 
	 and force_id=$2`, oldUnit.Path, oldUnit.ForceID).Exec()
		if err != nil {
			println(err.Error())
			return err
		}
	}

	// Kill this unit
	_, err = DB.SQL(`delete from force_unit where id=$1`, data.ID).Exec()

	// Get whats left into a new array and return that
	err = DB.SQL(`select * from force_unit where force_id=$1 order by path`, oldUnit.ForceID).QueryStructs(retval)

	logger(start, "Scenario.DeleteUnit", conn,
		fmt.Sprintf("ID %d", data.ID),
		fmt.Sprintf("Leaving %d Units", len(*retval)))

	return err
}

func (s *ScenarioRPC) CloneUnit(data shared.ForceUnitRPCData, retval *[]shared.ForceUnit) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	// Get the record to be cloned
	oldUnit := shared.ForceUnit{}
	err := DB.SQL(`select * from force_unit where id=$1`, data.ID).QueryStruct(&oldUnit)
	if err != nil {
		println(err.Error())
		return err
	}
	println("looking for things that match the path", oldUnit.ForceID, oldUnit.Path)
	newPath := oldUnit.Path + "_Copy"

	if oldUnit.Path == "" {
		return errors.New("OldPath is blank, so we cant clone this one")
	}

	// Clone the original unit
	_, err = DB.SQL(`insert into force_unit
		(force_id,
			path,
			name,
			commander_name,descr,nation,utype,drill,bayonets,
			small_arms,elite_arms,lt_coy,jg_coy,rating,sabres,cav_type,cav_rating,
			guns,gunnery_type,gun_condition,horse_guns)
		select force_id,
			$2,
			name||'_Copy',
			commander_name,descr,nation,utype,drill,bayonets,
			small_arms,elite_arms,lt_coy,jg_coy,rating,sabres,cav_type,cav_rating,
			guns,gunnery_type,gun_condition,horse_guns
		from force_unit
		where id=$1`, data.ID, newPath).Exec()

	if err != nil {
		print(err.Error())
		return err
	}

	// Do the cloning op in 1 pass for all subunits of this one, IF this is a cmd
	if oldUnit.UType == 1 {
		_, err = DB.SQL(`insert into force_unit 
		(force_id,
			path,
			name,
			commander_name,descr,nation,utype,drill,bayonets,
			small_arms,elite_arms,lt_coy,jg_coy,rating,sabres,cav_type,cav_rating,
			guns,gunnery_type,gun_condition,horse_guns)
		select force_id,
			text2ltree(ltree2text(subltree(path,0,1))||'_Copy.'||ltree2text(subpath(path,1))||'_Copy'),
			name||'_Copy',
			commander_name,descr,nation,utype,drill,bayonets,
			small_arms,elite_arms,lt_coy,jg_coy,rating,sabres,cav_type,cav_rating,
			guns,gunnery_type,gun_condition,horse_guns
		from force_unit
		where force_id=$1
		and nlevel(path)>1
		and path <@ $2::ltree`, oldUnit.ForceID, oldUnit.Path).Exec()
	}

	if err != nil {
		print(err.Error())
		return err
	}

	// Get whats left into a new array and return that
	err = DB.SQL(`select * from force_unit where force_id=$1 order by path`, oldUnit.ForceID).QueryStructs(retval)

	logger(start, "Scenario.CloneUnit", conn,
		fmt.Sprintf("ID %d", data.ID),
		fmt.Sprintf("New Total of %d Units", len(*retval)))

	return err
}

func (s *ScenarioRPC) DeleteForce(data shared.ForceRPCData, done *bool) error {
	start := time.Now()

	*done = false
	conn := Connections.Get(data.Channel)

	// get the force to be deleted, and check that the scenario is owned by this user
	force := shared.Force{}
	scen := shared.Scenario{}
	DB.SQL(`select * from force where id=$1`, data.ID).QueryStruct(&force)
	DB.SQL(`select * from scenario where id=$1`, force.ScenarioID).QueryStruct(&scen)
	if scen.AuthorID != conn.UserID {
		return errors.New("Cant delete someone else scenario")
	}

	_, err := DB.SQL(`delete from force where id=$1`, data.ID).Exec()
	if err != nil {
		println(err.Error())
	} else {
		*done = true

		DB.SQL(`delete from force_unit where force_id=$1`, data.ID).Exec()
	}

	logger(start, "Scenario.DeleteForce", conn,
		fmt.Sprintf("ID %d", data.ID),
		"")

	return err
}

func (s *ScenarioRPC) Delete(data shared.ScenarioRPCData, done *bool) error {
	start := time.Now()

	*done = false
	conn := Connections.Get(data.Channel)

	err := error(nil)
	if conn.Rank > 9 {
		_, err = DB.SQL(`delete from scenario where id=$1`, data.ID, conn.UserID).Exec()
	} else {
		_, err = DB.SQL(`delete from scenario where id=$1 and author_id=$2`, data.ID, conn.UserID).Exec()
	}

	if err != nil {
		println(err.Error())
	} else {
		*done = true

		_, eerr := DB.SQL(`delete from force_unit u
		 where u.force_id in
		 (select f.id
		 	from force f
		 	where f.scenario_id=$1)`, data.ID).Exec()
		if eerr != nil {
			println(eerr.Error())
		}

		_, eerr = DB.SQL(`delete 
			from force 
			where scenario_id=$1`, data.ID).Exec()
		if eerr != nil {
			println(eerr.Error())
		}
	}

	logger(start, "Scenario.Delete", conn,
		fmt.Sprintf("ID %d", data.ID),
		"")

	if err == nil {
		conn.Broadcast("Scenario", "Deleted", data.ID)
	}

	return err
}

func (s *ScenarioRPC) Fork(data shared.ScenarioRPCData, newID *int) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	*newID = 0
	oldScen := shared.Scenario{}
	err := DB.SQL(`select * from scenario where id=$1`, data.ID).QueryStruct(&oldScen)
	if err != nil {
		return err
	}

	if !oldScen.Public {
		return errors.New("Scenario is not public")
	}

	// TODO - check that the user has enough slots to allow this

	// Create a new scenario header
	err = DB.SQL(`insert into scenario
		(author_id,forked_from,name,year,descr,notes,public,review,
			red_team,blue_team,red_brief,blue_brief)
		select  
		$1,$2, 'Copy of - '||name,year,'Copy of - '||descr,notes,'false','false',
		red_team,blue_team,red_brief,blue_brief
		from scenario where id=$2
		returning id`, conn.UserID, data.ID).QueryScalar(newID)
	println("newid is ", *newID)

	if err == nil {
		// now add the forces

		forces := []shared.Force{}
		err = DB.SQL(`select * from force where scenario_id=$1`, data.ID).QueryStructs(&forces)

		for _, oldForce := range forces {
			newForceID := 0
			oldForce.ScenarioID = *newID
			err := DB.InsertInto("force").
				Whitelist("scenario_id", "red_team", "blue_team", "nation",
					"commander_name", "level", "descr", "rating", "inspiration", "condition").
				Record(oldForce).
				Returning("id").
				QueryScalar(&newForceID)
			println("added force", newForceID, "from", oldForce.ID)

			if err == nil {
				// Now copy all the force units across

				_, err = DB.SQL(`insert into force_unit 
					(force_id,path,name,descr,commander_name,nation,utype,cmd_level,drill,
						bayonets,small_arms,elite_arms,lt_coy,jg_coy,rating,sabres,cav_type,cav_rating,
						guns,gunnery_type,gun_condition,horse_guns)
					select
					$2,path,name,descr,commander_name,nation,utype,cmd_level,drill,
						bayonets,small_arms,elite_arms,lt_coy,jg_coy,rating,sabres,cav_type,cav_rating,
						guns,gunnery_type,gun_condition,horse_guns
					from force_unit 
					where force_id=$1`, oldForce.ID, newForceID).Exec()

				if err != nil {
					println(err.Error())
					break
				}
			} else {
				println(err.Error())
			}
		}
	} else {
		println(err.Error())
	}

	logger(start, "Scenario.Fork ", conn,
		fmt.Sprintf("ID %d", data.ID), "")

	if err == nil {
		conn.Broadcast("Scenario", "Fork", data.ID)
	}

	return err
}

func (s *ScenarioRPC) CreateGame(data shared.ScenarioRPCData, newID *int) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	*newID = 0
	oldScen := shared.Scenario{}
	err := DB.SQL(`select * from scenario where id=$1`, data.ID).QueryStruct(&oldScen)
	if err != nil {
		return err
	}

	if oldScen.Public || oldScen.AuthorID == conn.UserID {
		// println("OK to copy")
	} else {
		return errors.New("Scenario is not available for creating a game")
	}

	// TODO - check that the user has enough slots to allow this

	// Create a new game header
	err = DB.SQL(`insert into game
		(hosted_by,scenario_id,name,descr,notes,year,latlon,
			red_team,red_brief,blue_team,blue_brief)
		select  $1,$2,name,descr,notes,year,latlon,
			red_team,red_brief,blue_team,blue_brief
		from scenario 
		where id=$2
		returning id`, conn.UserID, data.ID).QueryScalar(newID)
	// println("newid is ", *newID)

	if err == nil {
		// now add the game_cmd records from the original force records

		forces := []shared.Force{}
		err = DB.SQL(`select * from force where scenario_id=$1`, data.ID).QueryStructs(&forces)

		for _, oldForce := range forces {
			newCmdID := 0

			newCmd := shared.GameCmd{
				GameID:        *newID,
				RedTeam:       oldForce.RedTeam,
				BlueTeam:      oldForce.BlueTeam,
				Nation:        oldForce.Nation,
				Name:          oldForce.Name,
				Descr:         oldForce.Descr,
				CommanderName: oldForce.CommanderName,
				Level:         oldForce.Level,
				Rating:        oldForce.Rating,
				Inspiration:   oldForce.Inspiration,
				Condition:     oldForce.Condition,
			}
			err := DB.InsertInto("game_cmd").
				Whitelist("game_id", "red_team", "blue_team", "nation", "name",
					"commander_name", "level", "descr", "rating", "inspiration", "condition").
				Record(newCmd).
				Returning("id").
				QueryScalar(&newCmdID)
			// println("added cmd", newCmdID, "from force", oldForce.ID)

			if err == nil {
				// Now copy all the force units across

				_, err = DB.SQL(`insert into unit 
					(game_id,cmd_id,path,name,descr,commander_name,nation,utype,cmd_level,drill,
						bayonets,small_arms,elite_arms,lt_coy,jg_coy,rating,sabres,cav_type,cav_rating,
						guns,gunnery_type,gun_condition,horse_guns)
					select
					$3,$2,path,name,descr,commander_name,nation,utype,cmd_level,drill,
						bayonets,small_arms,elite_arms,lt_coy,jg_coy,rating,sabres,cav_type,cav_rating,
						guns,gunnery_type,gun_condition,horse_guns
					from force_unit 
					where force_id=$1`, oldForce.ID, newCmdID, *newID).Exec()

				if err != nil {
					println(err.Error())
					break
				}
			} else {
				println(err.Error())
			}
		}
	} else {
		println(err.Error())
	}

	logger(start, "Scenario.CreateGame ", conn,
		fmt.Sprintf("Scenario %d", data.ID),
		fmt.Sprintf("Game %d", *newID))

	if err == nil {
		conn.Broadcast("Game", "New", *newID)
	}

	return err
}

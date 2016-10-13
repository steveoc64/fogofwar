package main

import (
	_ "image/png"
	"log"
	"os/exec"
	"time"

	"../shared"
)

type UtilRPC struct{}

// Do a simple database backup
func (u *UtilRPC) Backup(channel int, result *string) error {
	start := time.Now()

	conn := Connections.Get(channel)
	*result = ""

	if conn.Rank > 9 {
		out, err := exec.Command("../scripts/cmms-backup.sh").Output()
		if err != nil {
			log.Println(err)
			*result = err.Error()
			return nil
		}
		*result = string(out)
	}

	logger(start, "Util.Backup", conn,
		"", *result)

	return nil
}

// Run a top command and return the results
func (u *UtilRPC) Top(channel int, result *string) error {
	start := time.Now()

	conn := Connections.Get(channel)
	*result = ""

	if conn.Rank > 9 {
		out, err := exec.Command("../scripts/top.sh").Output()
		if err != nil {
			log.Println(err)
			*result = err.Error()
			return nil
		}
		*result = string(out)
	}

	logger(start, "Util.Top", conn,
		"", *result)

	return nil
}

// Tail the output of the server process log file, and return the result
func (u *UtilRPC) Logs(channel int, result *string) error {
	start := time.Now()

	conn := Connections.Get(channel)
	*result = ""

	if conn.Rank > 9 {
		out, err := exec.Command("../scripts/logs.sh").Output()
		if err != nil {
			log.Println(err)
			*result = err.Error()
			return nil
		}
		*result = string(out)
	}

	logger(start, "Util.Logs", conn,
		"", *result)

	return nil
}

// func (u *UtilRPC) GetCmdLevels(Channel int, retval *[]shared.CmdLevel) error {
// 	start := time.Now()

// 	conn := Connections.Get(Channel)

// 	err := DB.SQL(`select * from cmd_level order by id`).QueryStructs(retval)

// 	logger(start, "Util.GetCmdLevels", conn,
// 		fmt.Sprintf(""),
// 		fmt.Sprintf("%d Records", len(*retval)))

// 	return err
// }

// func (u *UtilRPC) GetCmdRatings(Channel int, retval *[]shared.CmdRating) error {
// 	start := time.Now()

// 	conn := Connections.Get(Channel)

// 	err := DB.SQL(`select * from cmd_rating order by id`).QueryStructs(retval)

// 	logger(start, "Util.GetCmdRatings", conn,
// 		fmt.Sprintf(""),
// 		fmt.Sprintf("%d Records", len(*retval)))

// 	return err
// }

// func (u *UtilRPC) GetInspirations(Channel int, retval *[]shared.Inspiration) error {
// 	start := time.Now()

// 	conn := Connections.Get(Channel)

// 	err := DB.SQL(`select * from inspiration order by id`).QueryStructs(retval)

// 	logger(start, "Util.GetInspirations", conn,
// 		fmt.Sprintf(""),
// 		fmt.Sprintf("%d Records", len(*retval)))

// 	return err
// }

// func (u *UtilRPC) GetConditions(Channel int, retval *[]shared.Condition) error {
// 	start := time.Now()

// 	conn := Connections.Get(Channel)

// 	err := DB.SQL(`select * from condition order by id`).QueryStructs(retval)

// 	logger(start, "Util.GetConditions", conn,
// 		fmt.Sprintf(""),
// 		fmt.Sprintf("%d Records", len(*retval)))

// 	return err
// }

// func (u *UtilRPC) GetRatings(Channel int, retval *[]shared.UnitRating) error {
// 	start := time.Now()

// 	conn := Connections.Get(Channel)

// 	err := DB.SQL(`select * from rating order by id`).QueryStructs(retval)

// 	logger(start, "Util.GetRatings", conn,
// 		fmt.Sprintf(""),
// 		fmt.Sprintf("%d Records", len(*retval)))

// 	return err
// }

// func (u *UtilRPC) GetCavTypes(Channel int, retval *[]shared.CavType) error {
// 	start := time.Now()

// 	conn := Connections.Get(Channel)

// 	err := DB.SQL(`select * from cav_type order by id`).QueryStructs(retval)

// 	logger(start, "Util.GetCavType", conn,
// 		fmt.Sprintf(""),
// 		fmt.Sprintf("%d Records", len(*retval)))

// 	return err
// }

// func (u *UtilRPC) GetGunnery(Channel int, retval *[]shared.Gunnery) error {
// 	start := time.Now()

// 	conn := Connections.Get(Channel)

// 	err := DB.SQL(`select * from gunnery order by id`).QueryStructs(retval)

// 	logger(start, "Util.GetGunnery", conn,
// 		fmt.Sprintf(""),
// 		fmt.Sprintf("%d Records", len(*retval)))

// 	return err
// }

// func (u *UtilRPC) GetDrills(Channel int, retval *[]shared.DrillType) error {
// 	start := time.Now()

// 	conn := Connections.Get(Channel)

// 	err := DB.SQL(`select * from drill order by id`).QueryStructs(retval)

// 	logger(start, "Util.GetDrills", conn,
// 		fmt.Sprintf(""),
// 		fmt.Sprintf("%d Records", len(*retval)))

// 	return err
// }

// func (u *UtilRPC) GetSmallArms(Channel int, retval *[]shared.SmallArms) error {
// 	start := time.Now()

// 	conn := Connections.Get(Channel)

// 	err := DB.SQL(`select * from small_arms order by id`).QueryStructs(retval)

// 	logger(start, "Util.GetSmallArms", conn,
// 		fmt.Sprintf(""),
// 		fmt.Sprintf("%d Records", len(*retval)))

// 	return err
// }

func getLookupTable() shared.LookupTable {

	l := shared.LookupTable{}
	DB.SQL(`select * from cmd_level order by id`).QueryStructs(&l.CmdLevel)
	DB.SQL(`select * from cmd_rating order by id`).QueryStructs(&l.CmdRating)
	DB.SQL(`select * from inspiration order by id`).QueryStructs(&l.Inspiration)
	DB.SQL(`select * from condition order by id`).QueryStructs(&l.Condition)
	DB.SQL(`select * from rating order by id`).QueryStructs(&l.UnitRating)
	DB.SQL(`select * from cav_type order by id`).QueryStructs(&l.CavType)
	DB.SQL(`select * from gunnery order by id`).QueryStructs(&l.Gunnery)
	DB.SQL(`select * from drill order by id`).QueryStructs(&l.DrillType)
	DB.SQL(`select * from small_arms order by id`).QueryStructs(&l.SmallArms)

	return l
}

package main

import (
	"fmt"
	_ "image/png"
	"log"
	"os/exec"
	"time"
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

	logger(start, "Util.Backup",
		fmt.Sprintf("Channel %d, User %d %s %s",
			channel, conn.UserID, conn.Username, conn.GetRank()),
		*result,
		channel, conn.UserID, "", 0, false)

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

	logger(start, "Util.Top",
		fmt.Sprintf("Channel %d, User %d %s %s",
			channel, conn.UserID, conn.Username, conn.GetRank()),
		"top",
		channel, conn.UserID, "", 0, false)

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

	logger(start, "Util.Logs",
		fmt.Sprintf("Channel %d, User %d %s %s",
			channel, conn.UserID, conn.Username, conn.GetRank()),
		"logs",
		channel, conn.UserID, "", 0, false)

	return nil
}

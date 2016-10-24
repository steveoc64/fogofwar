package main

import (
	"log"
	"os/exec"
	"time"
)

func autoBackup() {

	log.Printf("... Running auto-backup scheduler")
	go func() {

		// Init Hours to be the hour of the day
		// hours := time.Now().Hour()
		hours := 0

		for {
			time.Sleep(1 * time.Hour)

			hours++
			if hours >= 24 {
				hours = 0
				// hours = time.Now().Hour()
				log.Println("Running for 24 Hours - auto db backup")
				out, err := exec.Command("../scripts/backup.sh").Output()
				if err != nil {
					log.Println(err)
				} else {
					log.Println(string(out))
				}
			}
		}
	}()
}

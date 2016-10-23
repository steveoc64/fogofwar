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
		hours := time.Now().Hour()

		for {
			time.Sleep(1 * time.Hour)

			hours++
			if hours >= 24 {
				hours = time.Now().Hour()
				log.Println("24 Hours - db backup")
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

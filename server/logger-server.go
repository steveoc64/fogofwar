package main

import (
	"fmt"
	"log"
	"time"
)

func logger(start time.Time, function string, channel int, user_id int, username string, in string, out string) {
	d := fmt.Sprintf("%s", time.Since(start))
	s1 := fmt.Sprintf(`%-20s %10s `, function, d)
	log.Printf(`%-35s %d:%d:%s » %-50s « %s`, s1, channel, user_id, username, in, out)
}

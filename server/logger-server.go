package main

import (
	"fmt"
	"log"
	"time"
)

func logger(start time.Time, function string, conn *Connection, in string, out string) {
	d := fmt.Sprintf("%s", time.Since(start))
	s1 := fmt.Sprintf(`%-20s %10s `, function, d)
	if conn == nil {
		log.Printf(`%-35s NIL » %-50s « %s`, s1, in, out)
	} else {
		log.Printf(`%-35s %d:%d:%s » %-50s « %s`, s1, conn.ID, conn.UserID, conn.Username, in, out)
	}
}

package main

import (
	"../shared"
	//"log"
)

type PingRPC struct{}

func (p *PingRPC) Ping(msg string, out *shared.NetData) error {
	out.Action = "Ping"
	out.ID = 0
	return nil
}

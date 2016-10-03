package main

import (
	"log"
	"net/rpc"
)

func registerRPC() {

	log.Println("Registering RPC services:")

	if err := rpc.Register(new(LoginRPC)); err != nil {
		log.Fatal(err)
	}
	log.Println("» Login")
}

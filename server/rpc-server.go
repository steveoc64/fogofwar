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

	if err := rpc.Register(new(UserRPC)); err != nil {
		log.Fatal(err)
	}
	log.Println("» User")

	if err := rpc.Register(new(CampaignRPC)); err != nil {
		log.Fatal(err)
	}
	log.Println("» Campaign")

}

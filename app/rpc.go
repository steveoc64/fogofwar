package main

import (
	"fmt"
	"time"

	"github.com/gopherjs/gopherjs/js"
)

var LastRPC struct {
	Tx interface{}
	Rx interface{}
}

func RPC(r string, dataIN interface{}, dataOUT interface{}) error {
	start := time.Now()
	// print("RPC", r)
	err := rpcClient.Call(r, dataIN, dataOUT)
	d := fmt.Sprintf("%s", time.Since(start))
	fmt.Printf("» %-30s %10s\n", r, d)
	LastRPC.Tx = dataIN
	LastRPC.Rx = dataOUT
	js.Global.Set("RpcTx", dataIN)
	js.Global.Set("RpcRx", dataOUT)
	if err != nil {
		print("RPC Error: ", err.Error())
	}
	return err
}

func ShowRPC() {
	print(LastRPC)
}

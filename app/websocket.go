package main

import (
	"bufio"
	"encoding/gob"
	"errors"
	"fmt"
	"time"

	"io"
	"net"
	"net/rpc"

	"./shared"
	"github.com/go-humble/locstor"
	"github.com/gopherjs/gopherjs/js"

	"github.com/gopherjs/websocket"
	"honnef.co/go/js/dom"
)

var ws net.Conn
var rpcClient *rpc.Client

var RxTxLights dom.Element

func getWSBaseURL() string {
	document := dom.GetWindow().Document().(dom.HTMLDocument)
	location := document.Location()

	wsProtocol := "ws"
	if location.Protocol == "https:" {
		wsProtocol = "wss"
	}
	if location.Port == "" {
		return fmt.Sprintf("%s://%s/ws", wsProtocol, location.Hostname)
	} else {
		return fmt.Sprintf("%s://%s:%s/ws", wsProtocol, location.Hostname, location.Port)
	}
}

var rxOn bool
var txOn bool

func Lights() {
	if RxTxLights == nil {
		return
	}

	// print("setting lights", rxOn, txOn)

	if rxOn {
		if txOn {
			// RxTxLights.SetAttribute("src", "/img/RoundRxTxB.png")
			RxTxLights.SetAttribute("src", "/img/af-logo-tr.png")

		} else {
			// RxTxLights.SetAttribute("src", "/img/RoundRx__B.png")
			RxTxLights.SetAttribute("src", "/img/af-logo-nr.png")

		}
	} else {
		if txOn {
			// RxTxLights.SetAttribute("src", "/img/Round__TxB.png")
			RxTxLights.SetAttribute("src", "/img/af-logo-tn.png")

		} else {
			// RxTxLights.SetAttribute("src", "/img/RoundRxTx-none.png")
			RxTxLights.SetAttribute("src", "/img/af-logo-nn.png")

		}
	}
}

var isReconnecting bool

func websocketInit() net.Conn {
	Session.Channel = 0
	isReconnecting = false

	wsBaseURL := getWSBaseURL()
	// print("init websocket", wsBaseURL)
	wss, err := websocket.Dial(wsBaseURL)
	if err != nil {
		print("failed to open websocket", wsBaseURL, err.Error())
	}
	ws = wss

	encBuf := bufio.NewWriter(ws)
	client := &myClientCodec{
		rwc:    ws,
		dec:    gob.NewDecoder(ws),
		enc:    gob.NewEncoder(encBuf),
		encBuf: encBuf,
	}
	rpcClient = rpc.NewClientWithCodec(client)

	// Call PingRPC to burn through the message with seq = 0
	out := &shared.NetRequest{
		ServiceMethod: "Ping",
		Seq:           0,
	}
	RPC("PingRPC.Ping", "init channel", out)

	w := dom.GetWindow()
	doc := w.Document()
	RxTxLights = doc.QuerySelector("#rxtx")
	// print("set lights to be", RxTxLights)
	if RxTxLights == nil {
		print("ERROR: No Lights !!!")
	} else {
		// print("init lights null")
		rxOn = false
		txOn = false
		Lights()
	}

	return wss
}

// codec to encode requests and decode responses.''
type myClientCodec struct {
	rwc    io.ReadWriteCloser
	dec    *gob.Decoder
	enc    *gob.Encoder
	encBuf *bufio.Writer
}

func txOff() {
	// run this in a goroutine with a short delay, in order to yield the
	// CPU and give the browser a chance to update the lights
	go func() {
		time.Sleep(100 * time.Millisecond)
		// print("txOff")
		txOn = false
		Lights()
	}()
}

func rxOff() {
	// run this in a goroutine with a short delay, in order to yield the
	// CPU and give the browser a chance to update the lights
	go func() {
		time.Sleep(100 * time.Millisecond)
		// print("rxOff")
		rxOn = false
		Lights()
	}()
}

// Codec must implement this to satisfy the interface, but we use our own header
func (c *myClientCodec) WriteRequest(r *rpc.Request, body interface{}) (err error) {
	// print("rpc ->", r.ServiceMethod)
	// print("wr")
	txOn = true
	Lights()

	defer txOff()

	header := &shared.NetRequest{
		ServiceMethod: r.ServiceMethod,
		Seq:           r.Seq,
	}

	if err = c.enc.Encode(header); err != nil {
		return
	}
	if err = c.enc.Encode(body); err != nil {
		return
	}
	return c.encBuf.Flush()
}

type MsgPayload struct {
	Msg string
}

// Must implement to satisy the interface, but use our own header type
func (c *myClientCodec) ReadResponseHeader(r *rpc.Response) error {

	// print("rrh - blocking read")
	rxOff()
	// rxOn = false
	// Lights()

	header := &shared.NetResponse{}
	err := c.dec.Decode(header)
	fmt.Printf("Got my special header %v\n", header)
	r.ServiceMethod = header.ServiceMethod
	r.Seq = header.Seq
	r.Error = header.Error

	// print("rrh - got a header, start reading body")
	rxOn = true
	Lights()

	// print("rpc header <-", r)
	if err != nil {
		// Try again, in case there is an extra msg to be gobbled
		if err != nil && err.Error() == "extra data in buffer" {
			err = c.dec.Decode(header)
			fmt.Printf("Re-Got my special header %v\n", header)
			r.ServiceMethod = header.ServiceMethod
			r.Seq = header.Seq
			r.Error = header.Error
		} else {
			print("fatal decode error", err.Error())
		}

		if err != nil {
			print("rpc error", err)
			// force application reload
			go autoReload()
		}
	}

	// if async then process the message immediately
	if header.Async {
		println("looks like an Async message")
		// swallow the null body
		c.ReadResponseBody(nil)
		processAsync(header.Data)
		// print("pa")
		txOn = false
		Lights()
	}
	return err
}

func autoReloadFull() {

	print("Connection has expired !!")
	print("Logging out in ... 2")

	go func() {
		// time.Sleep(time.Second)
		// print("................ 2")
		// time.Sleep(time.Second)
		print("........... 1")
		time.Sleep(time.Second)
		print(" !! BYE !!")
		Logout()

		// Force a reload
		js.Global.Get("location").Call("replace", "/")
	}()
}

func ReConnect() error {
	Session.Channel = 0
	Session.Subscriptions = make(map[string]MessageFunction)

	wsBaseURL := getWSBaseURL()
	// print("init websocket", wsBaseURL)
	wss, err := websocket.Dial(wsBaseURL)
	if err != nil {
		return errors.New("Reconnect Error " + err.Error())
	}
	ws = wss

	encBuf := bufio.NewWriter(ws)
	client := &myClientCodec{
		rwc:    ws,
		dec:    gob.NewDecoder(ws),
		enc:    gob.NewEncoder(encBuf),
		encBuf: encBuf,
	}
	rpcClient = rpc.NewClientWithCodec(client)

	// Call PingRPC to burn through the message with seq = 0
	out := &shared.NetRequest{
		ServiceMethod: "Ping",
		Seq:           0,
	}
	RPC("PingRPC.Ping", "init channel", out)

	// Wait a sec to get the channel
	time.Sleep(600 * time.Millisecond)

	if Session.UserID != 0 {
		// They are logged in, so login again
		lc := &shared.LoginCredentials{
			Username: Session.Username,
			Password: Session.Passwd,
			Channel:  Session.Channel,
		}
		// print("login params", lc)

		lr := &shared.LoginReply{}
		err = RPC("LoginRPC.Login", lc, lr)
		if err != nil {
			// Prevent runaway race of auto-logins on bad account infor
			// - or maybe they are already logged in on another account
			Session.Username = ""
			Session.Passwd = ""
			Session.UserID = 0
			locstor.RemoveItem("username")
			locstor.RemoveItem("secret")
			print(err.Error())
			return errors.New("Stop")
		}
		if lr.Result == "OK" {

			if lr.Version != Session.Version {
				Session.SynchEditGame()
				if dom.GetWindow().Confirm(`A New Version of the software has been released.

Will need to quickly refresh the application now .. it will take a few seconds, and then you can get back to what you were doing.

Shall I restart the app for your now (OK) ?`) {
					js.Global.Get("location").Call("replace", "/")
				}
			}
			// createMenu(lr.Menu)
			Session.Rank = lr.Rank
			Session.UserID = lr.ID
			Session.Disqus = lr.Disqus
			Session.Lookup = lr.LookupTable
			Session.Lookup.GridSizes = AllowedGridSizes
			Session.MaxGames = lr.MaxGames
			Session.MaxScenarios = lr.MaxScenarios
			Session.MaxPlayers = lr.MaxPlayers

			loadRoutes(lr.Rank, lr.Routes)
		} else {
			return errors.New("login failed")
		}
	}
	return nil
}

func autoReload() {

	print("Connection has dropped !!")
	Session.Subscriptions = make(map[string]MessageFunction)

	if !isReconnecting {
		go func() {
			count := 0
			keepTrying := true
			isReconnecting = true
			for keepTrying {
				print("Reconnecting in ... 3")
				time.Sleep(time.Second)
				print("................ 2")
				time.Sleep(time.Second)
				print("........... 1")
				time.Sleep(time.Second)
				err := ReConnect()
				if err != nil {
					if err.Error() == "Stop" {
						// We can only get here if the socket is back up and we tried to login
						// again, but the server wont allow us in for whatever reason .. so
						// stop trying
						keepTrying = false
					}
					print(err.Error())
				} else {
					print("Reconnected on channel", Session.Channel)
					if count > 3 {
						dom.GetWindow().Alert("Reconnected !")
					}
					keepTrying = false
					break
				}
				count += 1
				switch count {
				case 5: // 15 secs
					// 	dom.GetWindow().Alert(".. No Connection yet, will keep trying.")
					// case 20: // 1 mins
					// 	dom.GetWindow().Alert(".. Im still trying to connect :(")
					// case 40: // 2 mins
					if !dom.GetWindow().Confirm("Your connection has dropped out ... Shall I keep trying ?") {
						keepTrying = false
						if dom.GetWindow().Confirm("OK. Do you want me to try reloading the app ?") {
							js.Global.Get("location").Call("replace", "/")
						} else {
							print("**** Sauve Qui Peut ! ****")
						}
					}
				}
			}
			isReconnecting = false
		}()
	}
}

func (c *myClientCodec) ReadResponseBody(body interface{}) error {

	fmt.Printf("about to decode body %v\n", body)
	err := c.dec.Decode(body)
	txOff()
	return err
}

func (c *myClientCodec) Close() error {
	print("calling close")
	return c.rwc.Close()
}

func processAsync(msg *shared.NetData) {

	// print("processing async with method =", method)
	// print("and body =", body)
	fmt.Printf("async msg %v\n", msg)

	switch msg.Action {
	case "Ping":
		Session.Channel = msg.ID
		print("Set channel to", Session.Channel)
	case "PingRPC.Ping":
		print("Keepalive")
	default:
		fmt.Printf("Msg: %v", *msg)
		fn := Session.Subscriptions[msg.Action]
		if fn != nil {
			go fn(msg.Action, msg, Session.Context)
		}
	}
}

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

	"github.com/gopherjs/gopherjs/js"

	"./shared"

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
	out := &shared.AsyncMessage{}
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
	rwc           io.ReadWriteCloser
	dec           *gob.Decoder
	enc           *gob.Encoder
	encBuf        *bufio.Writer
	serviceMethod string
	async         bool
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

func (c *myClientCodec) WriteRequest(r *rpc.Request, body interface{}) (err error) {
	// print("rpc ->", r.ServiceMethod)
	// print("wr")
	txOn = true
	Lights()

	defer txOff()

	if err = c.enc.Encode(r); err != nil {
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

func (c *myClientCodec) ReadResponseHeader(r *rpc.Response) error {

	// print("rrh - blocking read")
	rxOff()
	// rxOn = false
	// Lights()

	c.async = false
	c.serviceMethod = ""

	// This will block untill there is something new on the socket to read
	err := c.dec.Decode(r)

	// print("rrh - got a header, start reading body")
	rxOn = true
	Lights()

	// print("rpc header <-", r)
	if err != nil {

		if err != nil && err.Error() == "extra data in buffer" {
			err = c.dec.Decode(r)
		} else {
			print("decode error", err.Error())
		}
		if err != nil {
			print("rpc error", err)
			// force application reload
			go autoReload()
		}
	}
	if err == nil && r.Seq == 0 {
		// print("Async update from server -", r.ServiceMethod)
		c.async = true
		c.serviceMethod = r.ServiceMethod
		return nil
		//return errors.New("Async update from server")
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
	out := &shared.AsyncMessage{}
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
			return errors.New(err.Error())
		}
		if lr.Result == "OK" {
			// createMenu(lr.Menu)
			Session.Rank = lr.Rank
			Session.UserID = lr.ID
			Session.Disqus = lr.Disqus
			Session.Lookup = lr.LookupTable
			loadRoutes(lr.Rank, lr.Routes)
		} else {
			return errors.New("login failed")
		}
	}
	return nil
}

func autoReload() {

	print("Connection has dropped !!")

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

	if c.async {
		// Read the response body into a string
		msg := shared.AsyncMessage{}
		// var b string
		// c.dec.Decode(&b)
		err := c.dec.Decode(&msg)
		if err != nil {
			print("decode error", err.Error())
		}
		// print("appear to be async with body of ", body)
		// processAsync(c.serviceMethod, body)
		processAsync(c.serviceMethod, msg)
		// print("pa")
		txOn = false
		Lights()
		return nil
	}

	err := c.dec.Decode(body)
	txOff()
	// print("rrb")
	// txOn = false
	// Lights()
	return err
}

func (c *myClientCodec) Close() error {
	print("calling close")
	return c.rwc.Close()
}

// type AsyncMessage struct {
// 	Action string
// 	Data   interface{}
// }

func processAsync(method string, msg shared.AsyncMessage) {

	// print("processing async with method =", method)
	// print("and body =", body)

	switch method {
	case "Ping":
		Session.Channel = msg.ID
		// print("Set channel to", Session.Channel)
	case "PingRPC.Ping":
		// print("Keepalive")
	default:
		// print("Msg:", method, "Action:", msg.Action, "ID:", msg.ID)
		fn := Session.Subscriptions[method]
		if fn != nil {
			go fn(msg.Action, msg.ID)
		}
	}
}

// func Subscribe(name string, f func(*shared.AsyncMessage)) int {
// 	// print("subscribing to ", name)
// 	Session.Subscribe = name
// 	Session.SFn = f
// 	return 0
// }

package main

import (
	"bufio"
	"encoding/gob"
	"fmt"
	"io"
	"log"
	"net/rpc"
	"sync"
	"time"

	"../shared"

	"golang.org/x/net/websocket"
)

// Wrapper for socket, which has a controlling mutex to be shared with the RPC server
// and session data once the user logs in on this connection
type Connection struct {
	ID       int
	Active   bool
	Socket   *websocket.Conn
	Mutex    *sync.Mutex
	Username string
	UserID   int
	Rank     int
	Time     time.Time
	ticker   *time.Ticker
	enc      *gob.Encoder
	Route    string
	Routes   []string
}

// Safely send unsolicited RPC response to a connection
func (c *Connection) Send(name string, data *shared.NetData) error {
	c.Mutex.Lock()
	defer c.Mutex.Unlock()

	header := &shared.NetResponse{
		ServiceMethod: name,
		Seq:           0,
		Async:         true,
	}

	if err := c.enc.Encode(header); err != nil {
		log.Println("Header", data.Action, err.Error())
		Connections.Drop(c)
		return err
	}
	if err := c.enc.Encode(data); err != nil {
		log.Println("Payload", data, err.Error())
		Connections.Drop(c)
		return err
	}
	// if err := c.enc.Encode(""); err != nil {
	// return err
	// }
	return nil
}

func (c *Connection) GetRank() string {
	switch c.Rank {
	case 1:
		return "Lt"
	case 2:
		return "Capt"
	case 3:
		return "Maj"
	case 4:
		return "Col"
	case 5:
		return "General"
	case 10:
		return "Marshal"
	default:
		return fmt.Sprintf("Unknown %d", c.Rank)
	}
}

// Upgrade the session data for this connection
func (c *Connection) Login(username string, id int, rank int) {
	c.Username = username
	c.UserID = id
	c.Rank = rank
	c.Route = ""
	c.Time = time.Now()
}

// Constantly Ping the Backend
func (c *Connection) KeepAlive(sec time.Duration) {
	log.Println("init ping to", c.ID)

	c.Send("Ping", &shared.NetData{Action: "Ping", ID: c.ID})
	c.ticker = time.NewTicker(time.Second * sec)
	for range c.ticker.C {
		// log.Println("sending ping to client", c.ID)
		err := c.Send("Ping", &shared.NetData{Action: "Ping", ID: c.ID})
		if err != nil {
			// so remove this one from the list
			log.Println("Send error on", c.ID, err.Error())
			return
		}
	}
}

// Send an async message to everyone but this connection
func (c *Connection) Broadcast(name string, data *shared.NetData) {

	// TODO - IGNORE any connections that are in a Game ... which are
	// connections that will be chatty enough, so we dont need to create
	// unnecessary netword traffic
	for _, v := range Connections.cmap {
		if v != c && v.UserID != 0 {
			log.Println("broadcast", name, data.Action, data.ID, "»", v.ID)
			go v.Send(name, data)
		}
	}
}

// Send an async message to everyone but this connection, if they are admin
func (c *Connection) BroadcastAdmin(name string, data *shared.NetData) {

	for _, v := range Connections.cmap {
		if v != c && v.UserID != 0 && v.Rank > 9 {
			log.Println("broadcastAdmin", name, data.Action, data.ID, "»", v.ID)
			go v.Send(name, data)
		}
	}
}

// Send an async message to a specific player on all connections but this one
func (c *Connection) BroadcastPlayer(playerID int, name string, data *shared.NetData) {

	// println("broadcastPlayer", playerID, name, action)
	for _, v := range Connections.cmap {
		if v != c && v.UserID == playerID {
			log.Println("broadcastPlayer", name, data.Action, data.ID, "»", v.ID)
			go v.Send(name, data)
		}
	}
}

// A collection of Connections
type ConnectionsList struct {
	// conns  []*Connection
	cmap map[int]*Connection
	keys []int

	nextID int
}

func (c *ConnectionsList) Map() map[int]*Connection {
	return c.cmap
}

func (c *ConnectionsList) Keys() []int {
	return c.keys
}

// Send an async message to everyone that is connected
func (c *ConnectionsList) BroadcastAll(name string, data *shared.NetData) {

	for _, v := range c.cmap {
		if v.UserID != 0 {
			log.Println("BroadcastAll", name, data.Action, data.ID, "»", v.ID)
			go v.Send(name, data)
		}
	}
}

// Send an async message to all admins that are connected
func (c *ConnectionsList) BroadcastAdmin(name string, data *shared.NetData) {

	for _, v := range c.cmap {
		if v.UserID != 0 && v.Rank > 9 {
			log.Println("BroadcastAdmin", name, data.Action, data.ID, "»", v.ID)
			go v.Send(name, data)
		}
	}
}

// Send an async message to all admins that are connected
func (c *ConnectionsList) BroadcastPlayer(playerID int, name string, data *shared.NetData) {

	for _, v := range c.cmap {
		if v.UserID == playerID {
			log.Println("BroadcastPlayer", name, data.Action, data.ID, "»", v.ID)
			go v.Send(name, data)
		}
	}
}

var Connections *ConnectionsList

// Find the connection that owns the socket, return nil if not found
func (c *ConnectionsList) Find(ws *websocket.Conn) *Connection {
	for _, conn := range c.cmap {
		if conn.Socket == ws {
			return conn
		}
	}
	return nil
}

// Get the connection by ID
func (c *ConnectionsList) Get(id int) *Connection {
	return c.cmap[id]
}

// Add a websocket to the list, creates a matching Mutex, and returns the meta-Connection
func (c *ConnectionsList) Add(ws *websocket.Conn) *Connection {
	conn := &Connection{
		ID:     c.nextID + 1,
		Socket: ws,
		Mutex:  new(sync.Mutex),
		enc:    gob.NewEncoder(ws),
	}
	// c.conns = append(c.conns, conn)
	c.nextID++
	if c.cmap == nil {
		c.cmap = make(map[int]*Connection)
	}
	c.cmap[c.nextID] = conn
	c.keys = append(c.keys, c.nextID)

	// Now create a keepalive pinger for this connection
	go conn.KeepAlive(55)

	return conn
}

// Remove the websocket from the list by ID
func (c *ConnectionsList) Drop(conn *Connection) *ConnectionsList {
	fmt.Println("Remove connection ", conn.ID)

	// theConn := c.cmap[conn.ID]
	// println("theConn = ", theConn)
	delete(c.cmap, conn.ID)

	// must remove the offending key from the keys array now
	for i := 0; i < len(c.keys); i++ {
		if c.keys[i] == conn.ID {
			c.keys = append(c.keys[:i], c.keys[i+1:]...) // NOTE - variadic tail, append takes varargs of type, not an array
		}
	}

	// c.BroadcastAdmin("Login", &shared.NetData{Action: "Drop", ID: conn.ID})

	// Remove any Rank 0 account that is tied to this channel
	// DB.SQL(`delete from users where rank=0 and channel=$1`, conn.ID).Exec()

	// Unlogin all users on that channel, but leave their last IP Address open
	DB.SQL(`update users set channel=0 where channel=$1`, conn.ID).Exec()
	DB.SQL(`update login set up='f' where channel=$1 and up`, conn.ID).Exec()

	// Get a list of games that they might be connected to
	if conn.UserID != 0 {
		ids := []int{}
		DB.SQL(`select game_id from game_players where player_id=$1`, conn.ID).QuerySlice(&ids)
		if len(ids) > 0 {
			DB.SQL(`update game_players set connected=false where player_id=$1`, conn.ID).Exec()
			for _, i := range ids {
				if play, ok := Plays[i]; ok {
					play <- PlayMessage{
						Game:     i,
						PlayerID: conn.UserID,
						OpCode:   PlayerDisconnected,
					}
					// println("Player", conn.Username, "has dropped out of game", i)
				}
			}
		}
	}
	return c
}

// Show all the active websocket connections
func (c *ConnectionsList) Show(header string) *ConnectionsList {
	fmt.Println("==================================")
	fmt.Println(header)
	for _, key := range c.keys {
		conn := c.cmap[key]
		req := conn.Socket.Request()
		theIP := ""
		if theIP = req.Header.Get("X-Real-Ip"); theIP == "" {
			theIP = req.RemoteAddr
		}
		idle := ""
		if conn.UserID == 0 {
			idle = "Idle "
		}
		// fmt.Printf("  %d:%s\t\t%s%s\n", conn.ID, theIP, idle, req.Header["User-Agent"])
		fmt.Printf("  %d:%s\t\t%s", conn.ID, theIP, idle)

		if conn.UserID != 0 {
			// fmt.Println("\t\t\t",
			fmt.Print(
				"\t", conn.Username, ":", conn.UserID,
				// "Route:", conn.Route,
				"\t:", time.Since(conn.Time))
		}
		fmt.Printf("\n")
	}
	fmt.Println("==================================")
	return c
}

func webSocket(ws *websocket.Conn) {

	// ws := c.Socket()
	ws.PayloadType = websocket.BinaryFrame

	conn := Connections.Add(ws)
	Connections.Show("Connections Grows To:")

	// Create a custom RPC server for this socket
	buf := bufio.NewWriter(ws)
	srv := &myServerCodec{
		rwc:    ws,
		conn:   conn,
		dec:    gob.NewDecoder(ws),
		enc:    gob.NewEncoder(buf),
		encBuf: buf,
	}
	rpc.ServeCodec(srv)
}

// gobbing RPC Codec with a Mutex to allow sharing of the line with other senders
type myServerCodec struct {
	rwc    io.ReadWriteCloser
	conn   *Connection
	mutex  *sync.Mutex
	dec    *gob.Decoder
	enc    *gob.Encoder
	encBuf *bufio.Writer
	closed bool
}

// On receiving a new header, lock the connection until the whole RPC call has finished
func (c *myServerCodec) ReadRequestHeader(r *rpc.Request) error {

	// fmt.Printf("doing custom RRH\n")
	// header := &shared.NetRequest{}
	// err := c.dec.Decode(header)
	err := c.dec.Decode(r)
	// fmt.Printf("decoded into %v\n", *header)
	if err != nil {
		log.Println("Dropped Connection:", err.Error(), ", connection:", c.conn.ID)
		Connections.Drop(c.conn)
		return err
	}
	// r.ServiceMethod = header.ServiceMethod
	// r.Seq = header.Seq
	c.conn.Mutex.Lock()
	return err
}

func (c *myServerCodec) ReadRequestBody(body interface{}) error {
	return c.dec.Decode(body)
}

// func (c *myServerCodec) WriteResponse(r *rpc.Response, body interface{}) (err error) {
func (c *myServerCodec) WriteResponse(r *rpc.Response, body interface{}) (err error) {
	// as soon as we are done, unlock the connection Mutex
	defer c.conn.Mutex.Unlock()

	header := &shared.NetResponse{
		ServiceMethod: r.ServiceMethod,
		Seq:           r.Seq,
		Error:         r.Error,
		Async:         false,
	}
	if err = c.enc.Encode(header); err != nil {
		if c.encBuf.Flush() == nil {
			// Gob couldn't encode the header. Should not happen, so if it does,
			// shut down the connection to signal that the connection is broken.
			log.Println("rpc: gob error encoding response:", err)
			c.Close()
		}
		return
	}
	// println("send the header out", header)
	// println("sending the body", body)
	if err = c.enc.Encode(body); err != nil {
		if c.encBuf.Flush() == nil {
			// Was a gob problem encoding the body but the header has been written.
			// Shut down the connection to signal that the connection is broken.
			log.Println("rpc: gob error encoding body:", err)
			c.Close()
		}
		return
	}
	return c.encBuf.Flush()
}

func (c *myServerCodec) Close() error {
	if c.closed {
		// Only call c.rwc.Close once; otherwise the semantics are undefined.
		return nil
	}
	c.closed = true
	return c.rwc.Close()
}

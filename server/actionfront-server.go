package main

import (
	"fmt"
	"log"
	"net/http"
	"os/exec"
	"time"

	"github.com/labstack/echo"
	"github.com/labstack/echo/engine/standard"
	mw "github.com/labstack/echo/middleware"
	_ "github.com/lib/pq"
	// "github.com/steveoc64/godev/config"
	"github.com/steveoc64/godev/db"
	"github.com/steveoc64/godev/echocors"
	// _ "github.com/steveoc64/godev/sms"
	// "github.com/steveoc64/godev/mail"
	"github.com/steveoc64/godev/smt"
	runner "gopkg.in/mgutz/dat.v1/sqlx-runner"

	// "github.com/facebookgo/grace/gracehttp"

	"golang.org/x/net/websocket"
)

var e *echo.Echo
var DB *runner.DB

// var MailChannel chan *gomail.Message

func main() {

	start := time.Now()

	initVCode()
	Config = LoadConfig()
	cpus := smt.Init()
	fmt.Printf("ActionFront Server running on %d CPU cores\n", cpus)

	// Start up the basic web server
	e = echo.New()
	e.SetDebug(true)
	e.Static("/", "public")

	// Setup static routes for the manual pages
	e.File("/manual", "public/manual/manual.html")
	e.File("/manual/scenario", "public/manual/scenario.html")
	e.File("/manual/host-game", "public/manual/host-game.html")
	e.File("/manual/host-game", "public/manual/host-game.html")

	// Start up the mail server
	if Config.MailServer == "" {
		println("Mail is turned OFF")
	} else {
		println("Mail server =", Config.MailServer)

		MailChannel = InitMailer(Config)
		m := NewMail()
		m.SetHeader("From", "ActionFront System <system@wargaming.io>")
		m.SetHeader("To", "steveoc64@gmail.com")
		m.SetHeader("Subject", "ActionFront Startup")
		m.SetBody("text/html", "ActionFront Dev Server Restart")
		// MailChannel <- m
	}

	if Config.Disqus {
		println("Disqus is ON")
	} else {
		println("Disqus is OFF")
	}

	e.SetHTTPErrorHandler(func(err error, context echo.Context) {
		httpError, ok := err.(*echo.HTTPError)
		if ok {
			// errorCode := httpError.Code()
			errorCode := httpError.Code
			switch errorCode {
			case http.StatusNotFound:
				// TODO handle not found case
				// log.Println("Not Found", err.Error())
				// We are usually here due to an F5 refresh, in which case
				// the URL is not expected to be there
				context.Redirect(http.StatusMovedPermanently, "/")
			default:
				// TODO handle any other case
			}
		}
	})

	e.Use(mw.Recover())
	e.Use(mw.Gzip())
	if Config.Debug {
		e.SetDebug(true)
	}
	echocors.Init(e, Config.Debug)

	// Do a database backup before we begin
	out, err := exec.Command("../scripts/backup.sh").Output()
	if err != nil {
		log.Println(err)
	} else {
		log.Println(string(out))
	}

	// Connect to the database
	DB = db.Init(Config.DataSourceName)

	// Clear all channel data in the database
	DB.SQL(`update users set channel=0`).Exec()
	DB.SQL(`update login set channel=0, up='f'`).Exec()

	// Add the all important Websocket handler
	Connections = new(ConnectionsList)
	registerRPC()

	e.Get("/ws", standard.WrapHandler(websocket.Handler(webSocket)))
	// e.Get("/ws", fasthttp.WrapHandler(websocket.Handler(webSocket)))

	e.SetDebug(true)
	// e.WebSocket("/ws", webSocket)

	// Start the web server
	if Config.Debug {
		log.Printf("... Starting Web Server on port %d", Config.WebPort)
	}

	cachePDFImage()
	std := standard.New(fmt.Sprintf(":%d", Config.WebPort))
	// std := standard.WithTLS(fmt.Sprintf(":%d", Config.WebPort), "actionfront.pem", "actionfront.key")
	// func WithTLS(addr, certFile, keyFile string) *Server

	// kick off a database backup every 24hrs
	go autoBackup()

	InitPaypal(Config, e)
	InitGames()

	logger(start, "System.Boot", nil, "", "")
	errRun := e.Run(std)
	println("ActionFront Server All Done", errRun.Error())

}

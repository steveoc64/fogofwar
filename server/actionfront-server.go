package main

import (
	"fmt"
	"log"
	"net/http"
	"os/exec"

	"github.com/labstack/echo"
	"github.com/labstack/echo/engine/standard"
	mw "github.com/labstack/echo/middleware"
	_ "github.com/lib/pq"
	// "github.com/steveoc64/godev/config"
	"github.com/steveoc64/godev/db"
	"github.com/steveoc64/godev/echocors"
	// _ "github.com/steveoc64/godev/sms"
	"github.com/steveoc64/godev/mail"
	"github.com/steveoc64/godev/smt"
	runner "gopkg.in/mgutz/dat.v1/sqlx-runner"

	gomail "gopkg.in/gomail.v2"

	// "github.com/facebookgo/grace/gracehttp"
	"golang.org/x/net/websocket"
)

var e *echo.Echo
var DB *runner.DB

var MailChannel chan *gomail.Message

func main() {

	Config = LoadConfig()
	cpus := smt.Init()
	fmt.Printf("ActionFront Server running on %d CPU cores\n", cpus)

	// Start up the basic web server
	e = echo.New()
	e.SetDebug(true)
	e.Static("/", "public")

	// Start up the mail server
	if Config.MailServer == "" {
		println("Mail is turned OFF")
	} else {
		println("Mail server =", Config.MailServer)

		MailChannel = mail.InitMailer()
		m := mail.NewMail()
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
	out, err := exec.Command("../scripts/cmms-backup.sh").Output()
	if err != nil {
		log.Println(err)
	} else {
		log.Println(string(out))
	}

	// Connect to the database
	DB = db.Init(Config.DataSourceName)

	// Clear all channel data in the database
	DB.SQL(`update users set channel=0`).Exec()

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
	errRun := e.Run(std)
	println("done", errRun.Error())

	// std.SetHandler(e)
	// gracehttp.Serve(std.Server)

}

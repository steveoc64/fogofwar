package main

import (
	"errors"
	"fmt"
	"os"
	"strconv"
	"time"

	"../shared"
	"github.com/labstack/echo"
	_ "github.com/lib/pq"
	paypalsdk "github.com/logpacker/PayPal-Go-SDK"
)

var PaypalLog *os.File
var PaypalClient *paypalsdk.Client

type PaypalRPC struct{}

// var PaypalChannel = make(chan *PaypalTrans, 64)

func ppgood(c echo.Context) error {
	fmt.Fprintf(PaypalLog, "------------------------------\n%s\n", "Paypal Payer Auth")
	// /ppgood?paymentId=PAY-7873106948388592NLAIH3QQ&token=EC-9CT45881F61289818&PayerID=ZUN5TQSFBBM46 HTTP/1.1" 200 35 "https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=EC-9CT45881F61289818"

	id := c.QueryParam("paymentId")
	token := c.QueryParam("token")
	payerID := c.QueryParam("PayerID")
	fmt.Fprintf(PaypalLog, "PaymentID %s\nToken %s\nPayerID %s\n", id, token, payerID)
	fmt.Printf("PaymentID %s\nToken %s\nPayerID %s\n", id, token, payerID)

	// And the last step is to execute approved payment
	executeResult, err := PaypalClient.ExecuteApprovedPayment(id, payerID)
	if err == nil {
		fmt.Fprintf(PaypalLog, "------------------------------\n%s\n%v\n", "Exec Payment Result", executeResult)
		return c.File("public/promotion.html")
	} else {
		fmt.Fprintf(PaypalLog, "------------------------------\n%s\n%v\n", "Exec Payment Result", executeResult)
		fmt.Fprintf(PaypalLog, "ERROR:", err.Error())
		return c.File("public/promotion-fail.html")
	}
}

func ppbad(c echo.Context) error {
	fmt.Fprintf(PaypalLog, "------------------------------\n%s\n", "Cancel Payment")
	return c.File("public/promotion-cancel.html")
	// return c.String(http.StatusOK, "Very sorry, but something went wrong at the PayPal end with that transaction ... reload and try again")
}

func InitPaypal(c ConfigType, e *echo.Echo) error {

	if c.PaypalAPI == "" {
		println("Paypal disabled in this session")
		return nil
	}

	err := error(nil)

	PaypalLog, err = os.OpenFile("../paypal/paypal.log", os.O_RDWR|os.O_APPEND, os.FileMode(0666))
	if err != nil {
		fmt.Fprintf(PaypalLog, "ERROR: %s\n", err.Error())
		println(err.Error())
		return err
	}

	fmt.Fprintf(PaypalLog, "------------------------------\n%s\n", "Init Paypal")

	// Backend hooks to get authorization calls from Paypal
	e.Get("/ppgood", ppgood)
	e.Get("/ppbad", ppbad)
	e.File("/promotion", "public/promotion.html")

	println("start paypal on", Config.PaypalAPI)
	fmt.Fprintf(PaypalLog, "Using API %s\n", Config.PaypalAPI)

	// actionfront-test
	// clientID := "AX3Vgalci6rBVtX8T4FjtHup5OhTajVSczmH8G0nJr3v8vxoQusA1lxDzhnddYjHBclom61vUucmEbZT"
	// secret := "EGtqUYvZh4A85FF0pC_Rl82yJg7xVb6_115k0dDrEaGSayJHgLfw1U7vzKZxw49PeRXWbqGebVaFsi45"

	PaypalClient, err = paypalsdk.NewClient(
		Config.PaypalClientID,
		Config.PaypalSecret,
		Config.PaypalAPI)

	if err != nil {
		println(err.Error())
		return err
	}
	PaypalClient.SetLog(PaypalLog) // Set log to terminal stdout

	accessToken, err := PaypalClient.GetAccessToken()
	fmt.Fprintf(PaypalLog, "AccessToken is %v\n", accessToken)
	if err != nil {
		println(err.Error())
		return err
	}

	return nil
}

func (p *PaypalRPC) CreatePayment(data shared.PaypalRPCData, url *string) error {
	fmt.Fprintf(PaypalLog, "------------------------------\n%s\n", "Direct Payment")

	start := time.Now()

	conn := Connections.Get(data.Channel)

	value := "5.90"
	switch data.Rank {
	case 1:
		return errors.New("Free Account - dont need to pay")
	case 2:
		value = "5.90"
	case 3:
		value = "9.90"
	case 4:
		value = "24.90"
	}

	// vstring := fmt.Sprintf("%0.2f", float64(data.Value)/100.0)
	// fmt.Fprintf(PaypalLog, "Value from %d to %s\n", value, vstring)

	amount := paypalsdk.Amount{
		Total:    value,
		Currency: "USD",
	}

	theAmount, err := strconv.ParseFloat(value, 64)
	if err != nil {
		println("OOPS - cant convert", value, "to float ???", err.Error())
	}

	// redirectURI := "https://wargaming.io/ppgood"
	// cancelURI := "https://wargaming.io/ppbad"
	// redirectURI := "http://localhost:8844/ppgood"
	// cancelURI := "http://localhost:8844/ppbad"
	fmt.Printf("config %v\n", Config)
	paymentResult, err := PaypalClient.CreateDirectPaypalPayment(
		amount,
		Config.PaypalRedirectURI,
		Config.PaypalCancelURI,
		data.Descr)

	if err != nil {
		fmt.Fprintf(PaypalLog, "ERROR: %s\n", err.Error())
		fmt.Printf("ERROR: %s\n", err.Error())
	} else {
		fmt.Printf("SUCCESS: ID %s\nLink to : %s\n%s\n",
			paymentResult.ID,
			paymentResult.Links[1].Rel,
			paymentResult.Links[1].Href)
		fmt.Fprintf(PaypalLog, "SUCCESS: ID %s\nLink to : %s\n%s\n",
			paymentResult.ID,
			paymentResult.Links[1].Rel,
			paymentResult.Links[1].Href)
		*url = paymentResult.Links[1].Href

		// Save it into the database
		newID := 0
		interval := fmt.Sprintf("%d months", data.Months)

		err = DB.SQL(`insert into paypal
			(payment_id,amount,user_id,channel,descr,rank,months,end_date)
			values
			($1,$2,$3,$4,$5,$6,$7,current_date + interval $8)
			returning id`,
			paymentResult.ID,
			theAmount,
			conn.UserID,
			data.Channel,
			data.Descr,
			data.Rank,
			data.Months,
			interval).QueryScalar(&newID)
	}

	logger(start, "Paypal.CreatePayment", conn,
		fmt.Sprintf("%s Rank %d USD %s", data.Descr, data.Rank, value),
		fmt.Sprintf("Redirect to %s", *url))

	return err
}

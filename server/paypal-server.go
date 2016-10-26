package main

import (
	"fmt"
	"net/http"
	"os"

	_ "github.com/lib/pq"
	// "github.com/steveoc64/godev/config"

	// _ "github.com/steveoc64/godev/sms"
	// "github.com/steveoc64/godev/mail"

	"github.com/labstack/echo"
	// "github.com/facebookgo/grace/gracehttp"
	paypalsdk "github.com/logpacker/PayPal-Go-SDK"
)

var PaypalLog *os.File
var PaypalClient *paypalsdk.Client

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
		return c.String(http.StatusOK, "Thanks, that seemed to work, you are now promoted")
	} else {
		return c.String(http.StatusOK, "Thanks for authorizing the payment, but something else when wrong ... no promotion for you")
	}
}

func ppbad(c echo.Context) error {
	return c.String(http.StatusOK, "Allrighty, that didnt seem to work")
}

func initPaypal(e *echo.Echo) {

	e.Get("/ppgood", ppgood)
	e.Get("/ppbad", ppbad)

	println("start paypal on", paypalsdk.APIBaseSandBox)
	// signature := "AFcWxV21C7fd0v3bYYYRCpSSRl31AqlCascQRSNTHZUg6EPMCm0.AmVB"
	// passwd := "84RAA33ZG6HQQJAV"
	// username := "steveoc64-facilitator_api1.gmail.com"

	// actionfront
	err := error(nil)
	clientID := "AX3Vgalci6rBVtX8T4FjtHup5OhTajVSczmH8G0nJr3v8vxoQusA1lxDzhnddYjHBclom61vUucmEbZT"
	secret := "EGtqUYvZh4A85FF0pC_Rl82yJg7xVb6_115k0dDrEaGSayJHgLfw1U7vzKZxw49PeRXWbqGebVaFsi45"
	PaypalClient, err = paypalsdk.NewClient(clientID, secret, paypalsdk.APIBaseSandBox)

	println("got paypal connection", PaypalClient)
	// PaypalLog, pperr := os.OpenFile("../paypal/paypal.log", os.O_RDWR|os.O_APPEND, os.FileMode(0666))
	PaypalLog, err = os.Create("../paypal/paypal.log")
	if err != nil {
		print(err.Error())
	}
	PaypalClient.SetLog(PaypalLog) // Set log to terminal stdout
	fmt.Fprintf(PaypalLog, "Getting access token for %v\n", PaypalClient)
	accessToken, err := PaypalClient.GetAccessToken()
	fmt.Fprintf(PaypalLog, "accesstoken is %v\n", accessToken)
	if err != nil {
		println(err.Error())
	}

	// payment, err := c.GetPayment("PAY-TEST-123")
	// fmt.Fprintln(PaypalLog, "DEBUG: PaymentID="+payment.ID)

	fmt.Fprintf(PaypalLog, "------------------------------\n%s\n", "Payments List")
	payments, err := PaypalClient.GetPayments()
	if err == nil {
		fmt.Fprintf(PaypalLog, "DEBUG: PaymentsCount=%d\n", len(payments))
	} else {
		fmt.Fprintln(PaypalLog, "ERROR: "+err.Error())
	}

}

func PaypalPayment(value int, descr string) {

	go func() {
		fmt.Fprintf(PaypalLog, "------------------------------\n%s\n", "Direct Payment")

		vstring := fmt.Sprintf("%0.2f", float64(value/100))
		fmt.Fprintf(PaypalLog, "Value from %d to %s\n", value, vstring)

		amount := paypalsdk.Amount{
			Total:    vstring,
			Currency: "USD",
		}

		redirectURI := "https://wargaming.io/ppgood"
		cancelURI := "https://wargaming.io/ppbad"
		paymentResult, err := PaypalClient.CreateDirectPaypalPayment(amount, redirectURI, cancelURI, descr)
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
		}

	}()

}

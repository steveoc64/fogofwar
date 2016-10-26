package shared

import "time"

type Paypal struct {
	ID        int        `db:"id"`
	PaymentID string     `db:"payment_id"`
	PayerID   string     `db:"payer_id"`
	Token     string     `db:"token"`
	Amount    int        `db:"amount"`
	Created   *time.Time `db:"created"`
	UserID    int        `db:"user_id"`
	Channel   int        `db:"channel"`
	SaleID    string     `db:"sale_id"`
	Approved  bool       `db:"approved"`
	Descr     string     `db:"descr"`
	Rank      int        `db:"rank"`
	Months    int        `db:"months"`
	EndDate   *time.Time `db:"end_date"`
}

type PaypalRPCData struct {
	Channel int
	Descr   string
	Rank    int
	Months  int
}

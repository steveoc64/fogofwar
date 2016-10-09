package main

import (
	"fmt"
	"time"

	"../shared"
)

type CampaignRPC struct{}

func (c *CampaignRPC) List(channel int, campaigns *[]shared.Campaign) error {
	start := time.Now()

	conn := Connections.Get(channel)

	DB.SQL(`select c.id,c.name,c.author_id,a.username as author_name,c.year,c.descr
		from campaign c 
			left join users a on a.id=c.author_id
		where author_id = $1
			and public
		order by year`, conn.UserID).
		QueryStructs(campaigns)

	logger(start, "Campaign.List", channel, conn.UserID, conn.Username,
		"",
		fmt.Sprintf("%d Campaigns", len(*campaigns)))

	return nil
}

func (c *CampaignRPC) ListPublic(channel int, campaigns *[]shared.Campaign) error {
	start := time.Now()

	conn := Connections.Get(channel)

	DB.SQL(`select c.id,c.name,c.author_id,a.username as author_name,c.year,c.descr
		from campaign c 
			left join users a on a.id=c.author_id
		where author_id != $1
			and public
		order by year`, conn.UserID).
		QueryStructs(campaigns)

	logger(start, "Campaign.ListPublic", channel, conn.UserID, conn.Username,
		"",
		fmt.Sprintf("%d Campaigns", len(*campaigns)))

	return nil
}

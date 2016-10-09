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

func (c *CampaignRPC) Get(data shared.CampaignRPCData, retval *shared.Campaign) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	DB.SQL(`select * from campaign where id=$1`, data.ID).QueryStruct(retval)

	logger(start, "Campaign.Get", data.Channel, conn.UserID, conn.Username,
		fmt.Sprintf("%d", data.ID),
		fmt.Sprintf("%v", *retval))

	return nil
}

func (c *CampaignRPC) Update(data shared.CampaignRPCData, retval *shared.Campaign) error {
	start := time.Now()

	conn := Connections.Get(data.Channel)

	_, err := DB.Update("campaign").
		SetWhitelist(data.Campaign, "name", "year", "public", "descr", "notes").
		Where("id = $1 and author_id=$2", data.ID, conn.UserID).
		Exec()

	DB.Select("name", "year", "public", "descr", "notes").
		From("campaign").
		Where("id=$1", data.ID).
		Limit(1).
		QueryStruct(retval)

	logger(start, "Campaign.Update", data.Channel, conn.UserID, conn.Username,
		fmt.Sprintf("%d", data.ID),
		fmt.Sprintf("%v", *retval))

	return err
}

#!/bin/bash
date=`date "+%Y%m%d-%H%M%S"`
file="actionfront-$date"
echo $file
pg_dump actionfront | gzip > ../backup/$file.sqz
cd ../backup
echo Latest Backup File
ls -l $file.sqz
echo
# echo All Backups
# ls -s
# echo 
# echo Files older than 14 days
# find . -mtime +14


#!/bin/bash
cd /var/log
NOW=$(date -d "Today" +%Y%m%d)
NOW7=$(date -d "Last-Week" +%Y%m%d)
sleep 7
cp svxlink.log svxlink.$NOW.txt
truncate -s0 svxlink.log
rm svxlink.$NOW7.txt



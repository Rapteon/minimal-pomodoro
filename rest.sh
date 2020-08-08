#!/usr/bin/env bash

fourSessions=$(expr $1 % 4)
if [ $fourSessions -ne 0 ]
then
#	notify-send --expire-time=300000 "Take a 5 minute break."
#	sleep 5m
	notify-send --expire-time=10000 "Take a 5 minute break."
	sleep 10s
else
#	notify-send --expire-time=900000 "Take a 15 minute break."
#	sleep 15m
	notify-send --expire-time=10000 "Take a 15 minute break."
	sleep 10s
fi

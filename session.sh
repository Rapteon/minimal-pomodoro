#!/usr/bin/env bash

maxSessions=$1
sessionCount=1

while [ $sessionCount -le $maxSessions ]
do
	notify-send "Session $sessionCount" "Will finish in 25min."
#	notify-send --expire-time=1500000 "Pomodoro timer started."
	notify-send --expire-time=10000 "Pomodoro timer started."
	sleep 10s
#	sleep 25m
	sessionCount=$(($sessionCount + 1))
	./rest.sh $sessionCount
	if [ $sessionCount -eq $maxSessions ]
	then
		notify-send "Next Session" "..in 15 seconds"
		sleep 15s
	fi
done
notify-send "Yay! Finished all sessions."

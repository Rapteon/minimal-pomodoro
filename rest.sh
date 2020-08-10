#Copyright <2020> <Suraj Naranatt>

#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
#associated documentation files (the "Software"), to deal in the Software without restriction,
#including without limitation the rights to use, copy, modify, merge, publish, distribute,
#sublicense, and/or sell copies of the Software, and to permit persons to whom the Software
#is furnished to do so, subject to the following conditions:

#The above copyright notice and this permission notice shall be included in all copies or
#substantial portions of the Software.

#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT
#NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
#IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
#WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
#SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#!/usr/bin/env bash

# Note: the '--expire-time' flag doesn't work on distros such as Ubuntu.

# 'fourSessions' is a variable which is set to 0 only when the 'sessionCount' variable in 'pomodoro' script is a multiple of 4.
# 'fourSessions' is otherwise set any integer other than 4 and 0.
# It is used to determine the time for which the break must last.
fourSessions=$(expr $1 % 4)

# The following conditional checks if the number of sessions 'sessionCount' is equal to the 'maxSessions'.
# $1 is the 'sessionCount' variable and $2 is the maxSessions variable.
# When the two variables are equal, it means that all sessions are over, so no more breaks are required to be timed.
if [ $2 -ne $1 ]
then
	# The following conditional checks if the 'sessionCount' variable is a multiple of 4.
	# If this is true (in the pomodoro technique), that corresponds to the completion of a set of 4 sessions.
	if [ $fourSessions -eq 0 ]
	then
		notify-send --expire-time=900000 "Take a 15 minute break."
		sleep 15m
		# Uncomment the following two lines and comment the above two lines for testing purposes.
		#notify-send --expire-time=15000 'Take a 15 second break.' 
		#sleep 15s
	else
		notify-send --expire-time=300000 "Take a 5 minute break."
		sleep 5m
		# Uncomment the following two lines and comment the above two lines for testing purposes.
		#notify-send --expire-time=5000 "Take a 5 second break."
		#sleep 5s
	fi
fi

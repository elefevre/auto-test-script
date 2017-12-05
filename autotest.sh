#!/bin/bash

TEST_COMMAND="$@"

SYSTEM_NAME=`uname`
if [ $SYSTEM_NAME == "Darwin" ]; then
	FILEDATE_COMMAND='stat -f "%m" {}'
fi
if [ $SYSTEM_NAME != "Darwin" ]; then
	FILEDATE_COMMAND='stat -c "%Y-%n" {}'
fi

SPINNER=1

previousModifiedTime="0"
while true; do
	fileModifiedTime=`find . -mtime -10 -type f -exec $FILEDATE_COMMAND \; | sort | tail -1`
	if [ "$fileModifiedTime" == "" ]; then
		# no file more recent than 10 days
		fileModifiedTime=$previousModifiedTime
	fi
	if [ $previousModifiedTime == $fileModifiedTime ]; then
		echo -e "\r\c"
		SPINNER=$((SPINNER+1))
		if [ $SPINNER == 1 ]; then
			echo -e "|\c"
		fi
		if [ $SPINNER == 2 ]; then
			echo -e "/\c"
		fi
		if [ $SPINNER == 3 ]; then
			echo -e "-\c"
		fi
		if [ $SPINNER == 4 ]; then
			echo -e "\\\\\c"
			SPINNER=0
		fi

	fi
	if [ $previousModifiedTime != $fileModifiedTime ]; then
		previousModifiedTime=$fileModifiedTime
		echo -e "\n\nChanged file: $fileModifiedTime"
		echo -e "************************* new test run below **********************************"
		clear
		echo -e "\"$TEST_COMMAND\" started at \c" && date
		START_TIME=$SECONDS
		$TEST_COMMAND
		ELAPSED=$(($SECONDS-$START_TIME))
		echo -e "\"$TEST_COMMAND\" completed in $(($ELAPSED/60))m $(($ELAPSED%60))s at \c" && date
	fi
	sleep 0.2
done
#!/bin/bash

TEST_COMMAND="cake midje"
previousModifiedTime="0"

while true; do
	mostRecentlyChangedFile=`find . -not -type d -print  | sort -n | tail -1`
	fileModifiedTime=`stat -f "%m" $mostRecentlyChangedFile`
	if [ $previousModifiedTime != $fileModifiedTime ]; then
		previousModifiedTime=$fileModifiedTime
		clear
		date
		$TEST_COMMAND 2>&1 | tail -1000		# replace with your own test command if needed
	fi
	if [ $previousModifiedTime == $fileModifiedTime ]; then
		echo -e "|\c"
	fi
	sleep 1
done
#!/bin/bash

TEST_COMMAND="$@"
previousModifiedTime="0"

while true; do
	mostRecentlyChangedFile=`find . -mtime -2 -type f -exec ls -l {} \; | sort -k6 | tail -1 | awk '{print $9}'`
	fileModifiedTime=`stat -f "%m" $mostRecentlyChangedFile`
	if [ $previousModifiedTime != $fileModifiedTime ]; then
		previousModifiedTime=$fileModifiedTime
		clear
		echo -e "Last run on \c"
		date
		$TEST_COMMAND 2>&1 | tail -1000		# replace with your own test command if needed
	fi
	if [ $previousModifiedTime == $fileModifiedTime ]; then
		echo -e "|\c"
	fi
	sleep 1
done
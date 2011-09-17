#!/bin/bash

TEST_COMMAND="$@"

SYSTEM_NAME=`uname`
if [ $SYSTEM_NAME == "Darwin" ]; then
	FILEDATE_COMMAND='stat -f "%m" {}'
fi
if [ $SYSTEM_NAME != "Darwin" ]; then
	FILEDATE_COMMAND='stat -c "%Y" {}'
fi

previousModifiedTime="0"
while true; do
	fileModifiedTime=`find . -mtime -1 -type f -exec $FILEDATE_COMMAND \; | sort | tail -1`
	if [ $previousModifiedTime == $fileModifiedTime ]; then
		echo -e "|\c"
	fi
	if [ $previousModifiedTime != $fileModifiedTime ]; then
		previousModifiedTime=$fileModifiedTime
		clear
		echo -e "Last run on \c"
		date
		$TEST_COMMAND 2>&1 | tail -1000
	fi
	sleep 1
done
#!/bin/bash
LAST_PID=`cat last_pid.txt`
kill -9 $LAST_PID
nohup java -jar $1 $2 &> log.txt &
echo $! > last_pid.txt

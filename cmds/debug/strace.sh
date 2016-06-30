#!/bin/bash

smbds=$(ps -ef | grep smbd | grep -v grep | awk '{print $2}')
echo $smbds
secs=$1
cnt=0
while [ $cnt -lt $secs ]
do
	echo $cnt
	let cnt=cnt+1
	sleep 1
done

#!/bin/bash


case $1 in
	'restart')
		echo -e "service stop ad -z A@0\nexit\n" | python /usr/local/NAS/misc/Cmd/NASCmd.py
		echo -e "service start ad -z A@0\nexit\n" | python /usr/local/NAS/misc/Cmd/NASCmd.py
		;;
	*)
		echo "no parameter"
esac

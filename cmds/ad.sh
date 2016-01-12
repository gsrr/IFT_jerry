#!/bin/bash



function link_test(){
		link=`readlink /etc/pam.d/system-auth`
		echo -n $link
		if [ "$link" == "/etc/pam.d/system-auth-winbind" ]
		then
			echo ":OK"
		else
			echo ":Fail"
		fi
	
		link=`readlink /etc/pam.d/password-auth`
		echo -n $link
		if [ "$link" == "/etc/pam.d/password-auth-winbind" ]
		then
			echo ":OK"
		else
			echo ":Fail"
		fi
}

case $1 in
	'restart')
		echo -e "service stop ad -z A@0\nexit\n" | python /usr/local/NAS/misc/Cmd/NASCmd.py
		echo -e "service start ad -z A@0\nexit\n" | python /usr/local/NAS/misc/Cmd/NASCmd.py
		;;
	'test')
		link_test
		;;
	*)
		echo "no parameter"
esac

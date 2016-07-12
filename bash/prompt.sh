#!/bin/bash

function show_jobs1() {
        echo $(jobs -l | grep "\[1\]" | awk '{print $1 " "$4 " "$5}') 
}
function show_jobs2() {
        echo $(jobs -l | grep "\[2\]" | awk '{print $1 " "$4 " "$5}') 
}
function show_jobs3() {
        echo $(jobs -l | grep "\[3\]" | awk '{print $1 " "$4 " "$5}') 
}

function prompt_command {
	let prompt_x=$COLUMNS-24
}

PROMPT_COMMAND=prompt_command

function prompt_clock {
local       BLUE="\[\033[0;34m\]"
local        RED="\[\033[0;31m\]"
local  LIGHT_RED="\[\033[1;31m\]"
local      WHITE="\[\033[1;37m\]"
local      YELLOW="\[\033[1;33m\]"
local  NO_COLOUR="\[\033[0m\]"
case $TERM in
	xterm*)
		TITLEBAR='\[\033]0;\u@\h:\w\007\]'
		;;
	*)
		TITLEBAR=""
		;;
esac

PS1="${TITLEBAR}\
\[\033[s\
\[\033[1;\$(echo -n \${prompt_x})H\]$YELLOW"Jobs:"\$(show_jobs1)\
\[\033[2;\$(echo -n \${prompt_x})H\]$YELLOW"Jobs:"\$(show_jobs2)\
\[\033[3;\$(echo -n \${prompt_x})H\]$YELLOW"Jobs:"\$(show_jobs3)\
\[\033[u\033[1A\]
$YELLOW[$WHITE\u@\h:\w$YELLOW]\
$WHITE\$$NO_COLOUR "
PS2='> '
PS4='+ '
}

function prompt_recover {
PS1="[\u@\h:\w]\$ "
}

#ref : http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x361.html

#!/bin/bash

function show_jobs() {
        echo $(jobs -l ) 
}

function prompt_command {
	let prompt_x=$COLUMNS-36
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
\[\033[s\033[1;\$(echo -n \${prompt_x})H\]\
$YELLOW"Jobs:"\$(show_jobs)\
\[\033[u\033[1A\]
$BLUE[$LIGHT_RED\u@\h:\w$BLUE]\
$WHITE\$$NO_COLOUR "
PS2='> '
PS4='+ '
}

function prompt_recover {
PS1="[\u@\h:\w]\$ "
}

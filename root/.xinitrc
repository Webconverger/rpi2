#!/bin/bash

print_mem(){
	memfree=$(($(grep -m1 'MemAvailable:' /proc/meminfo | awk '{print $2}') / 1024))
	echo -e "$memfree"
}


while true
do
. /etc/webc/webc.conf
	xsetroot -name "$(print_mem) $webc_id $webc_version"
	sleep 5
done &

. /etc/webc/webc.conf

cmdline | grep -qs showcursor || exec /usr/bin/unclutter &

if cmdline_has debug
then 
	exec dwm
else
	exec dwm.web
fi

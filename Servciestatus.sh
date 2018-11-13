#!/bin/bash
###Edit the servcie name below as required when checking on multiple server
SERVICE=multipathd
if P=$(pgrep $SERVICE)
then
    echo "$SERVICE is running, PID is $P"
else
    echo "$SERVICE is not running"

echo " $Service Starting "

/etc/init.d/$SERVICE start

sleep 1

echo " $Service Is Running "

fi

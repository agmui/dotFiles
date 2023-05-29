#!/bin/bash
BAT=`cat /sys/class/power_supply/BAT0/capacity`
STAT=`cat /sys/class/power_supply/BAT0/status`
echo $BAT # $STAT
#!/bin/bash

## Shutdown
shutdown() {
    systemctl poweroff
}

## Reboot
reboot() {
    systemctl reboot
}

## Lock Screen
lock() {
    loginctl lock-session
}

## Suspend
suspend() {
    systemctl suspend
}

## Logout
logout() {
    #loginctl terminate-session ${XDG_SESSION_ID-}
    i3-msg exit
}

if [[ "$1" == "--shutdown" ]]; then
    shutdown
elif [[ "$1" == "--reboot" ]]; then
    reboot
elif [[ "$1" == "--lock" ]]; then
    lock
elif [[ "$1" == "--suspend" ]]; then
    suspend
elif [[ "$1" == "--logout" ]]; then
    logout
fi

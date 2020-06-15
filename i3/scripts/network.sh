#!/usr/bin/env bash

count=0
disconnected="󰖪"
connected="󰖩"

ID="$(ip link | awk '/state UP/ {print $2}')"

if (ping -c 1 archlinux.org || ping -c 1 google.com || ping -c 1 bitbucket.org || ping -c 1 github.com || ping -c 1 sourceforge.net) &>/dev/null; then
    echo "$connected"
else
    echo "$disconnected"
fi


#!/usr/bin/env bash

# Connected & disconnected icons
disconnected=""
connected=""

# Check if bytes are received from various websites. If yes then the internet is connected, if not then its disconnected
if (ping -c 1 archlinux.org || ping -c 1 google.com || ping -c 1 bitbucket.org || ping -c 1 github.com || ping -c 1 sourceforge.net) &>/dev/null; then
    echo "$connected"
else
    echo "$disconnected"
fi


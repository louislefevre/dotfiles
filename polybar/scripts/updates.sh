#!/usr/bin/env bash

BAR_ICON="󰏔"
get_total_updates() { UPDATES=$(checkupdates 2>/dev/null | wc -l); }

while true; do
    get_total_updates
    echo "$BAR_ICON$UPDATES"
    sleep 300
done

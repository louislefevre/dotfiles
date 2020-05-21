#!/usr/bin/env bash

BAR_ICON=""
get_total_updates() { UPDATES=$(checkupdates 2>/dev/null | wc -l); }

while true; do
    get_total_updates

    while (( UPDATES > 0 )); do
        echo "$BAR_ICON$UPDATES"
        sleep 10
        get_total_updates
    done

    while (( UPDATES == 0 )); do
        echo $BAR_ICON
        sleep 1800
        get_total_updates
    done
done


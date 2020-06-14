#!/usr/bin/env bash

sanitize() {
    local str="$1"
    local length=${#str}

    if (( $length > 60 )); then
        echo "$(echo ${str:0:60} | xargs)..."
    else
        echo "$(echo $str | xargs)"
    fi
}

player_name=$(playerctl metadata --format '{{ playerName }}' 2>/dev/null)

if [ "$player_name" = "spotify" ]; then
    player_info="$(playerctl metadata artist) - $(playerctl metadata title)"
    player_status=$(playerctl status 2>/dev/null)
    player_info="$(sanitize "$player_info")"

    if [ "$player_status" = "Playing" ]; then
        echo "󰐍 $player_info"
    elif [ "$player_status" = "Paused" ]; then
        echo "󰏦 $player_info"
    else
         echo ""
    fi
else
    echo ""
fi

#!/usr/bin/env bash

# Options
shutdown="⏻"
reboot="⭯"
suspend="⏾"
logout="➔"

options="$shutdown\n$reboot\n$suspend\n$logout"
rofi_command="rofi -theme $HOME/.config/rofi/powermenu"
chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0)"

case $chosen in
    $shutdown) systemctl poweroff ;;
    $reboot) systemctl reboot ;;
    $suspend) systemctl suspend ;;
    $logout) i3-msg exit ;;
esac

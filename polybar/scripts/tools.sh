#!/bin/bash

BORDER="#1F1F1F"
SEPARATOR="#1F1F1F"
FOREGROUND="#FFFFFF"
BACKGROUND="#1F1F1F"
BACKGROUND_ALT="#252525"
HIGHLIGHT_BACKGROUND="#e53935"
HIGHLIGHT_FOREGROUND="#1F1F1F"
YELLOW="#fdd835"
MAGENTA="#00897b"

# Launch Rofi
MENU="$(rofi -no-lazy-grab -sep "|" -dmenu -i -p 'Tools :' \
-hide-scrollbar true \
-bw 0 \
-lines 4 \
-line-padding 10 \
-padding 20 \
-width 15 \
-xoffset 0 -yoffset 0 \
-location 0 \
-columns 1 \
-font "Fantasque Sans Mono 10" \
-color-enabled true \
-color-window "$BACKGROUND,$BORDER,$SEPARATOR" \
-color-normal "$BACKGROUND_ALT,$FOREGROUND,$BACKGROUND_ALT,$HIGHLIGHT_BACKGROUND,$HIGHLIGHT_FOREGROUND" \
-color-active "$BACKGROUND,$MAGENTA,$BACKGROUND_ALT,$HIGHLIGHT_BACKGROUND,$HIGHLIGHT_FOREGROUND" \
-color-urgent "$BACKGROUND,$YELLOW,$BACKGROUND_ALT,$HIGHLIGHT_BACKGROUND,$HIGHLIGHT_FOREGROUND" \
<<< "󰍹  Monitor Mode|󰟴  TV Mode")"
case "$MENU" in
  *"Monitor Mode") xrandr --output HDMI-0 --off && pactl set-card-profile 0 output:hdmi-stereo ;;
  *"TV Mode") xrandr --output HDMI-0 --auto --same-as DP-0 && pactl set-card-profile 0 output:hdmi-stereo-extra1 ;;
esac

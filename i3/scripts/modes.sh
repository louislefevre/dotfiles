#!/usr/bin/env bash

# List the currently active monitors, and search it to see if the TV (HDMI-0) is present
active=$(xrandr --listactivemonitors | grep "HDMI-0" 2> /dev/null)

# If the active list is empty...
if [ -z "$active" ]; then
    # The TV is not active, enable it and switch the GPUs audio output profile to the TVs
    xrandr --output HDMI-0 --auto --same-as DP-0 && pactl set-card-profile 0 output:hdmi-stereo-extra1
else 
    # The TV is active, disable it and switch the GPUs audio output profile back to default
    xrandr --output HDMI-0 --off && pactl set-card-profile 0 output:hdmi-stereo
fi


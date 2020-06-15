active=$(xrandr --listactivemonitors | grep "HDMI-0" 2> /dev/null)

if [ -z "$active" ]; then
    # Enable TV, switch audio device output
    xrandr --output HDMI-0 --auto --same-as DP-0 && pactl set-card-profile 0 output:hdmi-stereo-extra1
else 
    # Disable TV, reset audio device output back to default
    xrandr --output HDMI-0 --off && pactl set-card-profile 0 output:hdmi-stereo
fi


#!/bin/sh

compton &
xfce4-power-manager &
sxhkd -c /home/taz/.config/sowm/sxhkdrc &
feh --bg-fill /home/taz/Pictures/wallpapers/VGFwZXMK.jpg &
python -m SimpleHTTPServer 8085 &
#bash ~/.config/lemonbar/config.sh | bash ~/.config/lemonbar/lemonbar.sh &

exec sowm

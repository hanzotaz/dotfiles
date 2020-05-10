#!/bin/sh

compton &
xfce4-power-manager &
mpd &
sxhkd -c /home/taz/.config/sowm/sxhkdrc &
feh --bg-fill /home/taz/Pictures/wallpapers/50476.jpg &
#python -m SimpleHTTPServer 8085 &
bash ~/.config/lemonbar/lemonbar.sh &

xautolock -time 10 -locker "slock" &
dunst &

exec sowm

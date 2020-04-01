#!/bin/sh

picom &
xfce4-power-manager &
mpd &
sxhkd -c /home/taz/.config/sowm/sxhkdrc &
feh --bg-fill /home/taz/Pictures/wallpapers/59FwBTe.jpg &
#python -m SimpleHTTPServer 8085 &
bash ~/.config/lemonbar/config.sh | bash ~/.config/lemonbar/lemonbar.sh &

xautolock -time 10 -locker "slock" &
dunst &

exec sowm

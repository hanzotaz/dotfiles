#!/bin/sh

picom &
xfce4-power-manager &
mpd &
sxhkd -c /home/taz/.config/sowm/sxhkdrc &
feh --bg-fill /home/taz/Pictures/wallpapers/59FwBTe.jpg &
#python -m SimpleHTTPServer 8085 &
bash ~/.config/lemonbar/config.sh | bash ~/.config/lemonbar/lemonbar.sh &

mpd-notification -H 127.0.0.1 -p 6600 -t 30 -m /home/taz/Music &
xautolock -time 10 -locker "slock" &
dunst &

exec sowm

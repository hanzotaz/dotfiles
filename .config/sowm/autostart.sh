#!/bin/sh

compton &
xfce4-power-manager &
mpd &
sxhkd -c /home/taz/.config/sowm/sxhkdrc &
feh --bg-fill /home/taz/Pictures/wallpapers/59FwBTe.jpg &
#python -m SimpleHTTPServer 8085 &
bash ~/.config/lemonbar/config.sh | bash ~/.config/lemonbar/lemonbar.sh &

mpd-notification -t 5 &
xautolock -time 10 -locker "slock" &
dunst &

exec sowm

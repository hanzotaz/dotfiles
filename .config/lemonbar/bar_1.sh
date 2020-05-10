#!/usr/bin/bash

# import colors from pywal
. "${HOME}/.cache/wal/colors.sh"

# todo: resize bar dimension
lemonbar -g 300x20+10+10 -B "$color0" -F "$color8" -f "InconsolataGo Nerd Font Mono -11" -dp

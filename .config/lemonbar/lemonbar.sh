#!/bin/bash

# Get the screen resolution using xrandr
screen_width=$(xrandr | grep '*' | awk '{print $1}' | cut -d 'x' -f1)
screen_height=$(xrandr | grep '*' | awk '{print $1}' | cut -d 'x' -f2)

# Set the desired bar height
bar_height=30

# Calculate the width and height with 10-pixel margins
bar_width=$((screen_width - 40))
y_offset=10

# Generate the geometry string
geometry="${bar_width}x${bar_height}+20+${y_offset}"

# Define your desktop (tag) names
tags=("1" "2" "3" "4" "5")

# Define Unicode symbols for empty and filled circles
empty_circle="○"
filled_circle="●"

# Function to draw the desktop indicators
draw_desktops() {
  desktop_output=""
  current_tag=$(herbstclient attr tags.focus.name)

  for tag in "${tags[@]}"; do
    if [[ "$tag" == "$current_tag" ]]; then
      desktop_output+="$filled_circle "
    else
      desktop_output+="$empty_circle "
    fi
  done

  echo "$desktop_output"
}

get_now_playing() {
  SPOTIFY_STATUS=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify \
    /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get \
    string:"org.mpris.MediaPlayer2.Player" string:"Metadata" 2>/dev/null)

  ARTIST=$(echo "$SPOTIFY_STATUS" | grep -A 2 "xesam:artist" | tail -1 | cut -d '"' -f 2)
  TITLE=$(echo "$SPOTIFY_STATUS" | grep -A 1 "xesam:title" | tail -1 | cut -d '"' -f 2)

  if [[ -z "$TITLE" ]]; then
    echo ""
  else
    echo "$ARTIST - $TITLE"
  fi
}

get_datetime() {
  datetime=$(date '+%Y-%m-%d %H:%M:%S')
  # Add padding with non-breaking spaces
  echo -e "${datetime}\u00A0\u00A0"
}

# Main loop
while true; do
  # Get the current desktops, music info, and datetime
  desktops=$(draw_desktops)
  music=$(get_now_playing)
  datetime=$(get_datetime)

  # Generate the bar content
  echo -e "%{l} $desktops %{c} $music %{r} $datetime"

  # Refresh every second
  sleep 1
done | lemonbar -p -g $geometry -B "#dfe3e1" -F "#8b9e70" -f "Cozette-9" | bash

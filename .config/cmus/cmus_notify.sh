#!/bin/sh

cmus_notify --title "$(printf "Now Playing: {title} \nBy: {artist}")" --body "$(printf "\n<b>Album:</b> {album}\n<b>duration</b> {duration}")" "$*" &

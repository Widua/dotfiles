#!/bin/zsh

folder=$(find ~/ -mindepth 2 -maxdepth 2 -type d -regex '.*/[^/]*Projects/[^/]*' \
     -printf "%P\n" \
    | sort \
    | wofi --show dmenu --prompt "Select project:")

[ -n "$folder" ] || exit 0

kitty "$folder" & disown
wl-copy "$folder" & disown
kitty --class nvim -d "$folder" nvim

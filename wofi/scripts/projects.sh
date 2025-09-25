#!/bin/zsh

folder=$(find ~/Projects -mindepth 1 -maxdepth 1 -type d -printf "%f\n" | sort | wofi --show dmenu --prompt "Select project:")

[ -n "$folder" ] || exit 0

kitty nvim ~/Projects/$folder & disown 


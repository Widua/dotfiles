#!/bin/zsh

folder=$(find ~/Projects -mindepth 1 -maxdepth 1 -type d -printf "%f\n" | sort | wofi --show dmenu --prompt "Select project:")

[ -n "$folder" ] || exit 0

kitty ~/Projects/$folder &disown
wl-copy ~/Projects/$folder & disown
kitty --class nvim -d ~/Projects/$folder nvim 

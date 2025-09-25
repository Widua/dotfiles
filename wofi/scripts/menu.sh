#!/bin/zsh

choice=$(printf "Projects\n" | wofi --show dmenu --prompt "Select action:")

case "$choice" in 
	Projects)
	~/.config/wofi/scripts/projects.sh
	;;
esac

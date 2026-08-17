local gnome_schema = "org.gnome.desktop.interface"

hl.on("hyprland.start", function()
	hl.exec_cmd("nm-applet")
	hl.exec_cmd("waybar -b waybar & hyprpaper &")
	hl.exec_cmd("dunst")
	hl.exec_cmd("gsettings set " .. gnome_schema .. " gtk-theme Qogir-Dark")
	hl.exec_cmd("gsettings set " .. gnome_schema .. " icon-theme Qogir-Dark")
	hl.exec_cmd("gsettings set " .. gnome_schema .. " cursor-theme Qogir-Dark")
	hl.exec_cmd("gsettings set org.gnome.desktop.wm.preferences theme Qogir-Dark")
end)

# Hyprland configuration

This directory contains a Lua-based Hyprland configuration. Hyprland 0.55 or newer is required for native Lua configuration support.

## Desktop shell

**Noctalia** provides the shell, including the launcher and control center. Wofi and Waybar are not used by this setup. Noctalia is started with the session, and its controls are called through `noctalia msg`.

## Arch Linux packages

Install the core compositor, shell, portals, and utilities used by the loaded config:

```bash
sudo pacman -S hyprland noctalia \
  xdg-desktop-portal xdg-desktop-portal-hyprland \
  pipewire pipewire-audio pipewire-pulse wireplumber \
  networkmanager network-manager-applet dunst glib2 qt6ct \
  kitty nautilus grim slurp wl-clipboard swappy \
  brightnessctl playerctl
```

`xdg-desktop-portal-gtk` is also recommended for GTK file-picker integration. The Qogir appearance configured at startup uses AUR packages:

```text
qogir-gtk-theme
qogir-icon-theme
qogir-cursor-theme-git
```

Check the installed theme names against the values in `config/autostart.lua`; in particular, the cursor theme may not be named `Qogir-Dark`.

`hyprshutdown` is optional: the logout bind checks for it and has a fallback. Applications named in window rules—such as Signal, Discord, Steam, Zen Browser, and IntelliJ IDEA—are optional and should be installed separately if needed.

## Layout

- `hyprland.lua` loads the monitor, window/workspace rules, autostart, environment, animation, keybind, and input modules, then applies the theme from `noctalia.lua`.
- `config/monitors.lua` contains hardware-specific output names, positions, and transforms. Update these to match the machine’s displays.
- `config/autostart.lua` starts the network applet, Dunst, and Noctalia. It also sets GTK and GNOME theme preferences with `gsettings`.
- `config/keybinds.lua` contains compositor, application, screenshot, audio, brightness, and Noctalia binds.
- `config/gaming.lua` and `config/noctalia.lua` are present but are not currently required by `hyprland.lua`; their rules and binds therefore are not active.

## Review notes

- `config/keybinds.lua` assigns `SUPER+S` to both the special workspace and Noctalia’s control center. Volume and brightness keys are also defined for both direct system commands and Noctalia. Choose one action for each duplicate bind.
- The `wofi` menu variable in `config/keybinds.lua` is currently unused; Noctalia handles the launcher.
- The `nvim` window rule may not match Neovim running inside Kitty, since that window is generally identified as Kitty.
- The Qogir settings are applied through `gsettings`, which changes the user’s settings globally rather than only for Hyprland.

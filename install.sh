#!/usr/bin/env bash
set -Eeuo pipefail

usage() {
	cat <<'EOF'
Usage: ./install.sh [--with-qogir] [--help]

Install the Arch packages used by this Hyprland configuration.

Options:
  --with-qogir  Also install the Qogir GTK, icon, and cursor themes from the AUR.
  --help        Show this help.
EOF
}

install_qogir=false
for arg in "$@"; do
	case "$arg" in
		--with-qogir) install_qogir=true ;;
		--help|-h)
			usage
			exit 0
			;;
		*)
			printf 'Unknown option: %s\n\n' "$arg" >&2
			usage >&2
			exit 2
			;;
	esac
done

if ! command -v pacman >/dev/null 2>&1; then
	printf 'Error: this installer requires Arch Linux (pacman was not found).\n' >&2
	exit 1
fi

if (( EUID == 0 )); then
	pacman_cmd=(pacman)
else
	if ! command -v sudo >/dev/null 2>&1; then
		printf 'Error: sudo is required to install packages.\n' >&2
		exit 1
	fi
	pacman_cmd=(sudo pacman)
fi

packages=(
	hyprland
	noctalia
	xdg-desktop-portal
	xdg-desktop-portal-hyprland
	xdg-desktop-portal-gtk
	pipewire
	pipewire-audio
	pipewire-pulse
	wireplumber
	networkmanager
	network-manager-applet
	dunst
	glib2
	qt6ct
	kitty
	nautilus
	grim
	slurp
	wl-clipboard
	swappy
	brightnessctl
	playerctl
	hyprshutdown
)

printf 'Installing official Arch packages...\n'
"${pacman_cmd[@]}" -S --needed "${packages[@]}"

if [[ "$install_qogir" == true ]]; then
	if (( EUID == 0 )); then
		printf 'Error: do not run AUR helpers as root; run this script as your regular user.\n' >&2
		exit 1
	fi

	aur_helper=''
	for helper in paru yay; do
		if command -v "$helper" >/dev/null 2>&1; then
			aur_helper="$helper"
			break
		fi
	done

	if [[ -z "$aur_helper" ]]; then
		printf 'Error: --with-qogir needs an AUR helper (paru or yay).\n' >&2
		exit 1
	fi

	printf 'Installing Qogir themes from the AUR with %s...\n' "$aur_helper"
	"$aur_helper" -S --needed qogir-gtk-theme qogir-icon-theme qogir-cursor-theme-git
fi

printf '\nPackage installation complete. No config files were changed and no services were enabled.\n'

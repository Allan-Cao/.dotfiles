#!/bin/sh
# https://github.com/coffebar/dotfiles/blob/main/dotfiles-restore.sh with modifications
# Note to self, there are intel specific packages!

PKG_FILE="pkglist.txt"

# Required to install yay
sudo pacman --needed --noconfirm -Sy git base-devel
# By default, copied files are too permissive
chmod 600 ~/.ssh/*

# install yay if not installed
if ! command -v yay; then
	# install yay
	git clone https://aur.archlinux.org/yay.git
	cd yay && makepkg -si --noconfirm && cd .. && rm -rf yay
	yay -Y --gendb
fi

mkdir -p /tmp/yay
# repeat command until it succeeds
until yay -S --builddir /tmp/yay --needed --cleanmenu=false --diffmenu=false --editmenu=false --removemake=false - < "$PKG_FILE"; do
	echo "Failed to install packages."
	confirm "Do you want to retry?" || exit
	yay -Syu
done

echo "Packages installed successfully."

sudo gpasswd -a $USER input
libinput-gestures-setup autostart
sudo gpasswd -a $USER plugdev

sudo ufw default deny incoming
sudo ufw enable

sudo systemctl enable --now bluetooth docker tlp ufw

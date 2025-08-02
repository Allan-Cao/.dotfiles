#!/bin/bash

set -e

STOW_FOLDERS="i3,polybar,alacritty"

# Remove existing configs to avoid conflicts
echo "Removing existing configs..."
rm -rf ~/.config/i3 ~/.config/polybar ~/.config/alacritty

# Stow each folder
for folder in $(echo "$STOW_FOLDERS" | tr ',' ' '); do
    echo "Stowing $folder..."
    stow --no-folding -t ~ -v "$folder"
done

echo "Dotfiles successfully stowed!"
echo ""
echo "Next steps:"
echo "1. Log out and select i3 as your session"
echo "2. Make sure wallpaper.png exists in your home directory"
echo "3. Configure ibus for your preferred input methods"
echo "4. Install maim for screenshots: sudo pacman -S maim"
echo "5. Create ~/Pictures directory for screenshots"
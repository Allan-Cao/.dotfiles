#!/bin/bash

set -e

STOW_FOLDERS="i3,alacritty,polybar"

# Stow each folder
for folder in $(echo "$STOW_FOLDERS" | tr ',' ' '); do
    stow -v --adopt "$folder"
done

echo "Dotfiles successfully stowed!"

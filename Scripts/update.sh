#!/bin/bash

mapfile -t pacman< <(jq -r ".pacman[]" ~/Dotfiles/Data/packages.json)
mapfile -t aur< <(jq -r ".aur[]" ~/Dotfiles/Data/packages.json)

figlet "Pacman"
sudo pacman -S --needed "${pacman[@]}"
figlet "Aur"
yay -S --needed "${aur[@]}"

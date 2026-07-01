#!/bin/bash

# Kitty
ln -sfn $HOME/Dotfiles/Configs/kitty $HOME/.config/kitty

#zsh
ln -sfn $HOME/Dotfiles/Configs/zsh/.zshrc $HOME/.zshrc
ln -sfn $HOME/Dotfiles/Configs/zsh/.zprofile $HOME/.zprofile
ln -sfn $HOME/Dotfiles/Configs/zsh/.zshenv $HOME/.zshenv

# Hyprland
ln -sfn $HOME/Dotfiles/Configs/hypr $HOME/.config/hypr

# rofi
ln -sfn $HOME/Dotfiles/Configs/rofi $HOME/.config/rofi

# btop
ln -sfn $HOME/Dotfiles/Configs/btop $HOME/.config/btop

# nvim
ln -sfn $HOME/Dotfiles/Configs/nvim $HOME/.config/nvim

# termfilechooser
ln -sfn $HOME/Dotfiles/Configs/xdg-desktop-portal-termfilechooser $HOME/.config/xdg-desktop-portal-termfilechooser
ln -sfn $HOME/Dotfiles/Configs/xdg-desktop-portal $HOME/.config/xdg-desktop-portal
sudo systemctl --user restart xdg-desktop-portal xdg-desktop-portal-termfilechooser

# keyd
sudo ln -sfn $HOME/Dotfiles/Configs/keyd/default.conf /etc/keyd/default.conf
sudo systemctl enable keyd
sudo systemctl start keyd

# noctalia 
ln -sfn $HOME/Dotfiles/Configs/noctalia $HOME/.config/noctalia


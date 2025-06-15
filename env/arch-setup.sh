#!/bin/bash

# update packages
sudo pacman -Syu

# install stow
sudo pacman -S stow

# install nvim
sudo pacman -S nvim

# install waybar
sudo pacman -S waybar

# install tmux
sudo pacman -S tmux
mkdir -p ~/.config/tmux/plugins
git clone git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins

# install wofi
sudo pacman -S wofi

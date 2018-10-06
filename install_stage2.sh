#!/bin/bash

# Create the prog folder
mkdir -p ~/prog/arch
cd ~/prog/arch

# Clone and install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Install lemonbar with xft support
yay -S lemonbar-xft-git

# Install Albert
yay -S albert

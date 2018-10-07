#!/bin/bash

# Setup editor
EDITOR=nano

# The user to create
USER=champii

useradd $USER

mkdir /home/$USER

passwd $USER

# Run the dhcpcd daemon
dhcpcd

# Wait for the dhcp
sleep 5

# Install dependancies
pacman -S base-devel lightdm lightdm-gtk-greeter zsh htop \
       i3 xorg-server xorg-xinit sudo xterm git \
       make gcc conky fakeroot alsa-utils feh \
       perl-anyevent-i3 chromium iotop jnettop \
       go emacs screen glances libinput xbacklight

# Fix the go root directory
sudo ln -s /usr/lib/go /usr/local/go

# Use ZSH
chsh -s /usr/bin/zsh $USER

# Add to sudoers
echo "$USER ALL=(ALL) ALL" >> /etc/sudoers

# Copy dotfiles and confs
cp -r install/* install/.* /home/$USER/

# Change ownership
chown -R $USER:$USER /home/$USER

# Refresh font cache
fc-cache -f

# Run stage2 (i3 lemonbar and albert)
sudo -u $USER ./install_stage2.sh

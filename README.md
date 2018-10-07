# dotfiles

Personal dotfiles for arch, zsh, i3wm and emacs

## Intro

It installs i3-gaps, spacemacs, oh-my-zsh, and the associated configuration files.

This repository intends to install a base WM system with battery included right after a fresh install of Arch Linux.  
It comes with an `install.sh` and an `install_stage2.sh`

The i3 lemonbar is completely vamped from `https://github.com/electro7/dotfiles` and add some rework that includes:  
  - Removal of the music indicator (and associated mpd, ...)
  - Disconnected network interface shows a red cross
  - Add brightness indicator
  - Add Battery indicator
  - Removal of email and irc sections
  
## Preview

![Overview](https://github.com/Champii/dotfiles/raw/master/_media/preview1.jpg)

## Install

### First stage

The first stage is `install.sh` and is meant to be run right after your first `root` login after  
a fresh install.

It will create a user (you have to actualy change the `USER` variable declaration at the top of the file  
to choose your username), start a dhcpcd daemon and install the needed packages.

```
pacman -S base-devel lightdm lightdm-gtk-greeter zsh htop \
       i3 xorg-server xorg-xinit sudo xterm git \
       make gcc conky fakeroot alsa-utils feh \
       perl-anyevent-i3 chromium iotop jnettop \
       go emacs screen glances libinput xbacklight
```
       
As it installs `go`, it adds a symbolic link to `/usr/local/go`

It sets the default shell to `zsh` and adds the user to the sudoers

After that it copies the dotfiles into the Home folder, gives ownership to the user, reload the fonts and start the stage2 as the username

### Second stage

The second stage will just install the `yay` AUR wrapper and use it to install `lemonbar-xft-git` and `albert` packages


### Updating this repo

A `update.sh` script is given to add back any modification of the dotfiles into the repo. 

## Usage

### What is run

At startup we run chromium, compton (compositor), xautolock and emacs daemon  
We also setup 2 additional monitors  

### I3 bindings

The bindings are the same as the default for I3 except for the following

| shortcut                  | action                     |
|---------------------------|----------------------------|
| $mod                      | Mod4                       |
| $mod + Return             | xterm                      |
| Alt + Space               | albert                     |
| $mod + z                  | Split horizontal + xterm   |
| $mod + x                  | Split vertical + xterm     |
| $mod + Alt + Arrows       | Resize the focused window  |
| $mod + Tab                | WMFocus                    |
| Ctrl + $mod + Left/ Right | Switch workspace prev/next |
| Ctrl + $mod + l           | i3lock-fancy               |
| $mod + n                  | emacsclient                |

We also setup volume and brightness keys as well as the PrintScreen key

## Todo

  - Icons for brightness and battery
  - Icons for wlan and eth
  - Sections for `sensors` (fan speed, cpu temp, ...)
  - Different colors for battery section and notifications
  

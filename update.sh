#!/bin/bash

cp -r ~/.zshrc ~/.xinitrc ~/.spacemacs ~/.emacs.d \
   ~/.fonts ~/.i3 ~/.oh-my-zsh ./install

rm -r ./install/.oh-my-zsh/.git

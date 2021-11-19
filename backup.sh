#!/bin/bash

##Backup config

cp -r $HOME/.config/i3 .
cp -r $HOME/.config/i3status .
cp -r $HOME/.fonts/* home/fonts/.
cp -r $HOME/shortcuts .

#vimrc
cp ~/.vimrc ~/config/

#nvim
[ -d ~/.config/nvim ] && cp ~/.config/nvim/* ~/config/nvim/


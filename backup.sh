#!/bin/bash

##Backup config

cp -r $HOME/.config/i3 .
cp -r $HOME/.config/i3status .
cp -r $HOME/.fonts/* home/fonts/

#vimrc
cp ~/.vimrc ~/config/

#nvim
cp ~/.config/nvim/* ~/config/nvim/


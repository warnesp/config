#!/bin/bash

[ -f /etc/redhat-release ] && 
  echo "backing up for RHEL"

##Backup config

cp -r $HOME/shortcuts .

if command -v i3 > /dev/null
then
  cp -r $HOME/.config/i3 .
  cp -r $HOME/.config/i3status .
  cp -r $HOME/.fonts/* home/fonts/.
else
  echo "No i3"
fi

#vimrc
if  command -v vim > /dev/null 
then
  cp ~/.vimrc ~/config/vim/vimrc
else
  echo "No vim"
fi

#nvim
if  command -v nvim > /dev/null
then
  [ -d ~/.config/nvim ] && cp ~/.config/nvim/* ~/config/nvim/
else
  echo "No nvim"
fi


#!/bin/bash

[ -f /etc/redhat-release ] && 
  echo "backing up for RHEL"

##Backup config

cp -r $HOME/shortcuts .

if command -v i3 > /dev/null
then
  echo "Backing up i3 configs"
  cp -r $HOME/.config/i3 .
  cp -r $HOME/.config/i3status .
  cp -r $HOME/.fonts/fontawesome-webfont.ttf home/fonts/fontawesome-webfont.ttf
else
  echo "No i3"
fi

#vimrc
if  command -v vim > /dev/null 
then
  echo "Backing up vim settings"
  cp ~/.vimrc ~/config/vim/vimrc
else
  echo "No vim"
fi

#nvim
if  command -v nvim > /dev/null
then
  echo "Backing up nvim settings"
  [ -d ~/.config/nvim ] && cp -r ~/.config/nvim/* ~/config/nvim/
else
  echo "No nvim"
fi

if command -v alacritty > /dev/null
then
    echo "Backing up alacritty settings"
    cp ~/.config/alacritty/* ~/config/alacritty/
else
    echo "No alacritty"
fi

if command -v emacs > /dev/null
then
    echo "Backing up emacs"
    #cp ~/.doom.d/* ~/config/doom.d/
else
    echo "No emacs"
fi

# face icon
cp ~/.face ~/config/home/face

# media center stuff
if [ "$(hostname)" = "mediacenter" ]
then
    echo "Backing up media center stuff"
    cp ~/Desktop/*.desktop ~/config/media-center/Desktop
    mkdir -p ~/config/media-center/icons
    cp ~/icons/* ~/config/media-center/icons/
fi



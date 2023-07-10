#!/bin/bash

[ -f /etc/redhat-release ] && 
  echo "backing up for RHEL"

function backup() {
    local cmd="$1"
    local cmdConfigDir="$HOME/.config/${cmd}"
    if command -v "${cmd}" > /dev/null
    then
        if [ -d "${cmdConfigDir}" ]
        then
            echo "Backing up ${cmd} settings"
            cp -r "${cmdConfigDir}/" "$HOME/config/"
        else
            echo "No config for ${cmd} at ${cmdConfigDir}"
        fi
    else
        echo "No ${cmd}"
    fi
}

##Backup config

cp -r $HOME/shortcuts .

fontAwesome="$HOME/.fonts/fontawesome-webfont.ttf"
if [ -f "$fontAwesome" ] 
then
  cp -r "$fontAwesome" home/fonts/fontawesome-webfont.ttf
else
    echo "No fontawesome"
fi

if command -v i3 > /dev/null
then
  echo "Backing up i3 configs"
  cp -r $HOME/.config/i3 .
  cp -r $HOME/.config/i3status .
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


backup "nvim"
backup "alacritty"
backup "kitty"


if command -v emacs > /dev/null
then
    echo "Backing up emacs"
    cp ~/.emacs.d/init.el ~/config/emacs.d/
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



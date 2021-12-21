#!/bin/bash

[ -f /etc/redhat-release ] && 
echo "restoring for RHEL"


##restore config
cp -r shortcuts $HOME/
mkdir -p $HOME/shortcuts/bin

#i3 config
if command -v i3 > /dev/null
then
    echo "Restoring i3 settings"

    mkdir -p "$HOME/.fonts" && cp -r home/fonts/* $HOME/.fonts/
    cp -r i3status $HOME/.config/
    cp -r i3 $HOME/.config/
else
    echo "No i3"
fi

#vim
if command -v vim > /dev/null 
then
    echo "Restoring VIM settings"
    cp $HOME/config/vim/vimrc $HOME/.vimrc

    # setup alternate swap location
    mkdir -p $HOME/.vim/swapfiles
    mkdir -p $HOME/.vim/backups
    mkdir -p $HOME/.vim/autoload

    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +PlugInstall +q +q
else
    echo "No vim"
fi

#neovim
if command -v nvim > /dev/null
then
    echo "Restoring NVIM settings"

    mkdir -p ~/.config/nvim
    cp ~/config/nvim/* ~/.config/nvim

    #install nvim plugin manager
    command -v curl > /dev/null && curl -s -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "make sure to call :PlugInstall after running nvim for the first time"
else
    echo "No NVIM"
fi

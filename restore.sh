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

    # setup alternate swap location
    mkdir -p $HOME/.vim/swapfiles
    mkdir -p $HOME/.vim/backups

    mkdir -p ~/.config/nvim
    cp ~/config/nvim/* ~/.config/nvim

    #install nvim plugin manager
    command -v curl > /dev/null && curl -s -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "make sure to call :PlugInstall after running nvim for the first time"
else
    echo "No NVIM"
fi

if command -v alacritty > /dev/null
then
    echo "Restoring up alacritty settings"
    mkdir -p ~/.config/alacritty
    cp ~/config/alacritty/* ~/.config/alacritty/ 
else
    echo "No alacritty"
fi

if command -v emacs > /dev/null
then
    echo "Restoring emacs"
    mkdir -p ~/.doom.d
    cp ~/config/doom.d/* ~/.doom.d/

    if [ -f ~/.emacs.d/bin/doom ]
    then
        ~/.emacs.d/bin/doom sync
    fi

else
    echo "No emacs"
fi

#face
cp ~/config/home/face ~/.face


#setup fonts
mkdir -p .fonts/adobe-fonts
if [ ! -d ~/.fonts/adobe-fonts/source-code-pro ] ; then
    echo "installing source code pro font"
    git clone --depth 1 https://github.com/adobe-fonts/source-code-pro.git ~/.fonts/adobe-fonts/source-code-pro
    fc-cache -f -v ~/.fonts/adobe-fonts/source-code-pro
else
    echo "source code pro font already installed"
fi


#!/bin/bash

[ -f /etc/redhat-release ] && 
echo "restoring for RHEL"


function RestorePlugin() 
{
    local pluginName="$1"
    local pluginUrl="$2"

    mkdir -p "$HOME/.vim/pack/vendor/start/$pluginName" &&
        rm -rf "$HOME/.vim/pack/vendor/start/$pluginName" && 
    git clone --depth 1 -q $pluginUrl $HOME/.vim/pack/vendor/start/$pluginName || 
    echo "Failed to get $pluginName"

    [ -f /etc/redhat-release ] && 
    echo "Installing $pluginName for RHEL" && 
    mkdir -p "$HOME/.vim/plugins/$pluginName" && 
    rm -rf "$HOME/.vim/plugins/$pluginName" && 
    cp -r "$HOME/.vim/pack/vendor/start/$pluginName" "$HOME/.vim/plugins/$pluginName" 


}


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


    if command -v git > /dev/null
    then
        #setup NERDTree
        RestorePlugin "nerdtree" "https://github.com/preservim/nerdtree.git"

        #setup FSwitch
        RestorePlugin "fswitch" "https://github.com/derekwyatt/vim-fswitch.git"

        #setup uncrustify
        if command -v uncrustify > /dev/null ; then
            RestorePlugin "uncrustify" "https://github.com/cofyc/vim-uncrustify.git" 
        else
            echo "No uncrustify"
        fi
        #setup Doxygen
        if command -v doxygen > /dev/null ; then 
            RestorePlugin "doxygen" "https://github.com/vim-scripts/DoxygenToolkit.vim.git"
        else
            echo "No doxygen"
        fi
    fi
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

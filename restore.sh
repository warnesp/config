#!/bin/bash

##restore config

#vim
if  command -v vim > /dev/null 
then
    echo "Restoring VIM settings"
    cp ~/config/.vimrc ~/


    if command -v git > /dev/null
    then
        #setup NERDTree
        mkdir -p "~/.vim/pack/vendor/start/nerdtree"  && rm -rf "$HOME/.vim/pack/vendor/start/nerdtree" && git clone --depth 1 -q https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree || echo "Failed to get nerdtree"
        [ -f /etc/redhat-release ] && echo "Installing NerdTree for RHEL" && mkdir -p "$HOME/.vim/plugins/nerdtree" && rm -rf "$HOME/.vim/plugins/nerdtree" && cp -r "$HOME/.vim/pack/vendor/start/nerdtree" "$HOME/.vim/plugins/nerdtree"
        
        #setup uncrustify
        if command -v uncrustify > /dev/null ; then
            mkdir -p "~/.vim/pack/vendor/start/uncrustify" && rm -rf "$HOME/.vim/pack/vendor/start/uncrustify" && git clone --depth 1 -q https://github.com/cofyc/vim-uncrustify.git ~/.vim/pack/vendor/start/uncrustify || echo "Failed to get uncrustify"
            [ -f /etc/redhat-release ] && echo "Installing uncrustify for RHEL" && mkdir -p "$HOME/.vim/plugins/uncrustify" && rm -rf "$HOME/.vim/plugins/uncrustify" && cp -r "$HOME/.vim/pack/vendor/start/uncrustify" "$HOME/.vim/plugins/uncrustify" 
        else
            echo "No uncrustify"
        fi

    fi


fi

#neovim
if  command -v nvim > /dev/null
then
    echo "Restoring NVIM settings"

    mkdir -p ~/.config/nvim
    cp ~/config/nvim/* ~/.config/nvim

    #install nvim plugin manager
    command -v curl > /dev/null && curl -s -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ###make sure to call :PlugInstall after running nvim for the first time
fi


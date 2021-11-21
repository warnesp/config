#!/bin/bash

[ -f /etc/redhat-release ] && 
  echo "restoring for RHEL"


##restore config
cp -r shortcuts $HOME/

#i3 config
if command -v i3 > /dev/null
then
  cp -r home/fonts/* $HOME/.fonts
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


  if command -v git > /dev/null
  then
    #setup NERDTree
    mkdir -p "$HOME/.vim/pack/vendor/start/nerdtree"  && 
      rm -rf "$HOME/.vim/pack/vendor/start/nerdtree" && 
      git clone --depth 1 -q https://github.com/preservim/nerdtree.git $HOME/.vim/pack/vendor/start/nerdtree || 
      echo "Failed to get nerdtree"

    [ -f /etc/redhat-release ] && 
      echo "Installing NerdTree for RHEL" && 
      mkdir -p "$HOME/.vim/plugins/nerdtree" && 
      rm -rf "$HOME/.vim/plugins/nerdtree" && 
      cp -r "$HOME/.vim/pack/vendor/start/nerdtree" "$HOME/.vim/plugins/nerdtree"

    #setup uncrustify
    if command -v uncrustify > /dev/null ; then
      mkdir -p "$HOME/.vim/pack/vendor/start/uncrustify" && 
        rm -rf "$HOME/.vim/pack/vendor/start/uncrustify" && 
        git clone --depth 1 -q https://github.com/cofyc/vim-uncrustify.git $HOME/.vim/pack/vendor/start/uncrustify || 
        echo "Failed to get uncrustify"

      [ -f /etc/redhat-release ] && 
        echo "Installing uncrustify for RHEL" && 
        mkdir -p "$HOME/.vim/plugins/uncrustify" && 
        rm -rf "$HOME/.vim/plugins/uncrustify" && 
        cp -r "$HOME/.vim/pack/vendor/start/uncrustify" "$HOME/.vim/plugins/uncrustify" 
            else
              echo "No uncrustify"
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

#!/bin/bash

##restore config

#vim
if  command -v vim > /dev/null 
then
  echo "Restoring VIM settings"
  cp ~/config/.vimrc ~/

  #setup NERDTree
  mkdir -p "~/.vim/pack/vendor/start/nerdtree"
  if command -v git > /dev/null
  then

    [ -d "$HOME/.vim/pack/vendor/start/nerdtree" ] && rm -rf "$HOME/.vim/pack/vendor/start/nerdtree" && git clone -q https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree || echo "Failed to get nerdtree"
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


#!/bin/bash

##restore config


#vim
cp ~/config/.vimrc ~/

mkdir -p ".vim/pack/vendor/start/nerdtree"
git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree

#neovim
mkdir -p ~/.config/nvim
cp ~/config/nvim/* ~/.config/nvim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

###make sure to call :PlugInstall after running nvim for the first time



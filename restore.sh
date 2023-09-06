#!/bin/bash

[ -f /etc/redhat-release ] && 
echo "restoring for RHEL"

function restore() {
    local cmd="$1"
    if command -v "${cmd}" > /dev/null
    then
        echo "Restoring up ${cmd} settings"
        mkdir -p "$HOME/.config/${cmd}"
        cp -r "$HOME/config/${cmd}/" "$HOME/.config/"
    else
        echo "No ${cmd}"
    fi
}

if ! command -v curl > /dev/null
then
    echo "need curl installed"
    exit 1
fi

##restore config
cp -r "$HOME/config/shortcuts" $HOME/
mkdir -p $HOME/shortcuts/bin

# restore fonts
mkdir -p "$HOME/.fonts" && cp -r "$HOME/config/home/fonts/"* "$HOME/.fonts/"

#i3 config
if command -v i3 > /dev/null
then
    echo "Restoring i3 settings"

    cp -r "$HOME/config/i3status" $HOME/.config/
    cp -r "$HOME/config/i3" "$HOME/.config/"
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

    vimPlugInstallLoc="$HOME/.vim/autoload/plug.vim"

    if [ ! -f "$vimPlugInstallLoc" ]
    then
        curl -fLo "$vimPlugInstallLoc" --create-dirs \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        vim +PlugInstall +q +q
    fi
else
    echo "No vim"
fi

#neovim
if command -v nvim > /dev/null
then
    # pip3 install --user neovim
    echo "Restoring NVIM settings"

    # setup alternate swap location
    mkdir -p $HOME/.vim/swapfiles
    mkdir -p $HOME/.vim/backups

    mkdir -p ~/.config/nvim
    cp -r ~/config/nvim/* ~/.config/nvim

    plugInstallLoc="$HOME/.local/share/nvim/site/autoload/plug.vim"
    if [ ! -f "$plugInstallLoc" ] 
    then
        #install nvim plugin manager
        command -v curl > /dev/null && curl -s -fLo "$plugInstallLoc" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        nvim +PlugInstall +q +q
    fi
else
    echo "No NVIM"
fi

restore "alacritty"
restore "kitty"

if command -v emacs > /dev/null
then
    echo "Restoring emacs"
    mkdir -p ~/.emacs.d
    cp ~/config/emacs.d/* ~/.emacs.d/
    cp ~/config/spacemacs ~/.spacemacs
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

#media center stuff
if [ "$(hostname)" = "mediacenter" ]
then
    echo "Restoring media center"
    cp ~/config/media-center/Desktop/*.desktop ~/Desktop/
    mkdir -p ~/icons/
    cp  ~/config/media-center/icons/* ~/icons/
fi

function restore-local() {
    local dir="$1"
    local orig_dir="$HOME/.local/$dir"
    local bkup_dir=~/config/local/$dir
    if [ -d "$bkup_dir" ] 
    then
        mkdir -p "$orig_dir"
        cp "$bkup_dir"/* "$orig_dir"/
    fi

}

restore-local "share/applications"
restore-local "share/icons"

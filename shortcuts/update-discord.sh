#!/bin/bash

INSTALL_DIR=~/.local/Discord

if mv ~/Downloads/discord-* ~/Downloads/discord/discord.tar.gz ; then
    rm -rf ~/Downloads/discord/Discord
    tar xf ~/Downloads/discord/discord.tar.gz
    rm -rf $INSTALL_DIR
    mv ~/Downloads/discord/Discord $INSTALL_DIR
else
    echo "No Discord Update"
fi


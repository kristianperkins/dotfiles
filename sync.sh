#! /usr/bin/env bash

if ! hash dotfiles 2>/dev/null; then
    echo 'Installing dotfiles (needs pip)'
    sudo pip install dotfiles
fi

if [[ ! -f  "$HOME/.zgen" ]]; then
    git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
fi

if [[ ! -d  "$HOME/.vundle" ]]; then
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vundle
fi

echo 'Installing virtualenvwrapper if needed'
sudo pip install virtualenvwrapper

cd ~/.dotfiles

git pull origin master

# one-time install of dotfilesrc
if [ ! -e ~/.dotfilesrc ]; then
    ln -s ~/.dotfiles/dotfilesrc ~/.dotfilesrc
fi

# update submodules (used for vim plugins)
#git submodule update --init --recursive

dotfiles -s

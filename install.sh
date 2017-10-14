#!/bin/bash

echo "Let's do this..."

# install vim plug
curl -fLo ~/.dotfiles/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install homebrew if missing
if test ! $(which brew)
then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# brew stuff
echo "Brewing..."
source brew.sh

# get hammerspoon config
git clone git@github.com:excentris/hammerspoon-config.git $HOME/.hammerspoon
cp "$HOME/Google Drive/Config/hammerspoon-config.json" $HOME/.hammerspoon/config.json

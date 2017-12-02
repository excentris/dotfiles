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

# XCode
echo "Installing XCode..."
xcode-select --install

# Hammerspoon
echo "Setting up Hammerspoon..."
# symlink hammerspoon config
ln -sfn $DOTFILES/hammerspoon $HOME/.hammerspoon
# get hammerspoon config
cp "$HOME/Google Drive/Config/hammerspoon-config.json" $HOME/.hammerspoon/config.json

# Karabiner-Elements
echo "Setting up Karabiner-Elements..."
# symlink karabiner config
ln -sfn $DOTFILES/karabiner $HOME/.config/karabiner

# make scripts executable
echo "Making scripts executable..."
chmod u+x $SCRIPTS/*

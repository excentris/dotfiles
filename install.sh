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

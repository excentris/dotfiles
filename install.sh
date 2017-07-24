#!/bin/bash

# install vim plug
curl -fLo  ~/.dotfiles/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install homebrew if missing
if test ! $(which brew)
then
  echo "  installing homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi


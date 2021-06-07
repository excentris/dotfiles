#!/bin/bash

# update everything
brew update
brew upgrade

# install the usual suspects
brew install bash
brew install bash-completion
echo "  you'll need to add /usr/local/bin/bash to /etc/shells and then run chsh"
brew install bash-git-prompt

brew install vim
brew install git
brew install tmux
brew install fzf
$(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc

# cask
brew install --cask iTerm2
brew install --cask hammerspoon
brew install --cask karabiner-elements
brew install --cask slack
brew install --cask the-unarchiver

brew cleanup

#!/bin/bash

# update everything
brew update
brew upgrade

# install the usual suspects
brew install bash
brew install bash-completion
echo "  you'll need to add /usr/local/bin/bash to /etc/shells and then run chsh"
brew install bash-git-prompt

brew install vim --with-override-system-vi
brew install git
brew install tmux
brew install fzf
$(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc

# cask
brew cask install iTerm2
brew cask install hammerspoon
brew cask install karabiner-elements
brew cask install google-backup-and-sync
brew cask install dash
brew cask install slack
brew cask install the-unarchiver
brew cask install android-studio

brew cleanup

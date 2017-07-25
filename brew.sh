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

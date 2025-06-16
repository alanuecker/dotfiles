#!/usr/bin/env bash

sudo -v

echo "Installing Xcode Command Line Tools."
xcode-select --install

echo "Confirm if Xcode is installed"

defaults write com.apple.Finder AppleShowAllFiles true
killall Finder

echo "Installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
brew upgrade -all

echo "Installing zsh..."
brew install wget
brew install fzf
brew install neovim
brew install zsh zsh-history-substring-search zsh-autosuggestions zsh-syntax-highlighting
brew install spaceship
wget -O ~/.zshrc https://raw.githubusercontent.com/alanuecker/dotfiles/main/shell/.zshrc
wget -O ~/.config/zsh/git.zsh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/lib/git.zsh
wget -O ~/.config/zsh/git.plugin.zsh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/git/git.plugin.zsh
wget -O ~/.config/zsh/spaceship.zsh https://raw.githubusercontent.com/alanuecker/dotfiles/main/shell/spaceship.zsh


echo "Installing git..."
brew install git

echo "Installing node..."
brew install node
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

echo "Installing yarn..."
brew install yarn

echo "Installing python..."
brew install pyenv

echo "Install enhancd..."
brew intsall fzy
cd ~
wget -qO- https://raw.githubusercontent.com/b4b4r07/enhancd

echo "Setup karabiner..."
brew cask install --appdir="/Applications" karabiner-elements
wget -O ~/.config/karabiner/karabiner.json https://raw.githubusercontent.com/alanuecker/dotfiles/master/keyboard/karabiner/karabiner.json

echo "Install software..."
brew install --cask --appdir="/Applications" google-chrome
brew install --cask --appdir="/Applications" visual-studio-code
brew install --cask --appdir="/Applications" spotify
brew install --cask --appdir="/Applications" arc
brew install --cask --appdir="/Applications" notion
brew install --cask --appdir="/Applications" slack
brew install --cask --appdir="/Applications" docker
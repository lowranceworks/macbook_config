#!/bin/zsh

cp ./files/home_directory/.zshrc $HOME
cp -r ./files/home_directory/.oh-my-zsh/ $HOME

# install terminal applications
brew install $(<brew.txt)

# install gui applications
brew install --cask $(<brew-casks.txt)

source $HOME/.zshrc

#!/bin/zsh

cp ./files/home_directory/.zshrc $HOME
cp -r ./files/home_directory/.oh-my-zsh/ $HOME

source $HOME/.zshrc
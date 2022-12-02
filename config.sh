#!/bin/zsh

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install brew developer tools
xcode-select --install

# commands to run before you install git with brew
sudo chown -R $(whoami) /opt/homebrew /opt/homebrew/share/zsh /opt/homebrew/share/zsh/site-functions /opt/homebrew/var/homebrew/locks
chmod u+w /opt/homebrew /opt/homebrew/share/zsh /opt/homebrew/share/zsh/site-functions /opt/homebrew/var/homebrew/locks

# install software with brew
brew install terragrunt
brew install terraform
brew install kubectl
brew install bitwarden
brew install signal
brew install qemu
brew install node
brew install fig
brew install go
brew install krew
brew install discord
brew install awscli
brew install google-cloud-sdk
brew install azure-cli
brew install flycut
brew install rectangle
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install zsh-fast-syntax-highlighting
brew install visual-studio-code
brew install kind
brew install podman
brew install webcatalog
brew install neofetch
brew install iterm2
brew install neovim
brew install vim
brew install fd
brew install helm
brew install argocd
brew install jq
brew install wget
brew install gsed
brew install telnet
brew install vault

# install krew plugins (require changes to ~/.zshrc)
kubectl krew install ctx
kubectl krew install ns

# enable key repeating for vim extension on vscode (see https://github.com/VSCodeVim/Vim)
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false # For VS Code

# enable global key-repeat - this is helpful if you're using Vim in a PWA like code-server
defaults write -g ApplePressAndHoldEnabled -bool false

# remap "caps lock" key to "esc" key

# install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

# install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# install fonts for powerlevel10k

# enable natural scroll test editing for iterm2

# set default branch name to main
git config --global init.defaultBranch main

# copy files from repo to macbook
cp ./files/home_directory/.zshrc $HOME
cp -r ./files/home_directory/.oh-my-zsh/ $HOME

# reload zsh for changes to go into effect
source $HOME/.zshrc

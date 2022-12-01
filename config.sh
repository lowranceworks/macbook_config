#!/bin/zsh

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install brew developer tools
xcode-select --install

# commands to run before you install git with brew
sudo chown -R $(whoami) /opt/homebrew /opt/homebrew/share/zsh /opt/homebrew/share/zsh/site-functions /opt/homebrew/var/homebrew/locks
chmod u+w /opt/homebrew /opt/homebrew/share/zsh /opt/homebrew/share/zsh/site-functions /opt/homebrew/var/homebrew/locks

# install software with brew
echo "git
terragrunt
terraform
kubectl
bitwarden
signal
qemu
node
fig
go
krew
discord
awscli
google-cloud-sdk
azure-cli
flycut
rectangle
zsh-autosuggestions
zsh-syntax-highlighting
zsh-fast-syntax-highlighting
visual-studio-code
kind
podman
webcatalog
neofetch
iterm2
neovim
vim
fd
helm
argocd
jq
wget
gsed
telnet

" > software.txt

brew install $(<software.txt)


# install krew plugins (require changes to ~/.zshrc)
kubectl krew install ctx
kubectl krew install ns

# enable key repeating for vim extension on vscode (see https://github.com/VSCodeVim/Vim)
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false # For VS Code

# enable global key-repeat - this is helpful if you're using Vim in a PWA like code-server
defaults write -g ApplePressAndHoldEnabled -bool false

# remap "caps lock" key to "esc" key
### makes working with vim much easier.

# install oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# install fonts for powerlevel10k

# install my .zshrc and .oh-my-zsh settings
mkdir -p ~/Projects/personal/
git clone https://github.com/lowranceworks/macbook_config.git ~/Projects/personal/
cp -r ~/Projects/personal/macbook_config/files/home_directory/.zshrc ~/.zshrc
cp -r ~/Projects/personal/macbook_config/files/home_directory/.oh-my-zsh ~/.oh-my-zsh

# reload zsh for changes to go into effect
source ~/.zshrc

# enable natural scroll test editing for iterm2

# set default branch name to main
git config --global init.defaultBranch main

# copy files from repo to macbook
cp ./files/home_directory/.zshrc $HOME
cp -r ./files/home_directory/.oh-my-zsh/ $HOME

source $HOME/.zshrc

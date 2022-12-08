#!/bin/zsh


# create ~/Learning/ and clone repositories
mkdir -p ~/Learning/

# copy files to their destination
cp ./files/home_directory/.zshrc $HOME
cp -r ./files/home_directory/.oh-my-zsh/ $HOME

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install brew developer tools
xcode-select --install

# commands to run before you install git with brew
sudo chown -R $(whoami) /opt/homebrew /opt/homebrew/share/zsh /opt/homebrew/share/zsh/site-functions /opt/homebrew/var/homebrew/locks
chmod u+w /opt/homebrew /opt/homebrew/share/zsh /opt/homebrew/share/zsh/site-functions /opt/homebrew/var/homebrew/locks

# install terminal applications
brew install $(<brew.txt)

# install gui applications
brew install --cask $(<brew-casks.txt)

# install krew plugins (require changes to ~/.zshrc)
kubectl krew install ctx
kubectl krew install ns

# enable key repeating for vim extension on vscode (see https://github.com/VSCodeVim/Vim)
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false # For VS Code

# enable global key-repeat - this is helpful if you're using Vim in a PWA like code-server
defaults write -g ApplePressAndHoldEnabled -bool false

# remap "caps lock" key to "esc" key
#

# install oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# install fonts for powerlevel10k
#

# enable natural scroll test editing for iterm2
#

# set default branch name to main
git config --global init.defaultBranch main

# reload zsh for changes to go into effect
source $HOME/.zshrc
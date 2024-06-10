#!/bin/bash
# Title           : install-ohmy-z.sh
# Description     : This script will install Zsh/Oh My Zsh/PowerLevel10k stack.
# Author          : parantido
# Date            : 20240524
# Version         : 0.1
# Usage           : chmox +x install-ohmy-z.sh && ./install-ohmy-z.sh
# Notes           : This is a one shot installer!
#==============================================================================

# Install Zsh
sudo apt-get update ; sudo apt-get -y install git zsh

# Retrieve Oh My ZSH Repositories
git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
git -C ~/.oh-my-zsh/custom/plugins clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git
git -C ~/.oh-my-zsh/custom/plugins clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git
git -C ~/.oh-my-zsh/custom/themes clone --depth=1 https://github.com/romkatv/powerlevel10k.git

# Configure Zsh
cat >~/.zshrc <<\END
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH=~/.oh-my-zsh
DISABLE_AUTO_UPDATE=true
DISABLE_MAGIC_FUNCTIONS=true
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(zsh-syntax-highlighting zsh-autosuggestions)

source ~/.oh-my-zsh/oh-my-zsh.sh
source ~/.p10k.zsh
END

cat >~/.p10k.zsh <<\END
# put the content of your own .p10k.zsh here
END

# Change Default Shell
chsh -s $(which zsh)

# Suppress configuration alert
echo "POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true" >> ~/.zshrc

# Switch Shell
`which zsh`

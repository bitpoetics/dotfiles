#!/bin/sh

if command -v brew &> /dev/null; then
    echo "Homebrew is installed"
else
    echo "Homebrew is not installed"
    printf '\033[33m%s\033[m\n' 'Installing Homebrew...'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

printf '\033[33m%s\033[m\n' 'Executing brew doctor...'
brew doctor

printf '\033[33m%s\033[m\n' 'Updating Homebrew...'
brew update # Update all package definitions (formulae) and Homebrew itself

printf '\033[33m%s\033[m\n' 'Executing brew bundle...'
brew bundle --global # Install Homebrew/cask/mas packages

LOCAL_BREWFILE="$HOME/.Brewfile.local"
if [ -f "$LOCAL_BREWFILE" ]; then
    printf '\033[33m%s\033[m\n' 'Executing brew bundle (local)...'
    brew bundle --file="$LOCAL_BREWFILE"
fi

printf '\033[33m%s\033[m\n' 'Updating Homebrew formulae...'
brew upgrade


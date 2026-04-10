#!/bin/sh

printf "\033[33m%s\033[m\n" "Configuring Homebrew..."

# Brewfile
ln -sf "$DOTFILES_DIR/homebrew/Brewfile" "$HOME/.Brewfile"
echo "Created symlink: $HOME/.Brewfile -> $DOTFILES_DIR/homebrew/Brewfile"

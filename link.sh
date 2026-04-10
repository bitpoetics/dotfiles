#!/bin/sh

export DOTFILES_DIR=$(cd "$(dirname "$0")" && pwd)

cd "$DOTFILES_DIR"

# Homebrew
sh "$DOTFILES_DIR/homebrew/link.sh"

# Z Shell
sh "$DOTFILES_DIR/zsh/link.sh"

# Vim
sh "$DOTFILES_DIR/vim/link.sh"

# Git
sh "$DOTFILES_DIR/git/link.sh"

# Claude
sh "$DOTFILES_DIR/claude/link.sh"


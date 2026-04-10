#!/bin/sh

printf "\033[33m%s\033[m\n" "Configuring Vim..."

# vimrc
ln -sf "$DOTFILES_DIR/vim/vimrc" "$HOME/.vimrc"
echo "Created symlink: $HOME/.vimrc -> $DOTFILES_DIR/vim/vimrc"

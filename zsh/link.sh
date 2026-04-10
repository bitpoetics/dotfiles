#!/bin/sh

printf "\033[33m%s\033[m\n" "Configuring Z Shell..."

ZSH_FILES="zshenv zshrc zshrc.aliases zprofile"

for ZSH_FILE in $ZSH_FILES; do
    if [ -e "$DOTFILES_DIR/zsh/$ZSH_FILE" ]; then
        ln -sf "$DOTFILES_DIR/zsh/$ZSH_FILE" "$HOME/.$ZSH_FILE"
        echo "Created symlink: $HOME/.$ZSH_FILE -> $DOTFILES_DIR/zsh/$ZSH_FILE"
    else
        echo "Skipping missing file: $DOTFILES_DIR/zsh/$ZSH_FILE"
    fi
done


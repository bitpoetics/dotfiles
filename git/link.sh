#!/bin/sh

printf "\033[33m%s\033[m\n" "Configuring Git..."

GIT_CONFIG_DIR="$HOME/.config/git"

if [ ! -d "$GIT_CONFIG_DIR" ]; then
    mkdir -p "$GIT_CONFIG_DIR"
fi

GIT_CONFIG_FILES="config ignore"

for GIT_CONFIG_FILE in $GIT_CONFIG_FILES; do
    ln -sf "$DOTFILES_DIR/git/$GIT_CONFIG_FILE" "$GIT_CONFIG_DIR/$GIT_CONFIG_FILE"
    echo "Created symlink: $GIT_CONFIG_DIR/$GIT_CONFIG_FILE -> $DOTFILES_DIR/git/$GIT_CONFIG_FILE"
done


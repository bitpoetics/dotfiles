#!/bin/sh

printf "\033[33m%s\033[m\n" "Changing default shell to zsh..."

# Check current shell
CURRENT_SHELL=$(dscl . -read /Users/"$USER" UserShell | awk '{print $2}')

if [ "$CURRENT_SHELL" = "/bin/zsh" ]; then
    echo "Shell is already set to /bin/zsh"
else
    # Use dscl to change shell (doesn't require password when run with sudo)
    sudo dscl . -change /Users/"$USER" UserShell "$CURRENT_SHELL" /bin/zsh
    echo "Shell changed from $CURRENT_SHELL to /bin/zsh"
fi


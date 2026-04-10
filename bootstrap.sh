#!/bin/sh

# Request administrator password upfront (only once)
printf "\033[33m%s\033[m\n" "Administrator password required (one-time input)"
sudo -v

# Keep sudo timestamp alive (update every 5 minutes in background)
while true; do sudo -n true; sleep 300; kill -0 "$$" || exit; done 2>/dev/null &
SUDO_PID=$!

# Set trap for cleanup
trap "kill $SUDO_PID 2>/dev/null" EXIT

sh macos.sh
sh tools.sh
sh link.sh
sh homebrew.sh
sh change_shell.sh


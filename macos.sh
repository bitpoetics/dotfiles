#!/bin/sh

printf "\033[33m%s\033[m\n" "Setting macOS preferences..."

# Close open System Settings panes, to prevent them from overriding settings.
osascript -e 'tell application "System Settings" to quit'

# Disable sound effects on boot
sudo nvram StartupMute=%01

# Global Preferences
defaults write .GlobalPreferences com.apple.scrollwheel.scaling -float 3.0

# Finder
defaults write com.apple.finder AppleShowAllFiles -bool true        # Show hidden files.
defaults write NSGlobalDomain AppleShowAllExtensions -bool true     # Show all file extensions.
defaults write com.apple.finder ShowPathbar -bool true              # Show path bar.
defaults write com.apple.finder FXPreferredViewStyle -string "clmv" # Show items in columns.

# Dock
defaults write com.apple.dock autohide -bool true

# Xcode
defaults write com.apple.dt.Xcode ShowBuildOperationDuration -bool true # Show build operation duration.

# iOS Simulator
defaults write com.apple.iphonesimulator ShowSingleTouches 1    # Show single touches.


#!/bin/sh

# Command Line Tools
if xcode-select -p &> /dev/null; then
    echo "Command Line Tools are installed"
else
    echo "Command Line Tools are not installed"
    printf '\033[33m%s\033[m\n' 'Installing Command Line Tools...'
    xcode-select --install
fi


#!/bin/bash
# https://stackoverflow.com/questions/394230/detect-the-os-from-a-bash-script
set -e

if [[ "$OSTYPE" == 'linux-gnu' ]]; then
    echo 'LINUX'
elif [[ "$OSTYPE" == 'darwin17' ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew bundle packages/mac/Brewfile
fi

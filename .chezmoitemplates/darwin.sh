#!/bin/bash

echo 'running macos setup...'
brew bundle --no-lock --file=/dev/stdin <<EOF
brew "git"
brew "neovim"
brew "eza"
cask "chromium" 
cask "firefox"
EOF

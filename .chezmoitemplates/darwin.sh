#!/bin/bash
brew bundle --no-lock --file=/dev/stdin <<EOF
brew "git"
brew "gh"
brew "neovim"
brew "eza"
brew "ripgrep"
brew "z"
cask "chromium"
cask "firefox"
EOF

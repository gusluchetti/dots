#!/bin/bash
brew bundle --no-lock --file=/dev/stdin <<EOF
brew "git"
brew "gh"
brew "neovim"
brew "eza"
brew "ripgrep"
brew "tree"
cask "chromium"
cask "firefox"
EOF

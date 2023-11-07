#!/bin/bash

echo 'running macos setup...'
brew bundle --no-lock --file=/dev/stdin <<EOF
brew "git neovim eza"
cask "chromium firefox"
EOF

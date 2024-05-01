#!/bin/bash

# big thanks to zMenta (https://github.com/zMenta) for the initial pkg list!
pkgs=(
  # core
  base-devel # dependency for most things
  net-tools # collecting of networking programs
  zsh # better than bash
  curl # when wget is not enough
  wget # when curl is not enough
  xclip # clipboard manager
  networkmanager # manages something?
  i3 # lean window manager
  rofi # app launcher
  man-db # online manual database
  pipewire # audio manager
  dunst # lightweight notification daemon
  vlc # video player
  ffmpeg # convert/stream media

  # fonts
  noto-fonts # An expansive font package
  noto-fonts-emoji # Emojis 
  noto-fonts-cjk # Font support for Chinese, Japanese and Korean characters

  # dev tools
  rustup # rust toolchain manager
  tmux # terminal multiplexer

  # neovim
  npm # node package manager
  lazygit # git inside neovim (for lazy people)
  fzf # fuzzy finder
  find # find things!
  ripgrep # grep but blazingly fast
  neovim # THE text editor

  # misc
  tldr # too long, didn't read man pages
  unzip # unzip files
  rofi-calc # rofi as calculator
  mpv # another useful media player
  alacritty # terminal emulator
  hledger # manage your finances
  hledger-iadd # interactively create hledger entries
  firefox-developer-edition # firefox dev edition
  flameshot # screenshot tool
  syncthing # continuous file synchronization (personal cloud)
)

# for value in "${pkgs[@]}"; do
#   printf "installing $value"
#   eval yay -S "$value" --noconfirm || sendError "Error on package install, exiting"
#   printf "done installing packages"
# done

printed=$(echo "${pkgs[@]}")
echo $printed

# yay -S $printed --noconfirm

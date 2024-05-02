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
  unzip # unzip files

  # dev tools
  rustup # rust toolchain manager
  tmux # terminal multiplexer

  # neovim
  npm # node package manager
  lazygit # git inside neovim (for lazy people)
  fzf # fuzzy finder
  findutils # find things!
  ripgrep # grep but blazingly fast
  neovim # THE text editor

  # misc
  eza # modern ls replacement
  tldr # too long, didn't read man pages
  rofi-calc # rofi as calculator
  mpv # another useful media player
  alacritty # terminal emulator
  firefox-developer-edition # firefox dev edition
  flameshot # screenshot tool
  syncthing # continuous file synchronization (personal cloud)
  rate-mirrors-bin # rating arch package mirrors

  # finances
  hledger # manage your finances
  hledger-ui # TUI for hledger
  hledger-web # web interface for hledger
  hledger-iadd # interactively create hledger entries
)

if ! [ -x "$(type -p yay)" ]; then
  # building yay from source
  pacman -S --needed git base-devel
  git clone https://aur.archlinux.org/yay.git 
  cd yay 
  makepkg -si
  cd .. && rm -rf yay/
fi

# installing all packages from list
yay -S --noconfirm $(echo "${pkgs[@]}") # install all packages

#!/bin/bash

pkgs=(
  # core/deps
  base-devel
  net-tools
  zsh
  curl
  wget
  man-db
  unzip
  ffmpeg

  # dev
  neovim
  lazygit
  tmux
  mise
  fzf
  eza
  findutils
  ripgrep
)

# Ask the user for the environment (server or desktop)
echo "Select the environment (server/desktop):"
read env

# If desktop, append desktop-specific packages
if [[ "$env" == "desktop" ]]; then
    pkgs+=(
	  i3
	  alacritty
	  networkmanager
	  pipewire # audio
	  vlc
    firefox
    flameshot
	  rofi # action launcher
	  dunst # notification daemon
	  udiskie # removable media automounter
    )
fi

if ! [ -x "$(type -p yay)" ]; then
  # building yay from source
  pacman -S --needed git base-devel
  git clone https://aur.archlinux.org/yay.git 
  cd yay 
  makepkg -si
  cd .. && rm -rf yay/
fi

yay -S --noconfirm "${pkgs[@]}"

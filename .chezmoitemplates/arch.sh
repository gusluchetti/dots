#!/bin/bash

pkgs=(
  # core/deps
  git
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
	  vlc
    firefox
    flameshot
	  pipewire # audio
	  rofi # action launcher
	  dunst # notification daemon
	  udiskie # removable media automounter
    )
fi

if ! [ -x "$(type -p yay)" ]; then
  # building yay from source
  sudo pacman -S --needed git base-devel
  git clone https://aur.archlinux.org/yay.git 
  cd yay 
  makepkg -si
  cd .. && rm -rf yay/
fi

if ! [ -x "$(type -p yay)" ]; then
  curl https://mise.run | MISE_INSTALL_PATH=~/.local/bin/mise sh
fi

yay -S --noconfirm "${pkgs[@]}"

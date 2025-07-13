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
  mpv

  # dev
  neovim
  lazygit
  tmux
  fzf
  eza
  findutils
  ripgrep
)

# ask the user for environment type (server or desktop)
echo "Select the environment (server/desktop):"
read env

# append desktop-specific packages (mostly GUI and others)
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

# setting up yay, using it from now on
if ! [ -x "$(type -p yay)" ]; then
  sudo pacman -S --needed git base-devel
  git clone https://aur.archlinux.org/yay.git 
  cd yay 
  makepkg -si
  cd .. && rm -rf yay/
  yay
fi

yay -S --noconfirm "${pkgs[@]}"

# changing shell to zsh
chsh -s /usr/bin/zsh
rm -rf ~/.bash*

if ! [ -x "$(type -p mise)" ]; then
  curl https://mise.run | MISE_INSTALL_PATH=~/.local/bin/mise sh
  mise install
fi

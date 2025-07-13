#!/bin/bash

echo "setting up arch..."
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
  ranger # file manager
  neomutt # email client
  newsboat # rss reader

  # dev
  neovim
  lazygit
  tmux
  fzf
  eza
  fastfetch
  findutils
  ripgrep
)

echo "select the environment (server/desktop):"
read env

echo "appending desktop-specific packages..."
if [[ "$env" == "desktop" ]]; then
    pkgs+=(
      i3
      alacritty
      networkmanager
      vlc
      firefox
      flameshot # screenshot manager, also on windows
      pipewire # audio
      rofi # action launcher
      dunst # notification daemon
      udiskie # removable media automounter
    )
fi

echo "setting up yay, using it from now on"
if ! [ -x "$(type -p yay)" ]; then
  sudo pacman -S --needed git base-devel
  git clone https://aur.archlinux.org/yay.git 
  cd yay 
  makepkg -si
  cd .. && rm -rf yay/
fi

echo "downloading all packages..."
yay -Syu --noconfirm "${pkgs[@]}"

echo "installing mise and installing projects it'll manage (node, go, etc.)"
if ! [ -x "$(type -p mise)" ]; then
  curl https://mise.run | MISE_INSTALL_PATH=~/.local/bin/mise sh
  mise install
fi

echo "changing shell to zsh..."
chsh -s /usr/bin/zsh
rm -rf ~/.bash*
zsh

#!/bin/bash
set -euo pipefail

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

  fastfetch

  # dev
  eza
  fzf
  ripgrep
  tmux
  findutils
  neovim
  lazygit
  mise

  # cool cli stuff
  ranger # file manager
  neomutt # email client
  newsboat # rss reader
)

setup_type="${1:-}"
if [[ -z "$setup_type" ]]; then
  echo "select the environment (server/desktop):"
  read -r setup_type
fi

if [[ "$setup_type" == "desktop" ]]; then
  echo "appending desktop-specific packages..."
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
  sudo pacman -S --noconfirm --needed git base-devel
  tmpdir=$(mktemp -d)
  git clone https://aur.archlinux.org/yay.git "$tmpdir/yay"
  (cd "$tmpdir/yay" && makepkg -si)
  rm -rf "$tmpdir"
fi

echo "downloading all packages..."
yay -Syu --noconfirm "${pkgs[@]}"

echo "changing shell to zsh..."
chsh -s "$(which zsh)"
rm -f ~/.bash_history ~/.bash_logout ~/.bash_profile ~/.bashrc

echo "done! open a new terminal for zsh. then run: chezmoi init --apply gusluchetti/dots --ssh"

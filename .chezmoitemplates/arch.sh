#!/bin/bash

pkgs=(
  # core
  base-devel # dependency for most things
  net-tools # collecting of networking programs
  zsh # better than bash
  curl # when wget is not enough
  wget # when curl is not enough
  xclip # clipboard manager
  man-db # online manual database
  ffmpeg # convert/stream media
  unzip # unzip files

  # dev
  neovim # THE text editor
  lazygit # git inside neovim (for lazy people)
  tmux # terminal multiplexer
  mise # manages envs, dev programs, etc.

  # misc
  fzf # fuzzy finder
  eza # modern ls replacement
  findutils # find things!
  ripgrep # grep but blazingly fast
  tldr # too long, didn't read man pages

  # finances
  hledger # manage your finances
  hledger-ui # TUI for hledger
  hledger-web # web interface for hledger
  hledger-iadd # interactively create hledger entries
)

# Ask the user for the environment (server or desktop)
echo "Select the environment (server/desktop):"
read env

# If desktop, append desktop-specific packages
if [[ "$env" == "desktop" ]]; then
    pkgs+=(
	  networkmanager # manages something?
	  i3 # lean window manager
	  rofi # app launcher
	  pipewire # audio manager
	  dunst # lightweight notification daemon
	  vlc # video player
	  firefox-developer-edition # firefox dev edition
	  flameshot # screenshot tool
	  mpv # another useful media player
	  alacritty # terminal emulator
	  rate-mirrors-bin # rating arch package mirrors
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

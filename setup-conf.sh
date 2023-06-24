#!/bin/bash

# SETUP INSTRUCTIONS 
## Programs to install
    sudo dnf install git curl wget xclip polybar picom alacritty dmenu libinput neofetch zsh neovim vlc mpv lame brightnessctl

## Enable extra repos
    sudo dnf config-manager --add-repo https://copr.fedorainfracloud.org/coprs/atim/lazygit/repo/fedora-38/atim-lazygit-fedora-38.repo
    sudo dnf config-manager --add-repo https://copr.fedorainfracloud.org/coprs/fz0x1/zola/repo/fedora-38/fz0x1-zola-fedora-38.repo

## ssh setup for git
    add ssh key to machine (ssh-keygen, eval ssh-agent, ssh-add, xclip copy sel key)

## chezmoi
    chezmoi setup ( sh -c "$(curl -fsLS get.chezmoi.io)" -- init gusluchetti/dots --ssh --apply )

## zsh
    set zsh as shell (sudo lchsh %USER, /usr/bin/zsh), 
    download and setup oh-my-zsh (sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)")
    for custom plugins/themes - (${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom/folder/thing_name})

## install nvm

## neovim installation
    get nvim config from chezmoi
    main languages should be setup already

## others
configure keyboard, qwerty + programmers dvorak
localectl --no-convert set-x11-keymap us,us intl,dvorak grp:alt_shift_toggle
libinput, enable touch on touchpad, /usr/share/X11/xorg.conf.d/...

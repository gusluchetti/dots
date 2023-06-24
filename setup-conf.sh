# !/bin/bash

## Enabling extra repos
    sudo dnf config-manager --add-repo https://copr.fedorainfracloud.org/coprs/atim/lazygit/repo/fedora-38/atim-lazygit-fedora-38.repo
    sudo dnf config-manager --add-repo https://copr.fedorainfracloud.org/coprs/fz0x1/zola/repo/fedora-38/fz0x1-zola-fedora-38.repo
    sudo dnf config-manager --save

## Installing essentials
    sudo dnf install git curl wget alacritty zsh neovim vlc dmenu neofetch polybar picom mpv lame brightnessctl lazygit zola

## Setting SSH key Git
    ssh-keygen -t ed25519 -C "gustavo@luchetti.dev"
    eval "$(ssh-agent -s)"
    ssh-add  ~/.ssh/id_ed25519
    cat ~/.ssh/id_ed25519.pub   

## Setting ZSH as default shell
    sudo lchsh $USER
    /usr/bin/zsh
    # chezmoi should be responsible for then configuring oh-my-zsh + plugins
    download and setup oh-my-zsh (sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)")
    for custom plugins/themes - (${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom/folder/thing_name})

## Downloading/applying chezmoi dot files
    (sh -c "$(curl -fsLS get.chezmoi.io)" -- init gusluchetti/dots --ssh --apply)

## Install NVM (Node Version Manager)
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
    # zsh should have nvm configuration already
    nvm install --lts
    nvm use --lts
    # Downloading NPM (Node Package Manager)
    npm install -g npm

## neovim installation
    get nvim config from chezmoi
    main languages should be setup already

## others
configure keyboard, qwerty + programmers dvorak
localectl --no-convert set-x11-keymap us,us intl,dvorak grp:alt_shift_toggle

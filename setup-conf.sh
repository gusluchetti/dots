# !/bin/bash
    echo "Hi! This is my own install script\n"
    echo -n "Please enter your preferred github email: "
    read email

## Enabling extra repos
    sudo dnf config-manager --add-repo https://copr.fedorainfracloud.org/coprs/atim/lazygit/repo/fedora-38/atim-lazygit-fedora-38.repo
    sudo dnf config-manager --add-repo https://copr.fedorainfracloud.org/coprs/fz0x1/zola/repo/fedora-38/fz0x1-zola-fedora-38.repo
    sudo dnf config-manager --save

## Installing essentials
    sudo dnf install -y git curl wget alacritty zsh neovim vlc rofi neofetch polybar picom mpv lame brightnessctl lazygit zola

## Setting SSH key for Git
    ssh-keygen -t ed25519 -C "$email"
    eval "$(ssh-agent -s)"
    ssh-add  ~/.ssh/id_ed25519
    cat ~/.ssh/id_ed25519.pub
    read -p "Press ENTER only after you've added your SSH key (https://github.com/settings/keys)"

## Setting ZSH as default shell
    chsh -s /usr/bin/zsh

## Downloading/applying chezmoi dot files
    # chezmoi should be responsible for then configuring most things, such as:
    # .config folder, zsh plugins, amongst other things
    (sh -c "$(curl -fsLS get.chezmoi.io)" -- init gusluchetti/dots --ssh --apply)

## Install NVM (Node Version Manager)
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
    # zsh should have nvm configuration already
    nvm install --lts
    nvm use --lts
    # Downloading NPM (Node Package Manager)
    npm install -g npm

# Configure keyboard, qwerty + programmers dvorak
    localectl --no-convert set-x11-keymap us,us intl,dvorak grp:alt_shift_toggle

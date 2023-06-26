# !/bin/bash
    echo "Hi! This is my install script\n"
    echo -n "Please enter your preferred github email: "
    read email

## 
echo "-- Enabling Extra Repos (RPM Fusion Releases,zola/lazygit @ COPR) --"
    sudo dnf config-manager --add-repo https://copr.fedorainfracloud.org/coprs/atim/lazygit/repo/fedora-38/atim-lazygit-fedora-38.repo
    sudo dnf config-manager --add-repo https://copr.fedorainfracloud.org/coprs/fz0x1/zola/repo/fedora-38/fz0x1-zola-fedora-38.repo
    sudo dnf config-manager --save

    sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
    sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "-- Installing Essentials --"
    sudo dnf install -y gcc clang git curl wget alacritty exa zsh neovim vlc rofi \
        neofetch polybar picom mpv lame lazygit zola discord zstd ripgrep

echo "-- Installing FiraMonoNerdFont --"
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraMono.zip -P "$PWD"
    sudo mkdir /usr/share/fonts/FiraMonoNerdFont
    sudo unzip FiraMono.zip -d /usr/share/fonts/FiraMonoNerdFont
    rm -rf FiraMono.zip

echo "-- Setting up SSH key for Github --"
    ssh-keygen -t ed25519 -C "$email"
    eval "$(ssh-agent -s)"
    ssh-add  ~/.ssh/id_ed25519
    cat ~/.ssh/id_ed25519.pub
    read -p "Press ENTER only after you've added your SSH key (https://github.com/settings/keys)"

echo "-- Setting ZSH as default shell --"
    chsh -s /usr/bin/zsh
    sudo chsh -s /usr/bin/zsh

echo "-- Installing Rust + extras --"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    # cargo binstall installation
    curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash
    cargo binstall cargo-watch rtx-cli
    echo 'eval "$(~/.cargo/bin/rtx activate zsh)"' >> ~/.zshrc

echo "-- Configure keyboard, qwerty + programmers dvorak --"
    localectl --no-convert set-x11-keymap us,us intl,dvorak grp:alt_shift_toggle

read -p "Base configuration done. Dot files will now be added to the system. Press any key to continue."

echo "-- Downloading/Applying chezmoi dot files --"
    # chezmoi should be responsible for then configuring most things, such as:
    # .config folder, zsh plugins, amongst other things
    (sh -c "$(curl -fsLS get.chezmoi.io)" -- init gusluchetti/dots --ssh --apply)

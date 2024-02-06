# !/bin/bash
sudo apt update && sudo apt upgrade
sudo apt install zsh git

echo "\n'.chezmoiexternal' installs oh-my-zsh and asdf"
(
chsh -s $(which zsh) # change shell

sudo apt install build-essentials net-tools git
sudo apt install gh curl wget unzip gcc cmake
sudo apt install ffmpeg neofetch

if gh auth status | grep -q "Logged in"; then
    echo "already logged on Github CLI"
else
    echo "logging in Github CLI"
    gh auth login # interactive
fi

echo "\nsetting up asdf rust"
# rust + cargo programs
asdf plugin add rust https://github.com/asdf-community/asdf-rust.git
asdf install rust latest
asdf global rust latest
cargo install --locked starship zoxide

echo "\nsetting up asdf node.js"
# node.js
sudo apt install dirmngr gpg curl gawk
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest

echo "\ninstalling lazygit"
# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm -rf lazygit lazygit.tar.gz

echo "\ninstalling bun"
# bun
curl -fsSL https://bun.sh/install | bash

source ~/.zshrc
)

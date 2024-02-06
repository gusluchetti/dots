# !/bin/bash
sudo apt update && sudo apt upgrade
sudo apt install zsh git

echo "'.chezmoiexternal' installs oh-my-zsh and asdf"
(
chsh -s $(which zsh) # change shell

sudo apt install build-essentials net-tools git
sudo apt install gh curl wget unzip gcc clang
sudo apt install ffmpeg neofetch

gh auth login # setup git with ssh

# rust + cargo programs
asdf plugin add rust https://github.com/asdf-community/asdf-rust.git
asdf install rust latest
asdf global rust latest
cargo install --locked starship zoxide

# node.js
sudo apt install dirmngr gpg curl gawk
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest

# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm -rf lazygit lazygit.tar.gz

# bun
curl -fsSL https://bun.sh/install | bash

source ~/.zshrc
)

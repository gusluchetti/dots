sudo apt update && sudo apt upgrade
sudo apt install git gh curl wget unzip gcc clang
sudo apt install zsh ffmpeg neofetch
zsh

gh auth login # setup git with ssh

# change shell
chsh -s $(which zsh)

# install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh # install rustup
cargo install --locked starship zoxide


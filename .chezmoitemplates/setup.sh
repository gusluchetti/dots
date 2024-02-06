sudo apt update && sudo apt upgrade
sudo apt install git curl wget unzip 7z
sudo apt install ffmpeg zsh gh neofetch gcc clang

gh auth login # setup git with ssh

# change shell
chsh -s $(which zsh)

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh # install rustup
cargo install --locked starship zoxide

# install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

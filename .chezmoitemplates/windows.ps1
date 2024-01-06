echo "`n Installing essentials programs through WinGet..."
winget install -e Microsoft.PowerShell --source winget
winget install -e Microsoft.Office --source winget
winget install -e Microsoft.VisualStudio.2022.BuildTools --source winget
winget install -e Microsoft.PowerToys --source winget && echo "`n Don't forget to select Desktop C++ Development!"
winget install -e Valve.Steam --source winget
winget install -e Discord.Discord --source winget
winget install -e iCloud --source msstore # no way to avoid this :(

$ErrorActionPreference = 'Continue'
echo "`nInstalling Scoop Package Manager..."
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod get.scoop.sh | Invoke-Expression

echo "`nSetting up clean Scoop installation + main dependencies"
scoop uninstall *
scoop install sudo
sudo scoop install aria2 -g
scoop config aria2-warning-enabled false
scoop install git dark

echo "`nAdding 'extras' and 'versions' buckets..."
scoop bucket add extras
scoop bucket add versions
scoop bucket add games

echo "`nInstalling essentials..."
sudo scoop install 7zip vlc gh firefox chromium spotify -g
scoop install obsidian neovim anki
scoop install foobar2000 -a 32bit && scoop install foobar2000-encoders

# echo "`nInstalling qBitTorrent 4.5.2 (latest version whitelisted by bakabt.me)..."
# scoop install qbittorrent@4.5.2

echo "`nInstalling extras..."
scoop install teamspeak3 logitech-omm obs-studio flameshot gimp
scoop install wiztree wizfile revouninstaller handbrake-cli mkvtoolnix

echo "`nInstalling global extras..."
sudo scoop install ddu msiafterburner msikombustor rtss furmark -g
sudo scoop install librehardwaremonitor -g

echo "`nInstalling gaming related programs..."
scoop install autoclicker osulazer ferium yuzu

echo "`nInstalling development things..."
sudo scoop install touch curl ripgrep sd less fd -g 
scoop install neofetch gcc nodejs pnpm zola lazygit
scoop install pyenv@2.64.11 && scoop hold pyenv # python being finicky as usual
scoop install pandoc miktex

# for later, ruby version manager setup for ruby for asciidoctor :O
# curl -sSL https://get.rvm.io | bash -s stable --rails

echo "`nRust adjacent installations..."
scoop install rustup && rustup
cargo install cargo-binstall
cargo binstall watchexec-cli

echo "`nInstalling nerd fonts (FiraCode)"
scoop bucket add nerd-fonts
sudo scoop install FiraCode-NF-Mono CascadiaCode-NF-Mono -g 

echo "`nA restart is necessary to apply changes made by global apps..." 
$confirmation = Read-Host "Do you want to restart now?"
if ($confirmation -eq 'y') {
    Restart-Computer
}

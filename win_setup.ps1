echo "`n Installing essentials programs through WinGet..."
winget install -e Microsoft.PowerShell --source winget
winget install -e Microsoft.WindowsTerminal --source winget
winget install -e Microsoft.Office --source winget
winget install -e Microsoft.VisualStudio.2022.BuildTools --source winget
winget install -e Microsoft.PowerToys --source winget
echo "`n Select Desktop C++ Development!"

winget install -e Github.cli --source winget
winget install -e Valve.Steam --source winget
winget install -e Discord.Discord --source winget

winget install -e iCloud --source msstore # icloud from the msstore :(

Read-Host "Initial setup complete! If you'd like, quit this setup and go to Windows Terminal to proceed..."

$ErrorActionPreference = 'Continue'
echo "`nInstalling Scoop Package Manager..."
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod get.scoop.sh | Invoke-Expression

echo "`nSetting up clean Scoop installation..."
scoop uninstall *
scoop install sudo
sudo scoop install aria2 -g
scoop config aria2-warning-enabled false

scoop alias rm full-upgrade
scoop alias add full-upgrade 'scoop update && scoop update * -g && scoop cleanup * -g' '(sudo required) Globally updates scoop, all apps and cleans up old versions'

echo "`nInstalling Powershell Modules..."
sudo Install-Module -Name z

echo "`nInstalling git and dark (essential dependencies)..."
scoop install git dark
echo "`nAdding 'extras' and 'versions' buckets..."
scoop bucket add extras
scoop bucket add versions
scoop bucket add games

echo "`nInstalling essentials..."
sudo scoop install 7zip vlc gh googlechrome firefox spotify -g
scoop install obsidian neovim anki
scoop install foobar2000 -a 32bit && scoop install foobar2000-encoders

echo "`nInstalling qBitTorrent 4.5.2 (latest version whitelisted by bakabt.me)..."
scoop install qbittorrent@4.5.2
echo "`nInstalling extras..."
scoop install teamspeak3 logitech-omm obs-studio gimp franz flameshot vscode
scoop install wiztree wizfile revouninstaller handbrake-cli ventoy

echo "`nInstalling global extras..."
sudo scoop install ddu msiafterburner msikombustor rtss furmark -g
sudo scoop install librehardwaremonitor -g

echo "`nInstalling gaming related programs..."
sudo scoop install osulazer ferium -g
scoop install autoclicker yuzu betterjoy

echo "`nInstalling development things..."
sudo scoop install touch curl ripgrep sd less -g 
scoop install neofetch gcc rustup nodejs pnpm oh-my-posh zola
scoop install pyenv@2.64.11 && scoop hold pyenv # python being finicky as usual

echo "`nInstalling Rust/Cargo programs..."
cargo install cargo-binstall
cargo binstall speedtest-rs wiki-tui

echo "`nInstalling nerd fonts (FiraCode)"
scoop bucket add nerd-fonts
sudo scoop install FiraCode-NF-Mono CascadiaCode-NF-Mono -g 

echo "`nA restart is necessary to apply some changes made by global apps..." 
echo "`nRestarting in 2 seconds..." 
Start-Sleep -Seconds 2.0
Restart-Computer

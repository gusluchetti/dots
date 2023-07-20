echo "`n Installing mainstay programs through WinGet..."
winget install -e Microsoft.PowerShell --source winget
winget install -e Microsoft.WindowsTerminal --source winget
winget install -e Microsoft.Office --source winget
winget install -e Github.cli --source winget

echo "`nInstalling other programs ..."
winget install -e iCloud --source msstore # icloud from the msstore :(
winget install -e --id Valve.Steam

Read-Host "Initial setup complete! If you'd like, quit this setup and go to Windows Terminal to proceed..."

echo "`nInstalling Scoop Package Manager..."
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex

echo "`nSetting up Scoop..."
scoop uninstall *
scoop install sudo
sudo scoop install aria2 --global
scoop config aria2-warning-enabled false
scoop alias rm upgrade
scoop alias add upgrade 'scoop update *' 'Updates all apps, just like brew or apt'

echo "`nInstalling git and dark..."
scoop install git dark
echo "`nAdding 'extras' and 'versions' buckets..."
scoop bucket add extras
scoop bucket add versions
scoop bucket add games

echo "`nInstalling requirements..."
sudo scoop install dotnet-sdk dotnet-sdk-lts vcredist2008 vcredist2022 powertoys --global

echo "`nInstalling essentials..."
sudo scoop install 7zip vlc --global
scoop install gh googlechrome armcord obsidian neovim foobar2000 spotify anki

echo "`nInstalling qBitTorrent 4.5.2 (latest version whitelisted by bakabt.me)..."
scoop install qbittorrent@4.5.2
echo "`nInstalling extras..."
scoop install firefox teamspeak3 logitech-omm obs-studio gimp franz flameshot
scoop install tinynvidiaupdatechecker wiztree wizfile revouninstaller vscodium
scoop install bottom handbrake-cli ventoy moderndeck

echo "`nInstalling global extras..."
sudo scoop install ddu msiafterburner msikombustor rtss librehardwaremonitor furmark --global

echo "`nInstalling gaming related programs..."
sudo scoop install osulazer ferium --global
scoop install yuzu betterjoy autoclicker archisteamfarm steamcmd

echo "`nInstalling development things..."
sudo scoop install touch curl ripgrep sd less --global
scoop install neofetch gcc rustup nodejs pnpm curlie oh-my-posh docker docker-compose
scoop install lazydocker lazygit

echo "`nInstalling nerd fonts (FiraCode)"
scoop bucket add nerd-fonts
sudo scoop install FiraCode-NF-Mono CascadiaCode-NF-Mono --global

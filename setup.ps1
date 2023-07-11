# setup exclusive for windows machines
echo "Hi! Starting setup..."
echo "`nInstalling Microsoft Essentials..."
winget install -eh Microsoft.PowerShell
winget install -eh Microsoft.PowerToys
winget install -eh Microsoft.WindowsTerminal
winget install -eh Microsoft.Office
echo "`nInstalling Steam..."
winget install Valve.Steam -h
echo "`nInstalling qBittorrent (v4.5.2)..."
$version= Read-Host "Please input latest whitelisted bakabt.me version, i.e 4.5.2"
winget install qBittorrent.qBittorrent -v $version

Read-Host "Initial setup complete! If you'd like, quit this setup and go to Windows Terminal to proceed..."

echo "`nSet Execution Policy to RemoteSigned"
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
echo "`nInstalling Scoop Package Manager..."
irm get.scoop.sh | iex

echo "`nSetting up Scoop..."
scoop install sudo
sudo scoop install aria2 --global
scoop config aria2-warning-enabled false
scoop alias add upgrade 'scoop update *' 'Updates all apps, just like brew or apt'

echo "`nAdding 'extras' and 'versions' buckets..."
scoop bucket add extras
scoop bucket add versions

echo "`nInstalling Dependencies..."
sudo winget install Microsoft.DotNet.DesktopRuntime.7 --architecture x86
echo "`nInstalling Essentials..."
sudo scoop install git github 7zip vlc-nightly googlechrome firefox discord --global
scoop install teamspeak3 obsidian notion spotify-tui neovim foobar2000 anki
echo "`nInstalling Extras..."
scoop install logitech-omm tinynvidiaupdatechecker obs-studio vscodium
echo "`nInstalling development things..."
scoop install touch curl ripgrep sd gcc rustup nodejs pnpm less neofetch
scoop install docker docker-compose lazydocker lazygit

echo "`nInstalling FiraCode (NerdFont)"
scoop bucket add nerd-fonts
sudo scoop install FiraCode FiraCode-NF FiraCode-NF-Mono

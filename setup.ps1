# setup exclusive for windows machines
echo "Hi! Starting setup..."
echo "`nInstalling Microsoft Essentials..."
winget install -e Microsoft.PowerShell
winget install -e Microsoft.PowerToys
winget install -e Microsoft.WindowsTerminal
winget install -e Microsoft.Office

echo "`nInstalling iCloud (Microsoft Store)..."
winget install iCloud --id 9PKTQ5699M62
echo "`nInstalling Steam..."
winget install -e Valve.Steam
echo "`nInstalling qBittorrent (v4.5.2)..."
$version= Read-Host "Please input latest whitelisted bakabt.me version, i.e 4.5.2"
winget install -e -v $version -l "D:\Programs\qBittorrent" qBittorrent.qBittorrent

Read-Host "Initial setup complete! If you'd like, quit this setup and go to Windows Terminal to proceed..."

echo "`nInstalling Scoop Package Manager..."
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh -outfile 'install.ps1'
.\install.ps1 -ScoopDir '~\Scoop' -ScoopGlobalDir 'C:\Scoop' -NoProxy

echo "`nSetting up Scoop..."
scoop install sudo
sudo scoop install aria2 --global
scoop config aria2-warning-enabled false
scoop alias add upgrade 'scoop update *' 'Updates all apps, just like brew or apt'

echo "`nAdding 'extras' and 'versions' buckets..."
scoop bucket add extras
scoop bucket add versions
scoop bucket add games

sudo winget install Microsoft.DotNet.DesktopRuntime.7 --architecture x86
echo "`nInstalling essentials..."
sudo scoop install git 7zip vlc --global
scoop install chromium github discord notion spotify-tui neovim foobar2000 anki
echo "`nInstalling extras..."
scoop install googlechrome firefox obsidian teamspeak3 obs-studio vscodium gimp franz
scoop install logitech-omm tinynvidiaupdatechecker 1password-cli handbrake-cli
scoop install windirstat librehardwaremonitor bottom rufus flameshot msiafterburner
echo "`nInstalling gaming related programs..."
sudo scoop install osulazer ferium --global
scoop install yuzu betterjoy vibrance-gui autoclicker archisteamfarm steamcmd
echo "`nInstalling development things..."
scoop install touch curl ripgrep sd gcc rustup nodejs pnpm less neofetch
scoop install docker docker-compose lazydocker lazygit

echo "`nInstalling nerd font (FiraCode)"
scoop bucket add nerd-fonts
sudo scoop install FiraCode FiraCode-NF FiraCode-NF-Mono --global

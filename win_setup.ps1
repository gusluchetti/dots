# setup exclusive for windows machines
echo "Hi! Starting setup..."
echo "`n Installing WinGet Programs..."
winget install -e Microsoft.PowerShell
winget install -e Microsoft.PowerToys
winget install -e Microsoft.WindowsTerminal
winget install -e Microsoft.Office
winget install -e Microsoft.DotNet.DesktopRuntime.7 --architecture x86

echo "`nInstalling programs that don't mesh with Scoop..."
winget install iCloud --id 9PKTQ5699M62
winget install -e Valve.Steam

Read-Host "Initial setup complete! If you'd like, quit this setup and go to Windows Terminal to proceed..."

echo "`nInstalling Scoop Package Manager..."
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex

echo "`nSetting up Scoop..."
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

echo "`nInstalling essentials..."
sudo scoop install 7zip vlc --global
scoop install googlechrome github armcord obsidian spotify neovim foobar2000 anki

echo "`nInstalling requirements..."
sudo scoop install vcredist2008 vcredist2022 --global
echo "`nInstalling extras..."
scoop install firefox teamspeak3 logitech-omm obs-studio vscodium gimp franz ventoy
scoop install tinynvidiaupdatechecker wiztree wizfile qbittorrent@4.5.2 revouninstaller
scoop install flameshot bottom handbrake-cli
echo "`nInstalling global extras..."
sudo scoop install ddu msiafterburner msikombustor rtss librehardwaremonitor furmark --global

echo "`nInstalling gaming related programs..."
sudo scoop install osulazer ferium --global
scoop install yuzu betterjoy autoclicker archisteamfarm steamcmd

echo "`nInstalling development things..."
sudo scoop install touch curl ripgrep sd less --global
scoop install neofetch gcc rustup nodejs pnpm postman
scoop install docker docker-compose lazydocker lazygit

echo "`nInstalling nerd font (FiraCode)"
scoop bucket add nerd-fonts
sudo scoop install FiraCode FiraCode-NF FiraCode-NF-Mono --global

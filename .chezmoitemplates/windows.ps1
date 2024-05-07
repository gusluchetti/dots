# sudo for windows
winget install gerardog.gsudo --force

# microsoft things
sudo winget install --id --silent --accept-package-agreements --accept-source-agreements `
--disable-interactivity --verbose Microsoft.PowerShell Microsoft.Office `
Microsoft.PowerToys Microsoft.VisualStudio.2022.BuildTools Microsoft.Teams `
Microsoft.OpenSSH.Beta 

# main
sudo winget install --id --silent --accept-package-agreements --accept-source-agreements `
--disable-interactivity --verbose Git.Git GitHub.cli Neovim.Neovim SyncTrayzor.SyncTrayzor 7zip.7zip `
VideoLAN.VLC Anki.Anki Klocman.BulkCrapUninstaller MoritzBunkus.MKVToolNix `
AntibodySoftware.WizTree AntibodySoftware.WizFile HandBrake.HandBrake.CLI `
Obsidian.Obsidian Wagnardsoft.DisplayDriverUninstaller OBSProject.OBSStudio `
Guru3D.Afterburner Guru3D.RTSS OPAutoClicker.OPAutoClicker Logitech.OnboardMemoryManager

# gaming and others
sudo winget install --id --silent --accept-package-agreements --accept-source-agreements `
--disable-interactivity --verbose Valve.Steam Discord.Discord FACEITLTD.FACEITAC Peppy.Osu! `
TeamSpeakSystems.TeamSpeakClient.Beta WhatsApp.WhatsApp.Beta Mozilla.Firefox.DeveloperEdition `
Amazon.Kindle PeterPawlowski.foobar2000 PeterPawlowski.foobar2000.EncoderPack

echo "`nA restart is necessary finish installation..." 
$confirmation = Read-Host "Do you want to restart now? (y/n)"
if ($confirmation -eq 'y') {
    Restart-Computer
}

# microsoft things
winget install --silent --accept-package-agreements --accept-source-agreements `
--uninstall-previous --verbose `
Microsoft.PowerShell Microsoft.Office Microsoft.PowerToys `
Microsoft.VisualStudio.2022.BuildTools Microsoft.Teams Microsoft.OpenSSH.Beta `
# main
gerardog.gsudo Git.Git GitHub.cli Neovim.Neovim SyncTrayzor.SyncTrayzor 7zip.7zip `
VideoLAN.VLC Anki.Anki Klocman.BulkCrapUninstaller MoritzBunkus.MKVToolNix `
AntibodySoftware.WizTree AntibodySoftware.WizFile HandBrake.HandBrake.CLI `
Obsidian.Obsidian Wagnardsoft.DisplayDriverUninstaller OBSProject.OBSStudio `
Guru3D.Afterburner Guru3D.RTSS OPAutoClicker.OPAutoClicker Logitech.OnboardMemoryManager
# gaming
Valve.Steam Discord.Discord FACEITLTD.FACEITAC `
TeamSpeakSystems.TeamSpeakClient.Beta Peppy.Osu!`
# misc
WhatsApp.WhatsApp.Beta Mozilla.Firefox.DeveloperEdition Amazon.Kindle`
PeterPawlowski.foobar2000 PeterPawlowski.foobar2000.EncoderPack

echo "`nA restart is necessary finish installation..." 
$confirmation = Read-Host "Do you want to restart now? (y/n)"
if ($confirmation -eq 'y') {
    Restart-Computer
}

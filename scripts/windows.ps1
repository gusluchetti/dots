# microsoft things
winget install --silent --accept-package-agreements --accept-source-agreements `
--disable-interactivity Microsoft.PowerShell Microsoft.Office `
Microsoft.PowerToys Microsoft.VisualStudio.2022.BuildTools Microsoft.Teams `
Microsoft.OpenSSH.Beta

# main
winget install --silent --accept-package-agreements --accept-source-agreements `
--disable-interactivity gerardog.gsudo aria2.aria2 Git.Git GitHub.cli `
Neovim.Neovim SyncTrayzor.SyncTrayzor 7zip.7zip VideoLAN.VLC Anki.Anki `
Klocman.BulkCrapUninstaller MoritzBunkus.MKVToolNix AntibodySoftware.WizTree `
AntibodySoftware.WizFile HandBrake.HandBrake.CLI Obsidian.Obsidian `
Wagnardsoft.DisplayDriverUninstaller OBSProject.OBSStudio Guru3D.Afterburner `
Guru3D.RTSS OPAutoClicker.OPAutoClicker Logitech.OnboardMemoryManager `
IrfanSkiljan.IrfanView

# gaming and others
winget install --silent --accept-package-agreements --accept-source-agreements `
--disable-interactivity Valve.Steam Discord.Discord FACEITLTD.FACEITAC Peppy.Osu! `
TeamSpeakSystems.TeamSpeakClient.Beta WhatsApp.WhatsApp.Beta `
Mozilla.Firefox.DeveloperEdition Amazon.Kindle PeterPawlowski.foobar2000 `
PeterPawlowski.foobar2000.EncoderPack

echo "`nWindows app installation complete. A restart may be needed."

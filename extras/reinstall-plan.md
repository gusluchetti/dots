# Windows Format Walkthrough

## 0. Pre-Flight (old system)

1. Finalize `H:\Archive\` (GameSaves, Documents, Photos & Projects, Music)
2. Zip WSL home → `H:\Archive\wsl\temakii-home.zip` (`.ssh`, `.gnupg`, `.cloudflared`, `backups/`, `extras/`, claude credentials)
3. `wsl -l -v` → export or delete the unknown 38GB distro on C:
4. Export browser localStorage saves → `H:\Archive\GameSaves\browser\`
5. Copy game saves/configs → `H:\Archive\GameSaves\` (Feral Paw, Witcher 3, EA, My Games, Saved Games, OBS, DBeaver, osu!)
6. `winget list > H:\Archive\apps-snapshot.txt`
7. Settings → Activation → confirm digital license linked to MS account
8. F: USB: Win11 25H2 ISO, latest X870E-P BIOS, MSI drivers

## 1. Bootable USB (Rufus)

1. Select ISO + USB → GPT, NTFS
2. Customization dialog: local account, skip online account, disable BitLocker auto-encryption
3. Start

## 2. Hardware Swap + BIOS

1. Disconnect every drive except the C: SSD
2. Assemble → BIOS (DEL) → M-Flash latest BIOS from USB
3. First boot = memory training; minutes of black screen is normal
4. Enable EXPO, set USB first in boot order

## 3. Install Windows

1. Boot from USB
2. Delete all partitions on the (only) disk → select unallocated → continue
3. Finish OOBE offline with local account

## 4. Post-Install Core

1. Sign in to MS account → Activation → Troubleshooter → "I changed hardware on this device recently"
2. MSI drivers from F: (chipset → LAN/WiFi), then NVIDIA driver
3. Power off → reconnect D: / E: / H:
4. Disk Management → reassign letters D, E, H
5. Format D: as Dev Drive (Settings → System → Storage → Disks & volumes)
6. Pagefile on C: only
7. CTT WinUtil pass: `irm christitus.com/win | iex`

## 5. Arch WSL → D:

```powershell
wsl --install -d Arch
wsl --manage Arch --move D:\wsl\arch
```

```bash
passwd
echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel
useradd -m -G wheel -s /bin/bash temakii
passwd temakii
tee /etc/wsl.conf <<'EOF'
[user]
default = temakii
EOF
```

`wsl --shutdown`, reopen.

## 6. Restore Archive → WSL

```bash
cd ~ && unzip /mnt/h/Archive/wsl/temakii-home.zip
chmod 700 ~/.ssh ~/.gnupg
chmod 600 ~/.ssh/id_ed25519 ~/.ssh/donguri ~/.ssh/config
chmod 644 ~/.ssh/*.pub
mkdir -p ~/.claude && mv ~/claude-credentials.json ~/.claude/.credentials.json
```

## 7. Bootstrap

```bash
sudo pacman -Syu curl git openssh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply gusluchetti/dots --ssh
```

Runs: `arch.sh server` → `windows.ps1` (winget, longest) → configs → Startup shortcuts → `mise install` → verify. Restart when prompted, then `chezmoi apply` once more.

## 8. Windows Restores

1. Steam → add existing library `E:\SteamLibrary`
2. Game saves/configs from `H:\Archive\GameSaves\` → Documents / LocalLow / Roaming / Saved Games
3. Syncthing: `H:\Archive` → homeserver, send-only

## 9. First Launch

1. `zsh` → zinit pulls plugins
2. `nvim` → lazy.nvim + Mason auto-install
3. `ssh -T git@github.com`

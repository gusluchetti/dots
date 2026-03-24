# Windows Reinstall Walkthrough

## 1. Create Bootable USB (Rufus)

1. Open Rufus, select ISO + USB drive
2. Partition: **GPT** | File system: **NTFS**
3. Check **all** bypass options in the "Windows User Experience" dialog
4. Start → wait
5. Copy `extras/autounattend.xml` (from this repo) to the **root of the USB drive**

## 2. Format C: & Install

1. Reboot → BIOS (usually DEL or F2) → set USB as first boot device
2. Boot from USB
3. **Delete ALL partitions on C:** — do not touch D:!
4. Select unallocated space on C:, continue
5. Create a **local account** when prompted — rest is automated

## 3. Post-Install (fresh Windows)

**Activate Windows** — open PowerShell as admin:
```powershell
irm https://get.activated.win | iex
```
→ Select **HWID** (permanent).

**Install Arch WSL** — open PowerShell as admin:
```powershell
wsl --install -d Arch
```

In the Arch terminal, set up the user:
```bash
passwd
echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel
useradd -m -G wheel -s /bin/bash temakii
passwd temakii
```

Set default user:
```bash
sudo tee /etc/wsl.conf <<'EOF'
[user]
default = temakii
EOF
```

Restart WSL: `wsl --shutdown` then reopen.

## 4. Restore Backups → WSL

Open Arch WSL as `temakii`:
```bash
cp -r /mnt/d/Backups/wsl-backup/ssh ~/.ssh
chmod 700 ~/.ssh && chmod 600 ~/.ssh/id_ed25519 ~/.ssh/donguri

cp -r /mnt/d/Backups/wsl-backup/gnupg ~/.gnupg && chmod 700 ~/.gnupg

mkdir -p ~/.cloudflared && cp /mnt/d/Backups/wsl-backup/cloudflared/* ~/.cloudflared/
cp -r /mnt/d/Backups/wsl-backup/backups ~/backups
cp -r /mnt/d/Backups/wsl-backup/extras ~/extras
mkdir -p ~/.claude && cp /mnt/d/Backups/wsl-backup/claude-credentials.json ~/.claude/.credentials.json
```

## 5. Bootstrap (one command)

```bash
sudo pacman -Syu curl git
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply gusluchetti/dots --ssh
```

This automatically runs (in order):
1. `arch.sh server` — installs all packages, yay, sets up zsh
2. `windows.ps1` — installs ~30 Windows apps via winget (Steam, Discord, OBS, etc.)
3. Deploys all configs (nvim, tmux, ranger, newsboat, mise, zsh, etc.)
4. Sets up Windows Startup shortcuts (OBS replay buffer, vibranceGUI, TinyNvidiaUpdateChecker)
5. `mise install` — installs node, bun, go, rust, uv
6. Verification checklist

**Note:** The winget step (step 2) takes the longest. A restart prompt at the end is expected.

After restart, open WSL and run `chezmoi apply` once more to finish.

## 6. First Launch

- Open `zsh` → zinit downloads plugins automatically
- Open `nvim` → lazy.nvim downloads plugins + Mason installs LSPs automatically

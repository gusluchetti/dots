# dots
My dotfiles, managed using [chezmoi](https://www.chezmoi.io/).

Covers zsh, nvim, tmux, ranger, newsboat, mise, and Windows-side tooling (winget apps, startup shortcuts) for an Arch WSL setup.

## Bootstrap

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply gusluchetti/dots --ssh
```

`--ssh` is optional but I usually have SSH configured before running chezmoi.

For a full reinstall walkthrough (fresh Windows → working WSL), see [`extras/reinstall-plan.md`](extras/reinstall-plan.md).

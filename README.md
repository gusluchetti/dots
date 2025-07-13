# dots
My dotfiles, managed using [chezmoi](https://www.chezmoi.io/).  

`sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply gusluchetti/dots --ssh`  

downloads chezmoi passing the 'init' command, while applying the configuration defined here.  
`--ssh` flag is optional, but I usually have SSH configured before chezmoi.

# TODO:
- fix nvim config: swpa neo-tree.nvim for something else(?) preferrably that doesn't use nerd icons
## for later:
- configure ranger, cli file manager
- configure neomutt, email cli
- configure newsboat

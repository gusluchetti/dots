# dots
My dotfiles, managed using [chezmoi](https://www.chezmoi.io/).  

`sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply gusluchetti/dots --ssh`  

downloads chezmoi passing the 'init' command, while applying the configuration defined here.  
`--ssh` flag is optional, but I usually have SSH configured before chezmoi.

# TODO:
## EVERYTHING SHOULD BE DONE INSIDE THE 'arch.sh' FILE!!! don't forget
- fix nvim config: re-do using newer kickstart.nvim, remove nerd icons from nvimtree, etc.
- cleanup zshrc: check if zinit is ok, make sure only necessary plugins are working
- re-do arch.sh run; cleanup programs, only add when/if necessary, with explanations, if possible
- configure mise with node, bun, rust, go, uv (python), ubi
## additions:
- configure ranger, cli file manager
- configure neomutt, email cli
- configure newsboat

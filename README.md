# dots
My dotfiles, mostly managed using [chezmoi](https://www.chezmoi.io/).  

`sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply gusluchetti/dots --ssh`  

downloads chezmoi passing the 'init' command, while applying the configuration defined in this repository.  
`--ssh` flag is optional, but I usually have SSH configured before chezmoi.

---

TODO:
- cross-platform compatibility (working through multiple linux distros)
- better 'plug and play' behavior

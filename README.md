# dots
My dotfiles, mostly managed using [chezmoi](https://www.chezmoi.io/).  

run `sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply gusluchetti/dots --ssh` to setup.
`--ssh` flag is optional, but i usually configure ssh keys before running chezmoi.

---

Besides chezmoi, I'm working on a bash script that installs the packages I use the most.
As of now, it's setup for arch, but I might look into an Ansible solution at some point for more flexibility.

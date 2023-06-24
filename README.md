# dots
My dotfiles, managed using [Chezmoi](https://www.chezmoi.io/).
Should work fantastic with Fedora 38, not sure how so with other distros/Windows.

---

Observations for Windows users:
- Install gcc and/or clang through MSYS2, and don't forget to add it to your path.

Also, my options.lua file includes a reference to the %HOME directory 
(-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"), so comment that out.

Observations for me!
- xrandr --output DP-3 --rate 239.96 --output HDMI-1 --off, might have to change outputs.

# dots
My dotfiles, managed using [https://www.chezmoi.io/](Chezmoi).
Trying to make this as OS-independent as possible! Not as easy as I thought it'd be.

---

Observations for Windows users:
Install gcc and/or clang through MSYS2, and don't forget to add it to your path.
Also, my options.lua file includes a reference to the %HOME directory 
(-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"), so comment that out.

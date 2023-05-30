require("core")

vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

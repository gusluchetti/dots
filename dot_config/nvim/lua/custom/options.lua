-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

vim.opt.title = true

-- Search options
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Make (relative) line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Tab (as 4 spaces) global options
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Enable mouse mode
vim.opt.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.wrap = true;
vim.opt.textwidth = 84;
vim.opt.colorcolumn = "+1"

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true

vim.opt.signcolumn = 'yes'
vim.opt.scrolloff = 8

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noselect'

-- visuals
-- NOTE: You should make sure your terminal supports this
vim.opt.termguicolors = true

vim.opt.cursorline = true
vim.opt.winblend = 0
vim.opt.wildoptions = "pum"
vim.opt.pumblend = 5
vim.opt.background = "dark"

-- do not search into node_modules
vim.opt.wildignore:append { '*/node_modules/*' }
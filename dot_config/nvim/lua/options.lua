vim.opt.guicursor = ""
vim.opt.title = true

-- Search options
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Make (relative) line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Tab (as 2 spaces) global options
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.mouse = 'a'               -- enable mouse on all modes
vim.opt.clipboard = 'unnamedplus' -- sync OS and nvim clipboard

vim.opt.textwidth = 99
vim.opt.colorcolumn = "+1"
vim.opt.wrap = false
vim.opt.linebreak = false
vim.opt.formatoptions = "tcqj"
vim.opt.autoindent = true
vim.opt.breakindent = true

-- Save undo history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.undodir"
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true

vim.opt.signcolumn = 'yes'
vim.opt.scrolloff = 8

-- Decrease update time
vim.opt.updatetime = 100
vim.opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noselect'

vim.opt.termguicolors = true
vim.opt.cursorline = false
vim.opt.winblend = 0
vim.opt.wildoptions = "pum"
vim.opt.pumblend = 5
vim.opt.background = "dark"

-- do not search into node_modules
vim.opt.wildignore:append { '*/node_modules/*' }

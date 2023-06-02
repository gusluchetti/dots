local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- plugins definitions
local plugins = {
	{"ellisonleao/gruvbox.nvim",
		priority = 1000},
    {"norcalli/nvim-colorizer.lua"},
	{"nvim-telescope/telescope.nvim",
		tag = '0.1.1',
		dependencies = {'nvim-lua/plenary.nvim'}},
    {"theprimeagen/harpoon"},
	{"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate"},
	{
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
	  dependencies = {
	    -- LSP Support
	    {'neovim/nvim-lspconfig'},             -- Required
	    {                                      -- Optional
	        'williamboman/mason.nvim',
	            build = ":MasonUpdate",
	    },
	    {'williamboman/mason-lspconfig.nvim'}, -- Optional
	    -- Autocompletion
	    {'hrsh7th/nvim-cmp'},     -- Required
	    {'hrsh7th/cmp-nvim-lsp'}, -- Required
	    {'L3MON4D3/LuaSnip'},     -- Required
	  }
	},
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
      end,
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    },
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
}

vim.g.mapleader = " "
require("lazy").setup(plugins)

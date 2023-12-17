return {
  'tpope/vim-sleuth', -- auto tabstop, shiftwidth

  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    opts = { contrast = "dark" },
    config = function()
      vim.cmd.colorscheme('gruvbox')
    end,
  },

  {
    'norcalli/nvim-colorizer.lua',
    opts = {
      '*',                   -- Highlight all files, but customize some others.
      css = { css = true, }, -- Enable all css features.
      scss = { css = true, },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        update_focused_file = {
          enable = true,
        }
      })
    end,
  },

  {
    'neovim/nvim-lspconfig', -- LSP configuration + plugins
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      { 'folke/neodev.nvim', opts = {} },
    },
  },

  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls").builtins
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.formatting.biome,
      })
    end,
  },

  { 'folke/which-key.nvim',  opts = {} }, -- show pending keybinds

  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>gp', require('gitsigns').preview_hunk,
          { buffer = bufnr, desc = '[Git] Hunk [P]review' }
        )
        -- don't override the built-in and fugitive keymaps
        local gs = package.loaded.gitsigns
        vim.keymap.set({ 'n', 'v' }, ']c', function()
          if vim.wo.diff then
            return ']c'
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
        vim.keymap.set({ 'n', 'v' }, '[c', function()
          if vim.wo.diff then
            return '[c'
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
      end,
    },
  },

  {
    'nvim-lualine/lualine.nvim', -- lualine as statusline
    opts = {
      options = {
        icons_enabled = false,
        component_separators = '|',
        section_separators = '',
        theme = 'gruvbox',
      },
    },
  },

  {
    'lukas-reineke/indent-blankline.nvim', -- indentation guides
    main = 'ibl',
    opts = {
      indent = {
        highlight = {
          "CursorColumn",
          "Whitespace",
        },
        char = ""
      },
      whitespace = {
        highlight = {
          "CursorColumn",
          "Whitespace",
        },
        remove_blankline_trail = false,
      },
      scope = { enabled = false },
    },
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  {
    "windwp/nvim-autopairs",
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require("nvim-autopairs").setup {}
      -- If you want to automatically add `(` after selecting a function or method
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    end,
  },
}

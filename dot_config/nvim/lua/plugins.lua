return {
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
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'folke/neodev.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
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
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependecies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require 'harpoon'
      harpoon.setup()

      vim.keymap.set("n", "<leader>ha",
        function() harpoon:list():append() end,
        { desc = '[H]arpoon [A]dd' })

      vim.keymap.set("n", "<C-e>",
        function() harpoon.ui:toggle_quick_menu(harpoon:list()) end
        , { desc = 'Toggle Harpoon Menu' })

      vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)
    end
  }
}

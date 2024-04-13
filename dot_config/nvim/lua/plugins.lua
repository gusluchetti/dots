return {
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    opts = { contrast = "dark" },
    config = function()
      vim.cmd("let g:gruvbox_transparent_bg = 1")
      vim.cmd("autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE")
      vim.cmd("colorscheme gruvbox")
    end,
  },

  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require 'colorizer'.setup({
        html = { mode = 'background' },
      }, { css = true })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'folke/neodev.nvim',
    },
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

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  },

  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end
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
  },

  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {},
    config = function()
      local Terminal = require('toggleterm.terminal').Terminal
      local lazygit  = Terminal:new({ cmd = "lazygit", direction = "float", hidden = true })

      function Lazygit_toggle()
        lazygit:toggle()
      end

      vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua Lazygit_toggle()<CR>",
        { noremap = true, silent = true }
      )
    end
  },
}

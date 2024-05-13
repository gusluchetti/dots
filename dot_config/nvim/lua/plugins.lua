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
      require('colorizer').setup({
        'css',
        'javascript',
        'html',
        html = { mode = 'background' },
      }, { mode = 'foreground' })
    end
  },

  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end
  },

  {
    'nvim-lualine/lualine.nvim', -- lualine as statusline
    opts = {
      options = {
        icons_enabled = false,
        section_separators = '',
        component_separators = '-',
        theme = 'gruvbox',
      },
    },
  },

  {
    'folke/which-key.nvim',
    opts = {},
    config = function()
      require('which-key').register {
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
        ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
        ['<leader>h'] = { name = '[H]arpoon', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
      }
    end
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
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    config = function()
      require("nvim-tree/nvim-web-devicons").setup {
        override = {
          astro = {
            icon = "",
            color = "#FFFFFF",
            name = "astro",
          }
        }
      }

      require("nvim-tree").setup({
        actions = {
          open_file = {
            quit_on_open = true
          }
        },
        update_focused_file = {
          enable = true,
        },
      })
    end,
    lazy = false,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
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
    'numToStr/Comment.nvim',
    opts = {},
    lazy = false,
  },

  {
    'windwp/nvim-autopairs',
    opts = {},
    event = "InsertEnter",
  },

  {
    'windwp/nvim-ts-autotag',
    opts = {},
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependecies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require('harpoon')
      harpoon.setup()

      vim.keymap.set("n", "<leader>ha",
        function() harpoon:list():add() end,
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

  {
    'hrsh7th/nvim-cmp',               -- completion engine
    dependencies = {
      'L3MON4D3/LuaSnip',             -- snippet engine
      'saadparwaiz1/cmp_luasnip',     -- lua snip completion source for cmp
      'hrsh7th/cmp-nvim-lsp',         -- lsp completion capabilities
      'rafamadriz/friendly-snippets', -- snippets
    },
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      require('luasnip.loaders.from_vscode').lazy_load()
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = {
          completeopt = 'menu,menuone,noinsert'
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete {},
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        },
      }
    end,
  },

}

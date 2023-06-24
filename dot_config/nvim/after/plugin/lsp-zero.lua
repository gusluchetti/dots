local lsp = require('lsp-zero').preset({})
local lspconfig = require('lspconfig')

local f_opts = { async = false, timeout_ms = 10000 }

lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr }
  lsp.default_keymaps({ buffer = bufnr })

  vim.keymap.set({ 'n', 'x' }, '<leader>cf', function()
    vim.lsp.buf.format(f_opts)
  end, opts, { desc = "[c]ode [f]ormat " })
  vim.keymap.set("n", "gd", function()
    vim.lsp.buf.definition()
  end, opts, { desc = "[g]o to [d]efinition" })
end)

lsp.ensure_installed({
  'lua_ls',
  'html',
  'rust_analyzer',

})

-- (Optional) Configure lua language server for neovim
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          'vim',
          'require'
        }
      }
    }
  }
})

lsp.setup()

-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
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

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

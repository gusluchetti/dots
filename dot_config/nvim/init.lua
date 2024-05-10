--[[
  started off as kickstart-nvim
  https://learnxinyminutes.com/docs/lua/
  https://neovim.io/doc/user/lua-guide.html
--]]

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- disable netrw, since we're using nvim-tree
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup("plugins")
require('keymaps')
require('options')

-- [[ Highlight on yank ]]
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = vim.api.nvim_create_augroup(
    'YankHighlight',
    { clear = true }),
  pattern = '*',
})

local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  nmap('<leader>cf', vim.lsp.buf.format, '[C]ode [F]ormat')
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-K>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- lsp + telescope
  local telescope_builtin = require 'telescope.builtin'
  nmap('gd', telescope_builtin.lsp_definitions, '[G]oto [D]efinition')
  nmap('gr', telescope_builtin.lsp_references, '[G]oto [R]eferences')
  nmap('gI', telescope_builtin.lsp_implementations, '[G]oto [I]mplementation')
  nmap('<leader>D', telescope_builtin.lsp_type_definitions, 'Type [D]efinition')
  nmap('<leader>ds', telescope_builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', telescope_builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')
end

require('mason').setup()
require('mason-lspconfig').setup()

local servers = {
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      diagnostics = { disable = { 'missing-fields' } },
    },
  },
  rust_analyzer = {},
  tsserver = {},
  html = { filetypes = { 'html', 'twig', 'hbs' } },
  pyright = {},
  cssls = {},
}

require('mason-lspconfig').setup {
  ensure_installed = vim.tbl_keys(servers)
}

require('neodev').setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

require('mason-lspconfig').setup {
  handlers = {
    function(server_name)
        require('lspconfig')[server_name].setup {
          on_attach = on_attach,
          capabilities = capabilities,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
      end,
  }
}

require'lspconfig'.biome.setup{}

return {
    'neovim/nvim-lspconfig', -- LSP configuration + plugins
    dependencies = {
      'nvim-telescope/telescope.nvim',
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      { 'folke/neodev.nvim', opts = {} },
    },
    config = function ()

    local on_attach = function(_, bufnr)
      local nmap = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end

      nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
      nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
      nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
      nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
      nmap('<leader>cf', vim.lsp.buf.format() , '[C]ode [F]ormat')

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
      require('neodev').setup()

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      local mason_lspconfig = require('mason-lspconfig')

      local servers = {
        pyright = {},
        rust_analyzer = {},
        tsserver = {},
        html = { filetypes = { 'html', 'twig', 'hbs'} },
        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = { disable = { 'missing-fields' } },
          },
        },
        ruff = {},
        -- clangd = {},
        -- gopls = {},
      }

      mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(servers)
      }

      mason_lspconfig.setup_handlers {
        function(server_name)
          local lspconfig = require 'lspconfig'
          lspconfig[server_name].setup {
            on_attach = on_attach,
            settings = servers[server_name],
            capabilities = capabilities,
            filetypes = (servers[server_name] or {}).filetypes,
          }
        end,
      }
    end
  }

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
    end, opts, {desc = "[g]o to [d]efinition"})
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


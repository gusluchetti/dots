local has_py_config = function(utils)
    return utils.root_has_file({ "pyproject.toml" })
end

return {
    'nvimtools/none-ls.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()
        local null_ls = require("null-ls")
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        null_ls.setup({
            sources = {
                -- python
                null_ls.builtins.formatting.isort.with({
                    condition = has_py_config,
                }),
                null_ls.builtins.formatting.black.with({
                    condition = has_py_config,
                }),
                null_ls.builtins.diagnostics.ruff.with({
                    condition = has_py_config,
                }),
            },

            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ async = false })
                        end,
                    })
                end
            end,

        })
    end
}

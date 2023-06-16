local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr}

	vim.keymap.set("n", "gd", function()
        vim.lsp.buf.definition()
    end, opts)

    vim.keymap.set({'n', 'x'}, '<leader>cf', function()
        vim.lsp.buf.format({async = false, timeout_ms = 10000})
    end, opts)
end)

lsp.setup()

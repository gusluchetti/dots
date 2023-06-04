local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
end)

lsp.format_mapping('cf', {
  format_opts = {
    async = false,
    timeout_ms = 1000,
  },
  servers = {
    ['lua_ls'] = {'lua'},
    ['html'] = {'html'},
    ['cssls'] = {'css'},
    -- if you have a working setup with null-ls
    -- you can specify filetypes it can format.
    -- ['null-ls'] = {'javascript', 'typescript'},
  }
})

lsp.setup()

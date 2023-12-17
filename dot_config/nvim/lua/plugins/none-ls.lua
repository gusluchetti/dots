return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local null_ls = require("null-ls")

    local formatting = {
      null_ls.builtins.formatting.black
    }

    local diagnostics = {}

    null_ls.setup({
      sources = formatting .. diagnostics,
    })
  end
}

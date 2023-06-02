local nvimtree = require("nvim-tree");

vim.keymap.set("n", "<C-e>", "<cmd>NvimTreeToggle<CR>")

nvimtree.setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

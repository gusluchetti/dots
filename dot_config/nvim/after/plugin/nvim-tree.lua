local nvimtree = require("nvim-tree");

vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", {desc = "Toggle nvim-tree"})

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

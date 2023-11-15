local nvimtree = require("nvim-tree");

vim.keymap.set("n", "<leader>pv",
    "<cmd>NvimTreeToggle<CR>",
    { desc = "Toggle [p]roject [v]iew" }
)

nvimtree.setup({
    sort_by = "case_sensitive",
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
})

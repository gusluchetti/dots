vim.keymap.set("n", "<leader>hh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", {desc="Open Quick Menu"})
vim.keymap.set("n", "<leader>ha", "<cmd>lua require('harpoon.ui').add_file()<cr>", {desc="Add file to Quick Menu"})
vim.keymap.set("n", "<C-h>", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", {desc="Go to previous mark"})
vim.keymap.set("n", "<C-l>", "<cmd>lua require('harpoon.ui').nav_next()<cr>", {desc="Go to next mark"})

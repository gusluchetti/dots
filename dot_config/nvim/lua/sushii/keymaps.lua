-- move things around on visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor on same place after copying line below
vim.keymap.set("n", "J", "mzJ`z")

-- keep cursor on center on page change
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")

-- keep cursor on center on term search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- don't overwrite current paste buffer with what was selected
vim.keymap.set("x", "<leader>p", [["_dP]])

-- change windows shortcut
vim.keymap.set("n", "<leader>wh", "<cmd>wincmd h<CR>")
vim.keymap.set("n", "<leader>wl", "<cmd>wincmd l<CR>")

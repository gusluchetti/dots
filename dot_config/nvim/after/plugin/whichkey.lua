local wk = require("which-key")

local normal = {
  ["<leader>f"] = {
    name = "+file",
    n = { "<cmd>enew<cr>", "New File" },
  },
}

local telescope = {
  ["<leader>f"] = {
    name = "+file",
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    g = { "<cmd>Telescope git_files<cr>", "Find Git File" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
  },
}

local harpoon = {
  ["<leader>h"] = {
    name = "+harpoon",
    a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add file to Quick Menu" },
    m = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Open Quick Menu" },
  },
  ["<C-j>"] = {"<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Go to previous mark"},
  ["<C-k>"] = {"<cmd>lua require('harpoon.ui').nav_next()<cr>", "Go to next mark"},
}

local mappings = {normal, telescope, harpoon}
local opts = {
  mode = "n", -- NORMAL mode
  -- prefix: use "<leader>f" for example for mapping everything related to finding files
  -- the prefix is prepended to every mapping part of `mappings`
  prefix = "",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
  expr = false, -- use `expr` when creating keymaps
}

wk.register(mappings, opts)

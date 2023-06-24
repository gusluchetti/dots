-- base vim.opts setup
require("sushii.options")

-- starting lazy.nvim and defining which plugins to be downloaded 
-- per plugin configuration is in after/plugin/{plugin_name}.lua
require("sushii.plugins")

-- essential nvim keymaps
require("sushii.keymaps")

vim.keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint<cr>", { desc = "Toggle breakpoint" })
vim.keymap.set("n", "F12", "<cmd> DapStepOverStepOver<cr>", { desc = "Step over" })
vim.keymap.set("n", "<leader>dui", function()
    local widgets = require('dap.ui.widgets');
    local sidebar = widgets.sidebar(widgets.scopes);
    sidebar.open();
end, { desc = "Open DAP UI" })

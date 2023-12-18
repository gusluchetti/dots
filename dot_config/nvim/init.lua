--[[
  started off as kickstart-nvim
  https://learnxinyminutes.com/docs/lua/
  https://neovim.io/doc/user/lua-guide.html
--]]

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- disable netrw, since we're using nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup("plugins")
require('keymaps')
require('options')

-- [[ Highlight on yank ]]
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = vim.api.nvim_create_augroup(
    'YankHighlight',
    { clear = true }),
  pattern = '*',
})

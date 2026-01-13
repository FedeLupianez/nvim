-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options herevim

vim.o.shell = "zsh"

local vimO = vim.opt
vimO.expandtab = true
vimO.clipboard = "unnamedplus"
vim.opt.updatetime = 250
vim.opt.shortmess:append("c")

require("jack.remap")

-- Use system clipboard for all yank/paste operations
vim.opt.clipboard = "unnamedplus"

-- Force xclip as the provider (usually unnecessary but helps if auto-detect fails)
vim.g.clipboard = {
  name = "xclip",
  copy = {
    ["+"] = { "xclip", "-quiet", "-i", "-selection", "clipboard" },
    ["*"] = { "xclip", "-quiet", "-i", "-selection", "primary" },
  },
  paste = {
    ["+"] = { "xclip", "-o", "-selection", "clipboard" },
    ["*"] = { "xclip", "-o", "-selection", "primary" },
  },
  cache_enabled = 1,
}
vim.opt.nu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

-- Define the path relative to the Neovim configuration directory
local config_path = vim.fn.stdpath('config')
local notes_file = config_path .. '/MyNotes_Neovim.md'

-- Define a command to open the file in a horizontal split
vim.api.nvim_set_keymap('n', '<Leader>z', ':split ' .. notes_file .. '<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>t', ':split<CR>:terminal<CR>i', { noremap = true, silent = true })

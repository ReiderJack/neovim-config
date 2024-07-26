-- Define the path relative to the Neovim configuration directory
local config_path = vim.fn.stdpath('config')
local notes_file = config_path .. '/MyNotes_Neovim.md'

-- Define a command to open the file in a horizontal split
vim.api.nvim_set_keymap('n', '<Leader>z', ':split ' .. notes_file .. '<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>t', ':split<CR>:terminal<CR>i', { noremap = true, silent = true })

### How to find any file by name on the system from neovim?

`:Find filename`

`:Telescope find_files`

In terminal 
`find /path/to/search/ -name "filename"`
`find ~/ -name "example.md"`

### How to find files with specified word in it?

### How to access :help of installed plugins in vim?

`:help nvim-treesitter`

After installing a plugin `:helptags ALL`

### How to check which neovim plugin is currently doing something in the window like diagnostics for text?

### How to exit current file in tree sitter at the current location of the file?

`:Explore' or ':Vexplore' or ':Sexplore`

### Make a command to open terminal in split horizontal window.

```lua
-- <CR> is shorthand for pressing Enter after a command
-- noremap - ensures that the mapping does not recursively call itself
-- silent - any messages or status updates that would normally appear after running commands are suppressed. ( like messages after :split )
vim.api.nvim_set_keymap('n', '<Leader>t', ':split<CR>:terminal<CR>i', { noremap = true, silent = true })
```

### Execute cargo commands from nvim file even if the terminal is not in the directory of the projects folder.

`RustRun` or just go to `help rust-commands` there are options there.

### How to make commands like :Crun (+ terminal command like pwd).

-- Basic setup
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = true

-- Leader keys
vim.g.mapleader = ';'
vim.g.maplocalleader = ';'

-- Show chars, indents, etc.
vim.o.list  =  true
vim.o.listchars =  'tab:→ ,trail:·,extends:»,precedes:«'

-- Tab sizes and such
vim.o.textwidth = 78
vim.o.expandtab = false
vim.o.shiftwidth = 4
vim.o.tabstop = 4

vim.o.cursorline = true
vim.o.autowrite = true

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

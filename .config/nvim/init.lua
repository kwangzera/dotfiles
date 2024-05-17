local Plug = vim.fn['plug#']

-- Install Plugins
vim.call('plug#begin')
Plug "phha/zenburn.nvim"
Plug 'wakatime/vim-wakatime'
vim.call('plug#end')

-- Zenburn theme
-- You might also need to add set t_Co=256 into your .vimrc file, before loading the colorscheme.
vim.o.t_Co=256
require("zenburn").setup()

-- Basic setup
vim.o.number=true
vim.o.relativenumber=true
vim.o.wrap=true

-- Show chars, indents, etc.
vim.o.list = true
vim.o.listchars= 'tab:→ ,trail:·,extends:»,precedes:«'

-- Tab sizes and such
vim.o.textwidth=78
vim.o.noexpandtab=true
vim.o.shiftwidth=4
vim.o.tabstop=4

vim.keymap.set({ 'n' }, '<leader>wc', "<Cmd>echo system('texcount " .. vim.fn.expand('%:p') .. "')<CR>", { desc = '[W]ord [C]ount' })

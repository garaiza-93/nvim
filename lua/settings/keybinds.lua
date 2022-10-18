-- Leader
vim.g.mapleader = ' '
vim.g.localleader = '\\'

local map = vim.api.nvim_set_keymap

--Pane movement
map('n','<C-A>','<C-W><C-H>',{noremap=true})
map('n','<C-S>','<C-W><C-J>',{noremap=true}) 
map('n','<C-W>','<C-W><C-K>',{noremap=true}) 
map('n','<C-D>','<C-W><C-L>',{noremap=true}) 
--Returning to normal mode
map('i', 'jk', '<ESC>', {noremap=true})
map('i', 'kj', '<ESC>', {noremap=true})
--Continuous indenting by using last highlight (gv)
map('v', '>', '>gv', {noremap=true})
map('v', '<', '<gv', {noremap=true})
--nvim-tree
-- map('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap=true})

-- Leader
vim.g.mapleader = ' '
vim.g.localleader = '\\'

local map = vim.api.nvim_set_keymap

--Returning to normal mode
map('i', 'jk', '<ESC>', { noremap = true })
map('i', 'kj', '<ESC>', { noremap = true })
--Continuous indenting by using last highlight (gv)
map('v', '>', '>gv', { noremap = true })
map('v', '<', '<gv', { noremap = true })

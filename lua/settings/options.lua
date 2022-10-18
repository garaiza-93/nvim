local opt = vim.opt
local cmd = vim.api.nvim_command
-- Context
opt.number = true
opt.relativenumber = false
opt.scrolloff = 4
opt.signcolumn = 'yes'
-- Theme
opt.syntax = 'ON'
opt.termguicolors = true
cmd('colorscheme tokyonight')
-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
-- Whitespace
opt.expandtab = true
--opt.autoindent = true
opt.tabstop = 2
opt.shiftwidth = 2
-- Splitting
opt.splitright = true
opt.splitbelow = true
-- Mouse Support in Tmux
opt.mouse ='a'
-- Keys
opt.timeoutlen = 300
-- Treesitter
vim.api.nvim_set_option_value('foldmethod', 'expr', {win=1000})
vim.api.nvim_set_option_value('foldexpr', 'nvim_treesitter#foldexpr()', {win=1000})
vim.api.nvim_set_option_value('foldminlines', 40, {win=1000})

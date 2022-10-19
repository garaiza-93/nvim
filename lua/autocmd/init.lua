local new_group = vim.api.nvim_create_augroup
local new_cmd = vim.api.nvim_create_autocmd

--Groups
local packerGrp = new_group('packer', { clear = true })
local tmuxGrp = new_group('tmux', { clear = true })
local bashGrp = new_group('bash', { clear = true })
local ts_workaroundGrp = new_group('treesitter', {clear = true})
local treeGrp = new_group('nvim-tree', {clear = true})
--Run :PackerSync whenever plugins.lua is updated. Note that nvim has to be reloaded first.
new_cmd(
  { 'BufWritePost' },
  {
    pattern = 'plugins.lua',
    command = 'PackerSync',
    group = packerGrp
  }
)
--Source tmux config when updated,
new_cmd(
  { 'BufWritePost' },
  {
    pattern = 'tmux.conf',
    command = '!source-tmux.sh',
    group = tmuxGrp
  }
)
--Source bash aliases when updated 
new_cmd(
  { 'BufWritePost' },
  {
    pattern = '.bash_aliases',
    command = '!source-aliases.sh',
    group = bashGrp
  }
)
--Workaround for treesitter because packer is weird
new_cmd(
  { 'BufEnter', 'BufAdd', 'BufNew', 'BufNewFile', 'BufWinEnter' },
  {
    callback = function()
     vim.opt.foldmethod = 'expr'
     vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
     vim.opt.foldnestmax = 2
     vim.opt.foldclose = all
     vim.opt.foldminlines = 40
    end,
    group = ts_workaroundGrp
  }
)
-- vim.cmd([[
--     augroup packer_user_config
-- 		autocmd BufWritePost plugins.lua source ~/.config/nvim/lua/plugins/plugins.lua | PackerSync
--     augroup end
-- ]])

--Source the tmux config whenever it is updated
-- vim.cmd([[
-- 	augroup tmux_user_config
-- 		autocmd BufWritePost tmux.conf !source-tmux.sh
-- ]])

--Source .bash_alias whenever it is updated
-- vim.cmd([[
-- 	augroup bash_aliases
-- 		autocmd BufWritePost .bash_aliases silent! !source-aliases.sh
-- ]])


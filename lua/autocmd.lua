local new_group = vim.api.nvim_create_augroup
local new_cmd = vim.api.nvim_create_autocmd

--Groups
local packerGrp = new_group('packer', { clear = true })
local ts_workaroundGrp = new_group('treesitter', {clear = true})
--Run :PackerSync whenever plugins.lua is updated. Note that nvim has to be reloaded first.
new_cmd(
  { 'BufWritePost' },
  {
    pattern = 'plugins.lua',
    callback = function ()
      vim.cmd('luafile %')
      vim.cmd{ cmd = 'PackerSync' }
    end,
    group = packerGrp
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

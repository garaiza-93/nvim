local new_group = vim.api.nvim_create_augroup
local new_cmd = vim.api.nvim_create_autocmd

--Groups
local packerGrp = new_group('packer', { clear = true })
local ts_workaroundGrp = new_group('treesitter', { clear = true })
local lspGrp = new_group('lsp', { clear = true })
--Format file before write
new_cmd(
  { 'BufWritePre' },
  {
    command = 'lua vim.lsp.buf.format()',
    group = lspGrp
  }
)
new_cmd(
  { 'CursorHold' },
  {
    command = 'lua vim.diagnostic.open_float()',
    group = lspGrp
  }
)
--Run :PackerSync whenever plugins.lua is updated
new_cmd(
  { 'BufWritePost' },
  {
    pattern = 'plugins.lua',
    callback = function()
      vim.cmd('luafile %')
      vim.cmd { cmd = 'PackerSync' }
    end,
    group = packerGrp
  }
)

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use { 'lewis6991/impatient.nvim' }
  use { 'wbthomason/packer.nvim' }
  use { 'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'}, tag = 'nightly', event='BufWinEnter', config="require('config/nvim-tree-config')" }
  use { 'mhinz/vim-startify' }
  use { 'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}, event='BufWinEnter', config="require('config/lualine-config')" }
  use {'folke/which-key.nvim', config="require('config/whichkey-config')"}
  use { 'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}, config="require('config/telescope-config')" }
  use { 'majutsushi/tagbar' }                       
  use { 'tpope/vim-fugitive' }                      
  use { 'junegunn/gv.vim' }                         
  use { 'windwp/nvim-autopairs', event='BufWinEnter', config="require('config/nvim-autopairs-config')" }
  use { 'lukas-reineke/indent-blankline.nvim', config="require('config/indent-blankline-config')" }
  use { 'voldikss/vim-floaterm' }	
  use { 'nvim-treesitter/nvim-treesitter', run = function() require('nvim-treesitter.install').update({ with_sync = true}) end,}
  use { 'akinsho/bufferline.nvim', tag='v2.*', requires='kyazdan142/nvim-web-devicons', event='BufWinEnter', config="require('config/bufferline-config')" }
  -- Theme
  use { 'folke/tokyonight.nvim' }

  -- nvim-cmp
  use {'neovim/nvim-lspconfig'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-path'}
  use {'hrsh7th/cmp-cmdline'}
  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/cmp-vsnip'}
  use {'hrsh7th/vim-vsnip'}
  if packer_bootstrap then
    require('packer').sync()
  end
end)



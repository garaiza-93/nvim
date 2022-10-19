-- lots of credit to jdhao for the majority of this code
local fn = vim.fn

-- Where to install plugins
vim.g.plugin_home = fn.stdpath('data') .. '/site/pack/packer'
-- Where to install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

local fresh_install = false

if fn.empty(fn.glob(install_path)) > 0 then
  fresh_install = true
  -- install packer.nvim
  vim.api.nvim_echo({{"Installing packer.nvim", "Type"}}, true, {})
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]

local packer = require('packer')

packer.startup({
  function(use)
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
    use { 'folke/tokyonight.nvim', config="require('config/tokyonight-config')" }
    
    --mason
    use { 'williamboman/mason.nvim' }

    -- cmp
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'hrsh7th/cmp-vsnip' }
    use { 'hrsh7th/vim-vsnip' }

    --lsp 
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'neovim/nvim-lspconfig', config="require('config/lsp-cmp-dap-config')" }
    use { 'williamboman/mason-lspconfig.nvim' }

    --dap
    use { 'mfussenegger/nvim-dap' }

    --linting and code actions
    use { 'jose-elias-alvarez/null-ls.nvim' }
  end,
  
  -- packer configuration
  config = {
    -- packer_compiled.lua goes with the other data files. NOT in the config directory!!
    compile_path = fn.stdpath('data')..'/site/lua/packer_compiled.lua',
  }
})

if fresh_install then
  packer.sync()
else
  local status, _ = pcall(require, 'packer_compiled')
  if not status then
    vim.notify('packer_compiled.lua not found, run PackerSync!', vim.log.levels.ERROR, { title = 'nvim-config' })
  end
end



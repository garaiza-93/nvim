-- lots of credit to jdhao for the majority of this code
local fn = vim.fn

-- Where to install plugins
vim.g.plugin_home = fn.stdpath('data') .. '/site/pack/packer'
-- Where to install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

local fresh_install = false

if fn.empty(fn.glob(install_path)) > 0 then
  fresh_install = true
  -- install packer.nvim
  vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})
  fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

vim.cmd [[packadd packer.nvim]]

local packer = require('packer')

packer.startup({
  function(use)
    use { 'lewis6991/impatient.nvim' }
    use { 'wbthomason/packer.nvim' }
    use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' }, tag = 'nightly',
      event = 'BufWinEnter', config = "require('config.nvim-tree')" }
    use { 'mhinz/vim-startify' }
    use { 'weilbith/nvim-floating-tag-preview', cmd = { 'Ptag', 'Ptselect', 'Ptjump', 'Psearch', 'Pedit' } }
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }, event = 'BufWinEnter',
      config = "require('config.lualine')" }
    use { 'folke/which-key.nvim', config = "require('config.whichkey')" }
    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' }, config = "require('config.telescope')" }
    use { 'tpope/vim-fugitive' }
    use { 'junegunn/gv.vim' }
    use { 'windwp/nvim-autopairs', event = 'BufWinEnter', config = "require('config.nvim-autopairs')" }
    use { 'lukas-reineke/indent-blankline.nvim', config = "require('config.indent-blankline')" }
    use { 'voldikss/vim-floaterm' }
    use { 'nvim-treesitter/nvim-treesitter',
      run = function() require('nvim-treesitter.install').update({ with_sync = true }) end, }
    use { 'akinsho/bufferline.nvim', tag = 'v2.*', requires = 'kyazdan142/nvim-web-devicons', event = 'BufWinEnter',
      config = "require('config.bufferline')" }
    use {
      "nvim-neotest/neotest",
      requires = {
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim"
      }
    }
    use { "rafamadriz/friendly-snippets" }
    -- Theme
    use { 'folke/tokyonight.nvim' }

    --LSP/DAP/Linter/Formatter package manager
    use { 'williamboman/mason.nvim' }

    -- cmp
    use { 'hrsh7th/nvim-cmp', requires = 'quangnguyen30192/cmp-nvim-tags', config = "require('config.nvim-cmp')" }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'L3MON4D3/LuaSnip',
      config = function()
        require('luasnip/loaders/from_vscode').load({ 'paths={~/.local/share/nvim/site/pack/packer/start/friendly-snippets' })
      end
    }
    use { 'saadparwaiz1/cmp_luasnip' }

    --Tags
    use { 'ludovicchabant/vim-gutentags' }

    --lsp
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'williamboman/mason-lspconfig.nvim', config = "require('config.nvim-lspconfig')" }
    use { 'neovim/nvim-lspconfig' }
    use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons", config = "require('config.trouble')" }
    --dap
    use { 'mfussenegger/nvim-dap' }

    --linting and code actions
    use { 'jose-elias-alvarez/null-ls.nvim', config = "require('config.null-ls')" }
    use { 'jayp0521/mason-null-ls.nvim' }
  end,

  -- packer configuration
  config = {
    -- packer_compiled.lua goes with the other data files. NOT in the config directory!!
    compile_path = fn.stdpath('data') .. '/site/lua/packer_compiled.lua',
  }
})

if fresh_install then
  packer.sync()
else
  local status, _ = pcall(require, 'packer_compiled')
  if not status then
    vim.notify('packer_compiled.lua not found, run PackerSync!', vim.log.levels.ERROR, { title = 'nvim' })
  end
end

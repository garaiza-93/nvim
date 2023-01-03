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
    --improve startup time
    use { 'lewis6991/impatient.nvim' }
    -- Nix syntax highlighting and indenting
    use { 'LnL7/vim-nix' }
    -- packer manages itself
    use { 'wbthomason/packer.nvim' }
    --file explorer
    use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' }, tag = 'nightly',
      event = 'BufWinEnter', config = "require('config.nvim-tree')" }
    --greeter UI TODO:Make a badass config.
    use { 'goolord/alpha-nvim', config = "require('config.alpha')" }
    --statusline
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }, event = 'BufWinEnter',
      config = "require('config.lualine')" }
    --organized keybinds
    use { 'folke/which-key.nvim', config = "require('config.whichkey')" }
    --live grep, find files, treesitter, tags (buffer and dir), git views (files, commits, diff, branches, status, stashes),
    --quickfix menu, LSP definitons/declaration/in&out calls/diagnostics
    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' }, config = "require('config.telescope')" }
    use { "nvim-telescope/telescope-file-browser.nvim" }
    --Git actions. TODO: Replace.
    use { 'tpope/vim-fugitive' }
    --Auto adds closing parentheses and brackets TODO: Expand config
    use { 'windwp/nvim-autopairs', event = 'BufWinEnter', config = "require('config.autopairs')" }
    --Auto add closing tags
    use { 'windwp/nvim-ts-autotag' }
    --Change surrounding quotes/tags.
    use { 'kylechui/nvim-surround', tag = '*', config = "require('config.surround')" }
    --Indent guide
    use { 'lukas-reineke/indent-blankline.nvim', config = "require('config.indent-blankline')" }
    --Terminal in split or floating window.
    use { 'akinsho/toggleterm.nvim' }
    --Abstraction layer to easily configure nvim's treesitter
    use { 'nvim-treesitter/nvim-treesitter',
      run = function() require('nvim-treesitter.install').update({ with_sync = true }) end, }
    --Adds markers to keep track to tabs.
    use { 'akinsho/bufferline.nvim', tag = 'v2.*', requires = 'kyazdan142/nvim-web-devicons', event = 'BufWinEnter',
      config = "require('config.bufferline')" }
    --Unit testing. Haven't figured out how to use.
    use {
      "nvim-neotest/neotest",
      requires = {
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim"
      }
    }
    --Gives more snippets to use in luasnip
    use { "rafamadriz/friendly-snippets" }
    -- Theme
    use { 'folke/tokyonight.nvim' }

    --LSP/DAP/Linter/Formatter package manager
    use { 'williamboman/mason.nvim' }

    -- cmp
    use { 'hrsh7th/nvim-cmp', config = "require('config.cmp')" }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'L3MON4D3/LuaSnip',
      config = function()
        require('luasnip/loaders/from_vscode').load({ 'paths={~/.local/share/nvim/site/pack/packer/start/friendly-snippets' })
      end
    }
    use { 'saadparwaiz1/cmp_luasnip' }
    --Function signature hint
    use { 'ray-x/lsp_signature.nvim', config = "require('config.lsp_signature')" }
    --lsp
    use { 'hrsh7th/cmp-nvim-lsp' }
    --used for automatic lsp setup. can also override, see config.
    use { 'williamboman/mason-lspconfig.nvim', config = "require('config.lspconfig')" }
    use { 'neovim/nvim-lspconfig' }
    --diagnostics menu. TODO: Look into using Telescope for this.
    use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons", config = "require('config.trouble')" }
    --dap, TODO: figure out how i use this lmao
    use { 'mfussenegger/nvim-dap' }

    --linting and code actions
    use { 'jose-elias-alvarez/null-ls.nvim', config = "require('config.null-ls')" }
    use { 'jayp0521/mason-null-ls.nvim' }

    -- LSP-based code folding
    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
    -- Moving between vim panes and tmux splits
    use { 'christoomey/vim-tmux-navigator' }
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

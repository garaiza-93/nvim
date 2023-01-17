return {
    -- Theme
     { 'folke/tokyonight.nvim', lazy = false, priority = 1000, config = function() vim.cmd([[colorscheme tokyonight-night]]) end},
     --Start screen
     { 'goolord/alpha-nvim', lazy = false, priority = 50 },
    --file explorer
     { 'kyazdani42/nvim-tree.lua', dependencies = { 'kyazdani42/nvim-web-devicons' },  version = 'nightly', event = 'BufWinEnter' },

    --statusline
     { 'nvim-lualine/lualine.nvim', dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }, event = 'BufWinEnter' },
    --organized keybinds
     { 'folke/which-key.nvim' },
    --live grep, find files, treesitter, tags (buffer and dir), git views (files, commits, diff, branches, status, stashes),
    --quickfix menu, LSP definitons/declaration/in&out calls/diagnostics
     { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
     { "nvim-telescope/telescope-file-browser.nvim" },
    --Git actions. TODO: Replace.
     { 'tpope/vim-fugitive' },
    --Auto adds closing parentheses and brackets TODO: Expand config
     { 'windwp/nvim-autopairs', event = 'BufWinEnter' },
    --Auto add closing tags
     { 'windwp/nvim-ts-autotag' },
    --Change surrounding quotes/tags.
     { 'kylechui/nvim-surround', version = '*' },
    --Indent guide
     { 'lukas-reineke/indent-blankline.nvim' },
    --Terminal in split or floating window.
     { 'akinsho/toggleterm.nvim' },
    --Abstraction layer to easily configure nvim's treesitter
     { 'nvim-treesitter/nvim-treesitter',
      build = function() require('nvim-treesitter.install').update({ with_sync = true }) end },
    --Adds markers to keep track to tabs.
     { 'akinsho/bufferline.nvim', version = 'v2.*', dependencies = 'kyazdani42/nvim-web-devicons', event = 'BufWinEnter' },
    --Unit testing. Haven't figured out how to use.
     {
      "nvim-neotest/neotest",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim"
      }
    },
    --Gives more snippets to  in luasnip
     { "rafamadriz/friendly-snippets" },
    --LSP/DAP/Linter/Formatter package manager
     { 'williamboman/mason.nvim' },
    -- cmp
     { 'hrsh7th/nvim-cmp' },
     { 'hrsh7th/cmp-buffer' },
     { 'hrsh7th/cmp-path' },
     { 'hrsh7th/cmp-cmdline' },
     { 'saadparwaiz1/cmp_luasnip' },
    --Function signature hint
     { 'ray-x/lsp_signature.nvim' },
    --lsp
     { 'hrsh7th/cmp-nvim-lsp' },
    --d for automatic lsp setup. can also override, see config.
     { 'williamboman/mason-lspconfig.nvim' },
     { 'neovim/nvim-lspconfig' },
    --diagnostics menu. TODO: Look into using Telescope for this.
     { "folke/trouble.nvim", dependencies = "kyazdani42/nvim-web-devicons" },
    --dap, TODO: figure out how i use this lmao
     { 'mfussenegger/nvim-dap' },
    --linting and code actions
     { 'jose-elias-alvarez/null-ls.nvim' },
     { 'jayp0521/mason-null-ls.nvim' },

    -- LSP-based code folding
    --  { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async' }
}

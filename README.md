# Neovim Configuration

My personal Neovim (nvim) setup. It's not where I want it just yet, but it's a good starting point for anyone who wants more out of it. There's a learning curve, but I encourage you to explore.

On first-time startup, nvim will install lazy and the included plugins.

## Included Plugins
All plugin configurations are in the **plugins** directory
 - [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) to browse files in a sidepane.
 - [lualine](https://github.com/nvim-lualine/lualine.nvim) for a customizable statusline that shows mode, filename, encoding, git status, and more!
 - [which-key](https://github.com/folke/which-key.nvim) for tracking key shortcuts and managing your own! It's likely you won't like what I have, so definitely play with this.
 - [telescope](https://github.com/nvim-telescope/telescope.nvim) for fuzzy searching in directories. Useful when you don't know the location of a file.
 - [nvim-autopairs](https://github.com/windwp/nvim-autopairs) to make pairs of certain characters and highlight them. An absolute must-have.
 - [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim) for indent guides.
 - [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) allows for an easier interface with nvim's treesitter and includes a variety of features. Refer to their repo for more info.
 - [bufferline](https://github.com/akinsho/bufferline.nvim) allows for neater switching between tabpages. Can be modified to switch between buffers.
 - [tokyonight](https://github.com/folke/tokyonight.nvim) is a theme for nvim and lualine.
 - [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) is for code completion, and sources from [cmp-luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
 - [mason](https://github.com/williamboman/mason.nvim) is for easy management of Language Server Protocols, Debugger Access Protocols, linters, and formatters for a variety of languages. Similar mason packages are also installed for easier setup in LSP/CMP/formatting plugins
 - [lspconfig](https://github.com/neovim/nvim-lspconfig) is available if you need it for specific LSP configurations, and mason can interface with this.
 - [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim) lets you format code. Be sure to install the right formatter in mason.
 - [trouble](https://github.com/folke/trouble.nvim) for a buffer that shows all diagnostics in one easy place.
 - [lsp_signature](https://github.com/ray-x/lsp_signature.nvim) gives signature hints as you type.
 ... and possibly more ...

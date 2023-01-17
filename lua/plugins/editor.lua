return {
  {
    {
      'kyazdani42/nvim-tree.lua',
      dependencies = { 'kyazdani42/nvim-web-devicons' },
      version = 'nightly',
      keys = {
        {'<leader>ef', '<cmd>NvimTreeToggle<cr>', desc = 'File Explorer' },
      },
      config = function()
        require('nvim-tree').setup()
      end
    },
    {
    'nvim-lualine/lualine.nvim', 
    dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },
    event = 'BufWinEnter',
    config = function()
      require('lualine').setup {
        options = {
          theme = 'auto',
          globalstatus = true,
          disabled_filetypes = { 'alpha' },
          ignore_focus = {},
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff' },
          lualine_c = {
            {
              'buffers',
              hide_filename_extension = true,
              symbols = {
              alternate_file = '',
            },
              mode = 4,
            },
          },
          lualine_x = { 'filetype' },
          lualine_y = { 'diagnostics' },
          lualine_z = { 'location' }
        }
      }
    end
    },
    {
      'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-file-browser.nvim' },
    },
  },
}

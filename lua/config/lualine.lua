require('lualine').setup {
  options = {
    theme = 'auto',
    globalstatus = true,
    disabled_filetypes = { 'alpha' },
    ignore_focus = {},
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

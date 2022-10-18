-- Imports
require('impatient')
require('tokyonight').setup({
  style = 'night',
  terminal_colors = true,
  styles = {
    comments = "italic",
    keywords = "italic",
    functions = "NONE",
    variables = "NONE",
    sidebars = "dark", 
    floats = "dark", 
  },
  sidebars = { "qf", "help" },
  dim_inactive = false,
})
require('./plugins/plugins')
require('autocmd')
require('./config/treesitter-config')
require('./settings/keybinds')
require('./settings/globals')
require('./settings/options')

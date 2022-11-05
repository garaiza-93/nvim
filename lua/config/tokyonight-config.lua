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


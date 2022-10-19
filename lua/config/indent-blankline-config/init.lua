require('indent_blankline').setup {
  char = '▏',
  show_end_of_line = false,
  disable_with_no_list = true,
  buftype_exclude = { 'terminal' },
  filetype_exclude = { 'help', 'git', 'markdown', 'snippets', 'text', 'startify', 'mason'},
}

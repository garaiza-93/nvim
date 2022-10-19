require('bufferline').setup {
  options = {
    mode = 'tabs',
    always_show_bufferline = false,
    separator_style = 'thin',
    custom_filter = function(buf_number, _)
      if 
        vim.bo[buf_number].filetype ~= 'startify' and
        vim.bo[buf_number].filetype ~= 'NvimTree'
      then
        return true
      else
        return false
      end
    end,
    show_close_icon = false,
    hover = {
      enabled = true,
      delay = 0,
      reveal = {'close'},
    }
  },
}

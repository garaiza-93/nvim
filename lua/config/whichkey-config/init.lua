local wk=require('which-key')
wk.setup {
  plugins = {
    marks = false,
    registers = false,
    spelling = { enabled = false, suggestions = 20 },
    presets = {
      operators = false,
      motions = false,
      text_objects = false,
      windows = false,
      nav = false,
      z = false,
      g = false
    }
  }
}
local mappings = {
	e = {
    name = 'Explore',
    f = {':NvimTreeToggle<cr>', 'Files' },
    c = {':TagbarToggle<cr>', 'Code Structure'},
    t = {':Telescope find_files<cr>', 'Telescope Find Files'},
    r = {':Telescope live_grep<cr>', 'Telescope Live Grep'},
    s = {':Startify<cr>', 'Start'}
  },
  s = {
    name = 'Settings',
    r = {':luafile %<cr>', 'Reload Settings'},
  },
  t = { 
    ':FloatermToggle<cr>', 'Terminal'
  },  
}
wk.register(mappings, { prefix = "<leader>" })


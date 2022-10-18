local hasTerm = false

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

function toggleTerm()
  if not hasTerm then
    hasTerm = true
    return ':FloatermNew --wintype=split --height=0.3 --position=botright<cr>'
  else
    return ':FloatermToggle'
  end
end

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
    toggleTerm(), 'Toggle Terminals'
  },  
}
wk.register(mappings, { prefix = "<leader>" })


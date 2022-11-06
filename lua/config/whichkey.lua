local hasTerm = false

local wk = require('which-key')
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

local function toggleTerm()
  if not hasTerm then
    hasTerm = true
    return '<cmd>FloatermNew --wintype=split --height=0.3 --position=botright<cr>'
  else
    return '<cmd>FloatermToggle'
  end
end

local mappings = {
  c = {
    name = 'Code',
    d = { '<cmd>TroubleToggle<cr>', 'Toggle Diagnostics' },
    f = { '<cmd>lua vim.lsp.buf.format()<cr>', 'Format' },
    t = { '<cmd>TagbarToggle<cr>', 'Tags' },
  },
  e = {
    name = 'Explore',
    f = { '<cmd>NvimTreeToggle<cr>', 'Files' },
    s = { '<cmd>Startify<cr>', 'Start' }
  },
  f = {
    name = 'Find',
    f = { '<cmd>Telescope find_files<cr>', 'By Filename' },
    g = { '<cmd>Telescope live_grep<cr>', 'By Grep' },
  },
  r = { '<cmd>luafile %<cr>', 'Refresh Settings' },
  t = { toggleTerm(), 'Terminal' },
}
wk.register(mappings, { prefix = "<leader>" })

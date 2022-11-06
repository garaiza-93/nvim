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

local mappings = {
  c = {
    name = 'Code',
    d = { '<cmd>TroubleToggle<cr>', 'Toggle Diagnostics' },
    f = { '<cmd>lua vim.lsp.buf.format()<cr>', 'Format' },
    r = { '<cmd>lua vim.lsp.buf.rename()', 'Refactor' }
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
  g = {
    name = 'Go to',
    d = { '<cmd>lua vim.lsp.buf.definition()<cr>', 'Definition' },
    D = { '<cmd>lua vim.lsp.buf.declaration()<cr>', 'Declaration' },
    i = { '<cmd>lua vim.lsp.buf.implementation()<cr>', 'Implementation' },
    r = { '<cmd>lua vim.lsp.buf.references()<cr>', 'References' },
    t = { '<cmd>lua vim.lsp.buf.type_defintion()<cr>', 'Type Defintion' },
  },
  r = { '<cmd>luafile ~/.config/nvim/init.lua<cr>', 'Refresh Settings' },
  t = {
    name = 'Tools',
    a = { '<cmd>lua vim.lsp.buf.code_action()<cr>', 'Code Actions' },
    t = { '<cmd>FloatermNew --wintype=split --height=0.3 --position=botright<cr>', 'Terminal' },
  }
}
wk.register(mappings, { prefix = "<leader>" })

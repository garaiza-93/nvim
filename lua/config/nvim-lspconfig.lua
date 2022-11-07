require('mason-lspconfig').setup()
-- Automatically setup LSP servers
require('mason-lspconfig').setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {}
  end,
  -- Dedicated handlers for specific servers after this line
  ['sumneko_lua'] = function()
    require('lspconfig').sumneko_lua.setup {
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemety = {
            enable = false,
          },
        },
      },
    }
  end
}

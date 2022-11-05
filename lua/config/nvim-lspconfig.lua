require('mason-lspconfig').setup()
-- Automatically setup LSP servers
require('mason-lspconfig').setup_handlers {
  function (server_name)
    require('lspconfig')[server_name].setup {}
  end,
  -- Dedicated handlers for specific servers after this line
  -- ['server'] = function ()
}

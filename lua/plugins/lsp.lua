return
{
  { 'neovim/nvim-lspconfig' },
  { 'jose-elias-alvarez/null-ls.nvim' },
  { 'williamboman/mason.nvim', config = function() require('mason').setup {} end },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function() 
      require('mason-lspconfig').setup()

      -- Automatically setup LSP servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
      require('mason-lspconfig').setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
          }
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
                  library = vim.api.nvim_get_runtime_file('', true),
                },
                telemetry = {
                  enable = false,
                },
              },
            },
          }
        end
      }
      --require('ufo').setup({
      --  provider_selector = function(bufnr, filetype, buftype)
      --    return { 'lsp', 'indent' }
      --  end
      --})
    end
  },
  {
    'jayp0521/mason-null-ls.nvim', 
    config = function()
      require('null-ls').setup()
      require('mason-null-ls').setup({
        automatic_installation = true,
        automatic_setup = true
      })
    end
  },
}

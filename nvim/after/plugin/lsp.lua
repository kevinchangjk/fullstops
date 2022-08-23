require('mason').setup()
require('mason-lspconfig').setup()

local on_attach = require('core.lspconfig').on_attach
local capabilities = require('core.lspconfig').capabilities

-- lua
require'lspconfig'.sumneko_lua.setup({
  single_file_support = true,
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})

-- bash
require'lspconfig'.bashls.setup{
  single_file_support = true,
  on_attach = on_attach,
  capabilities = capabilities,
}

-- json
require'lspconfig'.jsonls.setup{
  single_file_support = true,
  on_attach = on_attach,
  capabilities = capabilities,
}

-- markdown
require'lspconfig'.marksman.setup{
  single_file_support = true,
  on_attach = on_attach,
  capabilities = capabilities,
}

-- python
require'lspconfig'.pylsp.setup{
  single_file_support = true,
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W292', 'W293', 'W391'},
          maxLineLength = 100
        }
      }
    }
  }
}

-- rust
require'lspconfig'.rls.setup{
  single_file_support = true,
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    rust = {
      unstable_features = true,
      build_on_save = false,
      all_features = true,
    },
  },
}

-- solidity
require'lspconfig'.solidity_ls.setup{
  single_file_support = true,
  on_attach = on_attach,
  capabilities = capabilities,
}

-- typescript/javascript
require'lspconfig'.tsserver.setup{
  single_file_support = true,
  on_attach = on_attach,
  capabilities = capabilities,
}

-- c 
require'lspconfig'.clangd.setup{
  single_file_support = true,
  on_attach = on_attach,
  capabilities = capabilities,
}

local M = {
  set_keymap = set_keymap,
  on_attach = on_attach,
  capabilities = capabilities,
}

return M

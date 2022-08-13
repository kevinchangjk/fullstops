require('mason').setup()
require('mason-lspconfig').setup()

-- common keymaps
local function set_keymap(bufnr, lhs, callback)
	vim.api.nvim_buf_set_keymap(bufnr, "n", lhs, "", {
		noremap = true,
		silent = true,
		callback = callback,
	})
end

-- lsp-specific keymaps
local function on_attach(_, bufnr)
	set_keymap(bufnr, "gd", vim.lsp.buf.definition)
	set_keymap(bufnr, "gD", vim.lsp.buf.declaration)
	set_keymap(bufnr, "gt", vim.lsp.buf.type_definition)
	set_keymap(bufnr, "gr", vim.lsp.buf.references)
	set_keymap(bufnr, "gi", vim.lsp.buf.implementation)
	set_keymap(bufnr, "gv", vim.lsp.buf.hover)
	print("LSP attached!")
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

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

-- java (jdtls)
-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local workspaceDir = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {

    'java', -- or '/path/to/java17_or_newer/bin/java'
            -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    '-jar', '/Users/kevin/.config/jdt-language-server-1.9.0-202203031534/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',

    '-configuration', '/Users/kevin/.config/jdt-language-server-1.9.0-202203031534/config_mac',

    "-data",
    vim.fn.expand("~/.cache/jdtls/workspace/") .. workspaceDir,
  },

  silent = true,
  capabilities = capabilities,
  on_attach = on_attach,

  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
    }
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {}
  },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)

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

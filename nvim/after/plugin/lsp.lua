require("mason").setup()
require("mason-lspconfig").setup()

local lsp = require("lspconfig")
local baseconfig = require("core.lspconfig")

-- lua
lsp.lua_ls.setup(baseconfig({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim", "use" },
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
}))

-- bash
lsp.bashls.setup(baseconfig())

-- json
lsp.jsonls.setup(baseconfig())

-- markdown
lsp.marksman.setup(baseconfig())

-- python
lsp.pylsp.setup(baseconfig({
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = { "W292", "W293", "W391" },
					maxLineLength = 100,
				},
			},
		},
	},
}))

-- rust
lsp.rust_analyzer.setup(baseconfig({
	settings = {
		rust = {
			unstable_features = true,
			build_on_save = false,
			all_features = true,
		},
	},
}))

-- java
lsp.jdtls.setup(baseconfig())

-- solidity
lsp.solidity_ls.setup(baseconfig())

-- typescript/javascript
lsp.tsserver.setup(baseconfig())

-- c
lsp.clangd.setup(baseconfig())

-- sql
lsp.sqlls.setup(baseconfig({
	settings = {
		cmd = {
			"sql-language-server",
			"up",
		},
		filetypes = {
			"sql",
			"mysql",
		},
	},
}))

local M = baseconfig()

return M

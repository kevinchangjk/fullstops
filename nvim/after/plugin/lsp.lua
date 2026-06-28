require("mason").setup()

require("mason-lspconfig").setup({
	-- We manually enable servers below with vim.lsp.enable().
	-- This avoids mason-lspconfig auto-enabling servers before your custom config is applied.
	automatic_enable = false,
})

local baseconfig = require("core.lspconfig")

-- lua
vim.lsp.config(
	"lua_ls",
	baseconfig({
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
				},
				diagnostics = {
					globals = { "vim", "use" },
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
				},
				telemetry = {
					enable = false,
				},
			},
		},
	})
)

-- bash
vim.lsp.config("bashls", baseconfig())

-- json
vim.lsp.config("jsonls", baseconfig())

-- markdown
vim.lsp.config("marksman", baseconfig())

-- python
vim.lsp.config(
	"pylsp",
	baseconfig({
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
	})
)

-- rust
vim.lsp.config(
	"rust_analyzer",
	baseconfig({
		settings = {
			["rust-analyzer"] = {
				cargo = {
					allFeatures = true,
				},
				checkOnSave = false,
			},
		},
	})
)

-- java
vim.lsp.config("jdtls", baseconfig())

-- typescript/javascript
vim.lsp.config("ts_ls", baseconfig())

-- c/c++
vim.lsp.config("clangd", baseconfig())

-- sql
vim.lsp.config(
	"sqlls",
	baseconfig({
		cmd = {
			"sql-language-server",
			"up",
		},
		filetypes = {
			"sql",
			"mysql",
		},
	})
)

-- go
vim.lsp.config("gopls", baseconfig())

vim.lsp.enable({
	"lua_ls",
	"bashls",
	"jsonls",
	"marksman",
	"pylsp",
	"rust_analyzer",
	"jdtls",
	"ts_ls",
	"clangd",
	"sqlls",
	"gopls",
})

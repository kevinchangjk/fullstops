-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands

local util = require("formatter.util")

require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},

		javascript = {
			require("formatter.filetypes.javascript").prettier,
		},

		javascriptreact = {
			require("formatter.filetypes.javascriptreact").prettier,
		},

		typescript = {
			require("formatter.filetypes.typescript").prettier,
		},

		typescriptreact = {
			require("formatter.filetypes.typescript").prettier,
		},

		json = {
			require("formatter.filetypes.json").prettier,
		},

		html = {
			require("formatter.filetypes.html").prettier,
		},

		css = {
			require("formatter.filetypes.css").prettier,
		},

		yaml = {
			require("formatter.filetypes.yaml").prettier,
		},

		markdown = {
			require("formatter.filetypes.markdown").prettier,
		},

		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},

		cpp = {
			require("formatter.filetypes.cpp").clangformat,
		},

		go = {
			require("formatter.filetypes.go").gofumpt,
		},

		-- python = {
		-- 	require("formatter.filetypes.python").autopep8,
		-- },

		java = {
			require("formatter.filetypes.java").google_java_format,

			function()
				return {
					exe = "google-java-format",
					args = {
						util.escape_path(util.get_current_buffer_file_path()),
						"--replace",
					},
					stdin = true,
				}
			end,
		},

		sh = {
			require("formatter.filetypes.sh").shfmt,
		},

		bash = {
			require("formatter.filetypes.sh").shfmt,
		},

		zsh = {
			require("formatter.filetypes.sh").shfmt,
		},

		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

local nnoremap = Map.noremap("n")

nnoremap("<leader>w", ":Format<cr>")

-- Formats files after saving
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})

local treesitter = require("nvim-treesitter")

treesitter.setup({
	-- Default is stdpath("data") .. "/site".
	-- Keeping it explicit makes parser location predictable.
	install_dir = vim.fn.stdpath("data") .. "/site",
})

local parsers = {
	"bash",
	"c",
	"cpp",
	"css",
	"dockerfile",
	"go",
	"html",
	"java",
	"javascript",
	"json",
	"latex",
	"lua",
	"make",
	"markdown",
	"markdown_inline",
	"proto",
	"python",
	"rust",
	"typescript",
	"solidity",
	"sql",
	"vim",
	"vimdoc",
	"yaml",
}

-- Installs missing parsers asynchronously.
-- This is a no-op for parsers that are already installed.
treesitter.install(parsers)

-- Filetypes where Tree-sitter should start.
-- These are filetypes, not always parser names:
--   tex -> latex parser
--   sh/zsh -> bash parser
--   make -> make parser
local filetypes = {
	"bash",
	"sh",
	"zsh",
	"c",
	"cpp",
	"css",
	"dockerfile",
	"go",
	"html",
	"java",
	"javascript",
	"json",
	"tex",
	"lua",
	"make",
	"markdown",
	"proto",
	"python",
	"rust",
	"typescript",
	"typescriptreact",
	"javascriptreact",
	"solidity",
	"sql",
	"vim",
	"help",
	"yaml",
}

vim.api.nvim_create_autocmd("FileType", {
	pattern = filetypes,
	callback = function(args)
		local bufnr = args.buf

		-- Highlighting.
		-- pcall prevents startup errors if a parser is unavailable/misinstalled.
		pcall(vim.treesitter.start, bufnr)

		-- Indentation.
		-- New nvim-treesitter no longer enables this via setup().
		pcall(function()
			vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end)

		-- Folding.
		-- Disabled by default to avoid changing your current fold behavior.
		-- Uncomment if you want Tree-sitter folds.
		--
		-- vim.wo.foldmethod = "expr"
		-- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	end,
})

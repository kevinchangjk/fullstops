local lint = require("lint")

local function get_cur_file_extension(bufnr)
	bufnr = bufnr or 0
	local filename = vim.api.nvim_buf_get_name(bufnr)
	local ext = vim.fn.fnamemodify(filename, ":e")

	if ext == "" then
		-- Fallback for unnamed buffers.
		local ft = vim.bo[bufnr].filetype
		if ft == "markdown" then
			return ".md"
		elseif ft == "text" then
			return ".txt"
		elseif ft == "tex" or ft == "latex" then
			return ".tex"
		end
	end

	return "." .. ext
end

-- Custom config for vale.
-- Sync/setup command:
-- ~/.local/share/nvim/mason/bin/vale --config=$HOME/.config/nvim/configs/vale/.vale.ini sync
lint.linters.vale.args = {
	"--no-exit",
	"--config",
	vim.fn.expand("~/.config/nvim/configs/vale/.vale.ini"),
	"--output",
	"JSON",
	"--ext",
	get_cur_file_extension,
}

lint.linters_by_ft = {
	text = { "vale" },
	markdown = { "vale" },
	tex = { "vale" },
	latex = { "vale" },
	javascript = { "eslint_d" },
	typescript = { "eslint_d" },
	lua = { "selene" },
	html = { "markuplint" },
	json = { "jsonlint" },
	java = { "checkstyle" },
	css = { "stylelint" },
	scss = { "stylelint" },
	c = { "cpplint" },
	cpp = { "cpplint" },
	python = { "pylint" },
	rust = { "bacon" },
	sql = { "sqlfluff" },

	go = { "golangcilint" },
}

-- Keymaps for viewing linting diagnostics
vim.keymap.set("n", "<leader>e", function()
	vim.diagnostic.open_float(nil, { focus = false })
end, { desc = "Show diagnostic" })

vim.keymap.set("n", "<leader>[", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Previous diagnostic" })

vim.keymap.set("n", "<leader>]", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next diagnostic" })

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics list" })

-- Auto command: write, read, and edit
vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
	callback = function()
		lint.try_lint()
	end,
})

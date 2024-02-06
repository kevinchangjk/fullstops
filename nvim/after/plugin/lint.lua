require("lint").linters_by_ft = {
	text = { "vale" },
	markdown = { "vale" },
	latex = { "vale" },
	javascript = { "eslint_d" },
	typescript = { "eslint_d" },
	lua = { "selene" },
	html = { "markuplint" },
	json = { "jsonlint" },
	java = { "checkstyle" },
	scss = { "stylelint" },
	c = { "cpplint" },
	cpp = { "cpplint" },
	python = { "pylint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

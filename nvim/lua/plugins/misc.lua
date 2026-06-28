-- Miscellaneous plugins
return {

	-- markdown preview
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},

	-- uml
	"weirongxu/plantuml-previewer.vim",

	-- git
	{ "tpope/vim-fugitive", dependencies = {
		"tyru/open-browser.vim",
		"aklt/plantuml-syntax",
	} },

	-- wakatime: coding tracker and analytics
	"wakatime/vim-wakatime",

	-- inverter
	"nguyenvukhang/nvim-toggler",
}

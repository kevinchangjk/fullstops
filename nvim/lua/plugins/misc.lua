-- Miscellaneous plugins
return {

	-- markdown
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

	-- misc stuff
	"wakatime/vim-wakatime",
	"nguyenvukhang/nvim-toggler",
}

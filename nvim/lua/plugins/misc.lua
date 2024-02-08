-- Miscellaneous plugins
return {

	-- markdown
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
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

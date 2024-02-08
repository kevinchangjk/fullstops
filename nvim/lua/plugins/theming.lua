-- colorscheme & aesthetics
return {
	{
		"ful1e5/onedark.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		priority = 1000,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-- greeter screen
	{
		"goolord/alpha-nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("alpha").setup(require("alpha.themes.theta").config)
		end,
	},
}

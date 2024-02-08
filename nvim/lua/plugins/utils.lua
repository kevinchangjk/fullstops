-- useful utility
return {
	"mbbill/undotree",
	"preservim/nerdtree",
	"ThePrimeagen/harpoon",

	-- smooth scrolling
	"psliwka/vim-smoothie",

	-- syntax highlighting
	"nvim-treesitter/nvim-treesitter",
	"nvim-treesitter/nvim-treesitter-context",

	-- copilot
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end,
	},
}

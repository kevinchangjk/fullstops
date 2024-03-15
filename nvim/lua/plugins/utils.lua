-- useful utility
return {
	"mbbill/undotree",
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
	},
	"ThePrimeagen/harpoon",
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		config = function()
			vim.g.barbar_auto_setup = false
			require("barbar").setup({
				-- Enables/disable clickable tabs
				--  - left-click: go to buffer
				--  - middle-click: delete buffer
				clickable = false,

				-- Excludes buffers from the tabline
				exclude_ft = {},
				exclude_name = {},
				filetype = {
					-- Sets the icon's highlight group.
					-- If false, will use nvim-web-devicons colors
					custom_colors = false,

					-- Requires `nvim-web-devicons` if `true`
					enabled = true,
				},
			})
		end,
	},

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

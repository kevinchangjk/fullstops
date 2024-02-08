-- Telescope & dependencies
return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	priority = 100,
	dependencies = {
		"nvim-telescope/telescope-fzy-native.nvim",
		"nvim-lua/plenary.nvim",
		"BurntSushi/ripgrep",
	},
}

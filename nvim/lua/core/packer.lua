-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

-- autocommand for updating plugins upon writing
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

package.path = package.path .. ";../plugins/?.lua"

return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- telescope & dependencies
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-telescope/telescope-fzy-native.nvim",
			"nvim-lua/plenary.nvim",
			"BurntSushi/ripgrep",
		},
	})

	-- colorschemes
	use("flazz/vim-colorschemes")
	use("ful1e5/onedark.nvim")

	-- useful utility
	use("mbbill/undotree")
	use("preservim/nerdtree")
	use("nvim-treesitter/nvim-treesitter")
	use("nvim-treesitter/nvim-treesitter-context")
	use("nvim-lualine/lualine.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("psliwka/vim-smoothie")
	use("ThePrimeagen/harpoon")
	use("iamcco/markdown-preview.nvim")
	use("weirongxu/plantuml-previewer.vim")
	use({ "tpope/vim-fugitive", requires = {
		"tyru/open-browser.vim",
		"aklt/plantuml-syntax",
	} })

	-- mason: lsp, dap, linters, formatters
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})
	use("mfussenegger/nvim-lint")
	use("mhartington/formatter.nvim")
	use("mfussenegger/nvim-jdtls")
	use("lervag/vimtex")

	-- autocompletion
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- misc stuff
	use("ThePrimeagen/vim-be-good")
	use("wakatime/vim-wakatime")
	use("nguyenvukhang/nvim-toggler")
	use("github/copilot.vim")
end)

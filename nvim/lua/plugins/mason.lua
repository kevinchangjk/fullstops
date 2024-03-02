-- mason: lsp, dap, linters, formatters
return {
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	{ "rcarriga/nvim-dap-ui", dependencies = {
		"mfussenegger/nvim-dap",
	} },
	"mfussenegger/nvim-lint",
	"mhartington/formatter.nvim",
	"mfussenegger/nvim-jdtls",
}

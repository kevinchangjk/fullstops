-- colorscheme & aesthetics
return {
	{
		"navarasu/onedark.nvim",
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
		lazy = false,
		priority = 1000,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local alpha = require("alpha")
			local theta = require("alpha.themes.theta")
			theta.header.val = {
				[[ ░▒▓█▓▒░░▒▓█▓▒░░▒▓███████▓▒░       ░▒▓██████▓▒░ ░▒▓██████▓▒░░▒▓███████▓▒░░▒▓████████▓▒░ ]],
				[[ ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░             ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░        ]],
				[[  ░▒▓█▓▒▒▓█▓▒░░▒▓█▓▒░             ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░        ]],
				[[  ░▒▓█▓▒▒▓█▓▒░ ░▒▓██████▓▒░       ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓██████▓▒░   ]],
				[[   ░▒▓█▓▓█▓▒░        ░▒▓█▓▒░      ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░        ]],
				[[   ░▒▓█▓▓█▓▒░        ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░        ]],
				[[    ░▒▓██▓▒░  ░▒▓███████▓▒░        ░▒▓██████▓▒░ ░▒▓██████▓▒░░▒▓███████▓▒░░▒▓████████▓▒░ ]],
			}
			theta.header.opts.hl = "DevIconSln"

			-- Increases padding for greeter
			theta.config.layout[1] = { type = "padding", val = 5 }
			theta.config.layout[3] = { type = "padding", val = 5 }
			theta.config.layout[6].val[6] = nil -- Removes configuration line

			alpha.setup(theta.config)
		end,
	},
}

-- colour scheme
require("onedark").setup({
	colors = { fg0 = "#D6E2F0" },

	-- Overwrites color
	-- Notably, for the message area / command line
	overrides = function(c)
		return {
			MsgArea = { bg = c.bg1 },
			ColorColumn = { bg = c.bg1 },
			NormalFloat = { bg = c.bg1 },
			TelescopeBorder = { bg = c.bg_visual },
		}
	end,

	-- Makes background transparent
	transparent = true,
})

vim.opt.colorcolumn = "80"

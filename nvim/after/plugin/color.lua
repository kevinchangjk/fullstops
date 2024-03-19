-- colour scheme
require("onedark").setup({
	style = "darker",

	colors = {
		bg4 = "#3b3f4c",
		grey = "#6b727f",
		light_grey = "#848b98",
		fg = "#abb2bf",
	},

	-- Overwrites color
	-- Notably, for the message area / command line
	highlights = {
		["Visual"] = { bg = "$bg4" },
		["MsgArea"] = { bg = "$black" },
		["FloatBorder"] = { bg = "$bg3" },
		["ColorColumn"] = { bg = "$black" },
		["NormalFloat"] = { bg = "$bg3" },
		["TelescopePromptNormal"] = { bg = "$bg2" },
		["TelescopePromptTitle"] = { bg = "$bg2" },
		["TelescopePromptBorder"] = { bg = "$bg2" },
		["TelescopePreviewNormal"] = { bg = "$bg2" },
		["TelescopePreviewTitle"] = { bg = "$bg2" },
		["TelescopePreviewBorder"] = { bg = "$bg2" },
		["TelescopeResultsNormal"] = { bg = "$bg2" },
		["TelescopeResultsTitle"] = { bg = "$bg2" },
		["TelescopeResultsBorder"] = { bg = "$bg2" },
		["BufferTabpageFill"] = { bg = "$black" },
		["TabLine"] = { bg = "$black" },
	},

	-- Makes background transparent
	transparent = false,
	term_colors = true,
})

vim.opt.colorcolumn = "80"

require("onedark").load()

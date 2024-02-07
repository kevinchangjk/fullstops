local dap, dapui = require("dap"), require("dapui")

dapui.setup({
	sidebar = {
		elements = {
			{
				id = "scopes",
				size = 0.25, -- Can be float or integer > 1
			},
			{ id = "breakpoints", size = 0.25 },
		},
		size = 40,
		position = "left", -- Can be "left", "right", "top", "bottom"
	},
	tray = {
		elements = {},
	},
})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

-- Change symbols for debugging
vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "🟩", texthl = "", linehl = "", numhl = "" })

-- Set up keymaps for debugging
local nnoremap = Map.noremap("n")
nnoremap("<leader>dt", ":DapUiToggle<cr>")
nnoremap("<leader>db", ":DapToggleBreakpoint<cr>")
nnoremap("<leader>dc", ":DapContinue<cr>")
nnoremap("<leader>dr", ":lua require('dapui').open({reset = true})<cr>")

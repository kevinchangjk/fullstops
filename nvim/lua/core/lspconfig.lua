-- common keymaps
local function set_keymap(bufnr, lhs, callback)
	vim.api.nvim_buf_set_keymap(bufnr, "n", lhs, "", {
		noremap = true,
		silent = true,
		callback = callback,
	})
end

-- lsp-specific keymaps
local function on_attach(_, bufnr)
	set_keymap(bufnr, "gd", vim.lsp.buf.definition)
	set_keymap(bufnr, "gD", vim.lsp.buf.declaration)
	set_keymap(bufnr, "gt", vim.lsp.buf.type_definition)
	set_keymap(bufnr, "gr", vim.lsp.buf.references)
	set_keymap(bufnr, "gi", vim.lsp.buf.implementation)
	set_keymap(bufnr, "gv", vim.lsp.buf.hover)
	print("LSP attached!")
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lspconfig = {
  set_keymap = set_keymap,
  on_attach = on_attach,
  capabilities = capabilities,
}

return lspconfig

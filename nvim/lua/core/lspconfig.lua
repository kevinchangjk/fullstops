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
	print("LSP attached")
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = function(opts)
  return vim.tbl_extend(
    'keep',
    opts or {},
    { on_attach = on_attach,
      capabilities = capabilities,
      set_keymap = set_keymap,
      single_file_support = true
    }
  )
end

return lspconfig

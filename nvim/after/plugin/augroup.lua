local api = vim.api

local readWriteGrp = api.nvim_create_augroup("ReadWrite", { clear = true })
local nusModGrp = api.nvim_create_augroup("NusMod", { clear = true })
local navGrp = api.nvim_create_augroup("NavGrp", { clear = true })

-- indent files properly upon write
-- api.nvim_create_autocmd("BufWritePre", {
--     command = [[normal K=J``]],
--     group = readWriteGrp,
--   })

-- go to last loc when opening a buffer
api.nvim_create_autocmd("BufReadPost", {
	command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]],
	group = readWriteGrp,
})

-- windows to close with "q"
api.nvim_create_autocmd("FileType", {
	pattern = { "help", "startuptime", "qf", "lspinfo" },
	command = [[nnoremap <buffer><silent> q :close<CR>]],
	group = navGrp,
})

api.nvim_create_autocmd("FileType", {
	pattern = "man",
	command = [[nnoremap <buffer><silent> q :quit<CR>]],
	group = navGrp,
})

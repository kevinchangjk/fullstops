local api = vim.api

-- indent files properly upon write
local readWriteGrp = api.nvim_create_augroup("ReadWrite", { clear = true })
api.nvim_create_autocmd("BufWritePre", {
    command = [[normal K=J``]],
    group = readWriteGrp,
  })

-- go to last loc when opening a buffer
api.nvim_create_autocmd("BufReadPost", {
    command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]],
    group = readWriteGrp,
  })

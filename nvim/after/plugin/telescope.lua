local nnoremap = Map.noremap("n")
nnoremap("<leader>ff", "<cmd>Telescope find_files<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>")

-- setting telescope background
vim.cmd([[
  highlight TelescopeNormal guibg=none
  highlight TelescopeSelection guibg=#2E323C
  highlight TelescopeSelectionCaret gui=bold guifg=white guibg=#2E323C
  ]])

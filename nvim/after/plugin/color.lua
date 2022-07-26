-- colour scheme
require('onedark').setup()

vim.opt.colorcolumn = '80'

-- setting background
vim.cmd([[
  highlight ColorColumn guibg=#2E323C
  highlight NonText guibg=none
  highlight Normal guibg=none
  ]])

-- colour scheme
-- require('monokai').setup {}
-- require('monokai').setup { palette = require('monokai').pro }
require('monokai').setup { palette = require('monokai').soda }
-- require('monokai').setup { palette = require('monokai').ristretto }

vim.opt.colorcolumn = '80'

-- setting background
vim.cmd([[
  highlight ColorColumn guibg=#2E323C
  highlight NonText guibg=none
  highlight Normal guibg=none
  ]])

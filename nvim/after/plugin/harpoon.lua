require("telescope").load_extension('harpoon')

require("harpoon").setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
    }
})

local nnoremap = Map.noremap("n")
local harpoon = {
  mark = require('harpoon.mark'),
  ui = require('harpoon.ui'),
}

-- local functions for adding file and navigating
local jump = function(n)
  return function()
    print('Harpooned to index ' .. n)
    harpoon.ui.nav_file(n)
  end
end

local add = function()
  harpoon.mark.add_file()
  harpoon.ui.toggle_quick_menu()
  print('Added file to harpoon')
end

-- key remaps
nnoremap('<leader>h', harpoon.ui.toggle_quick_menu)
nnoremap('<leader>m', add, true)
nnoremap('<leader>1', jump(1), true)
nnoremap('<leader>2', jump(2), true)
nnoremap('<leader>3', jump(3), true)
nnoremap('<leader>4', jump(4), true)
nnoremap('<leader>5', jump(5), true)

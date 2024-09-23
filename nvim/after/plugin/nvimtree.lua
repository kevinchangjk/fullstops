-- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- keybindings
local nnoremap = Map.noremap("n")

-- nerdtree settings
nnoremap("<leader>n", ":NvimTreeToggle<cr>")
nnoremap("<leader>fn", ":NvimTreeFindFile<cr>")
nnoremap("<leader>cn", ":NvimTreeCollapse<cr>")

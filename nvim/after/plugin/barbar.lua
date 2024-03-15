-- Default keybindings for barbar
-- Note: Each of these are generated using the MacOS option key, together with another key.
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map("n", "≤", "<Cmd>BufferPrevious<CR>", opts) -- option + ,
map("n", "≥", "<Cmd>BufferNext<CR>", opts) -- option + .
-- Re-order to previous/next
map("n", "¯", "<Cmd>BufferMovePrevious<CR>", opts) -- option + <
map("n", "˘", "<Cmd>BufferMoveNext<CR>", opts) -- option + >
-- Goto buffer in position...
map("n", "¡", "<Cmd>BufferGoto 1<CR>", opts) -- option + 1, and so on.
map("n", "™", "<Cmd>BufferGoto 2<CR>", opts)
map("n", "£", "<Cmd>BufferGoto 3<CR>", opts)
map("n", "¢", "<Cmd>BufferGoto 4<CR>", opts)
map("n", "∞", "<Cmd>BufferGoto 5<CR>", opts)
map("n", "§", "<Cmd>BufferGoto 6<CR>", opts)
map("n", "¶", "<Cmd>BufferGoto 7<CR>", opts)
map("n", "•", "<Cmd>BufferGoto 8<CR>", opts)
map("n", "ª", "<Cmd>BufferGoto 9<CR>", opts)
map("n", "º", "<Cmd>BufferLast<CR>", opts) -- option + 0
-- Pin/unpin buffer
map("n", "π", "<Cmd>BufferPin<CR>", opts) -- option + p
-- Close buffer
map("n", "ç", "<Cmd>BufferClose<CR>", opts) -- option + c
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
map("n", "å", "<Cmd>BufferCloseAllButPinned<CR>", opts) -- option + a
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map("n", "∆", "<Cmd>BufferPick<CR>", opts) -- option + j
-- Sort automatically by...
map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

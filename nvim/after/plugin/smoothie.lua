local nnoremap = Map.noremap("n")

-- vim.cmd([[
--   silent! nmap <unique> <c-]>      <Plug>(SmoothieUpwards)
--   silent! nmap <unique> <c-\>      <Plug>(SmoothieDownwards)
--   ]])

nnoremap("<c-u>", "<Plug>(SmoothieUpwards)")
nnoremap("<c-d>", "<Plug>(SmoothieDownwards)")

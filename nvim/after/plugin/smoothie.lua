local nnoremap = Map.noremap("n")

-- vim.cmd([[
--   silent! nmap <unique> <c-]>      <Plug>(SmoothieUpwards)
--   silent! nmap <unique> <c-\>      <Plug>(SmoothieDownwards)
--   ]])

nnoremap("<c-k>", "<Plug>(SmoothieUpwards)")
nnoremap("<c-j>", "<Plug>(SmoothieDownwards)")

" remaps
let mapleader = " "
nnoremap Y y$
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-g> <c-w>=
silent! nmap <unique> <c-]>      <Plug>(SmoothieUpwards)
silent! nmap <unique> <c-\>      <Plug>(SmoothieDownwards)
nnoremap <silent> <leader>t :UndotreeToggle<cr>

" remaps
let mapleader = " "

" yank from current block to end of line
nnoremap Y y$

" yank and copy to clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" jump to parent enclosing parantheses
nnoremap <silent> [[ :call searchpair('\[', '', '\]', 'b')<cr>
nnoremap <silent> ]] :call searchpair('\[', '', '\]')<cr>

" navigate windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-g> <c-w>=

" vim-smoothie remaps
silent! nmap <unique> <c-]>      <Plug>(SmoothieUpwards)
silent! nmap <unique> <c-\>      <Plug>(SmoothieDownwards)

" undo-tree toggle
nnoremap <silent> <leader>t :UndotreeToggle<cr>

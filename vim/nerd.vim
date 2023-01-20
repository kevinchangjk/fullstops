" nerdtree
nnoremap <silent> <leader>n :NERDTreeToggle<cr>

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') 
      \&& b:NERDTree.isTabTree() | quit | endif
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1

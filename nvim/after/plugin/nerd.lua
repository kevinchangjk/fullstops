local nnoremap = Map.noremap("n")

-- nerdtree settings
nnoremap("<leader>n", ":NERDTreeToggle<cr>")
vim.cmd([[
  autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') 
        \&& b:NERDTree.isTabTree() | quit | endif
  let NERDTreeShowHidden=1
  let NERDTreeQuitOnOpen=1
  ]])

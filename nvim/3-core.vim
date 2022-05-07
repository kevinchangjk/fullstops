" setting undodir; accessible through $VIM_CONFIG/.undo directory
" $VIM_CONFIG=~/.config/.nvim
set undofile
set undodir=$VIM_CONFIG/undodir
set noswapfile
set nobackup

" basic settings
syntax on
set ruler
set autoindent
set smartindent
set breakindent
set shiftwidth=2
set tabstop=2 softtabstop=2
set expandtab
set belloff=all
set relativenumber
set nu
set nowrap
set incsearch
set nohlsearch
set hidden
set scrolloff=16
set updatetime=50
set signcolumn=yes

" colour scheme
set colorcolumn=80
highlight ColorColumn ctermbg=238 guibg=lightgrey
highlight Normal ctermbg=none
highlight NonText ctermbg=none

" basics
filetype plugin indent on 
set ruler
set relativenumber
set nu
set nowrap
set hidden
syntax on

" tabbing
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent
set autoindent
set breakindent
set expandtab

" searching
set hlsearch
set incsearch

" setting undodir; accessible through $VIM_CONFIG/.undo directory
" $VIM_CONFIG=~/.config/.nvim
set undofile
set undodir=$VIM_CONFIG/undodir
set noswapfile
set nobackup
set nowritebackup

" additional settings
set belloff=all
set signcolumn="yes"
set smartcase
set updatetime=50
set scrolloff=16
set sidescrolloff=16
set noshowmode
set showmatch
set spelllang="en_us"

" colour scheme
set colorcolumn=80
highlight ColorColumn ctermbg=238 guibg=lightgrey
color molokai

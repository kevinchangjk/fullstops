" not meant to be loaded during normal vim
" serves as just a vimscript version of my configs
" contains core configs, equivalent to set.lua

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

" setting undodir
set undofile
set undodir
set noswapfile
set nobackup
set nowritebackup

" additional settings
set signcolumn="yes"
set smartcase
set updatetime=50
set scrolloff=16
set sidescrolloff=16
set noshowmode
set showmatch
set spelllang="en_us"

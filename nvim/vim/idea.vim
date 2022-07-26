" vimrc for Jetbrains IDEs
" IdeaVim plugin

" basics
filetype plugin indent on 
set ruler
set relativenumber
set nu
set nowrap
set hidden
syntax on

" tabbing
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
set autoindent
set breakindent
set expandtab

" searching
set hlsearch
set incsearch

" additional settings
set signcolumn="yes"
set smartcase
set updatetime=50
set scrolloff=16
set sidescrolloff=16
set noshowmode
set showmatch
set spelllang="en_us"

" remappings
let mapleader = " "

" no-ops
nnoremap <space> <nop>
nnoremap <bs> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>

" on-the-go reload vimrc
nnoremap("<leader><cr>", ":so $MYVIMRC<cr>")

" remap H and L for nav
noremap H ^
noremap J G
noremap K gg
noremap L $

" remap for joining lines
nnoremap G :join<cr>
nnoremap gg :join!<cr>
vnoremap G :join<cr>
vnoremap gg :join!<cr>

" yank to clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" navigate windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-g> <c-w>=

" jump to parent enclosing parantheses
nnoremap <silent> [[ :call searchpair('\[', '', '\]', 'b')<cr>
nnoremap <silent> ]] :call searchpair('\[', '', '\]')<cr>

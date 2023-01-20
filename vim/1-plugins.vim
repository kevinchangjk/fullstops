filetype plugin indent on

" plugins
packloadall
call plug#begin('$VIM_CONFIG/plugged')

Plug 'BurntSushi/ripgrep'
Plug 'flazz/vim-colorschemes'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'leafgarland/typescript-vim'
Plug 'tomlion/vim-solidity'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'prettier/vim-prettier', {
      \'do': 'yarn install --frozen-lockfile --production' }  
Plug 'ackyshake/VimCompletesMe'
Plug 'psliwka/vim-smoothie'
Plug 'sheerun/vim-polyglot'
Plug 'rust-lang/rust.vim'

call plug#end()

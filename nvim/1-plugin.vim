filetype plugin indent on

" plugins
packloadall
call plug#begin('$VIM_CONFIG/plugged')

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'flazz/vim-colorschemes'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'neovim/nvim-lspconfig'
Plug 'leafgarland/typescript-vim'
Plug 'tomlion/vim-solidity'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'prettier/vim-prettier', {
      \'do': 'yarn install --frozen-lockfile --production' }  
Plug 'ThePrimeagen/vim-be-good'
Plug 'ackyshake/VimCompletesMe'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'psliwka/vim-smoothie'
Plug 'sheerun/vim-polyglot'
Plug 'rust-lang/rust.vim'

call plug#end()


-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- autocommand for updating plugins upon writing
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use 'BurntSushi/ripgrep'
  use 'flazz/vim-colorschemes'
  use '$XDG_CONFIG_HOME/nvim/monokai.nvim'
  use 'mbbill/undotree'
  use 'preservim/nerdtree'
  use 'nvim-treesitter/nvim-treesitter'
  use 'neovim/nvim-lspconfig'
  use 'leafgarland/typescript-vim'
  use 'tomlion/vim-solidity'
  use 'maxmellon/vim-jsx-pretty'
  use {'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production' }  
  use 'ThePrimeagen/vim-be-good'
  use 'ackyshake/VimCompletesMe'
  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'psliwka/vim-smoothie'
  use 'sheerun/vim-polyglot'
  use 'rust-lang/rust.vim'
  use 'wakatime/vim-wakatime'
end)

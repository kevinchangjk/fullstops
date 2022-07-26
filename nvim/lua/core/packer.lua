-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- autocommand for updating plugins upon writing
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

package.path = package.path .. ";../plugins/?.lua"

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- telescope & dependencies
  use {'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-telescope/telescope-fzy-native.nvim', 
      'nvim-lua/popup.nvim', 
      'nvim-lua/plenary.nvim', 
      'BurntSushi/ripgrep'
    }
  }

  -- colorschemes
  use 'flazz/vim-colorschemes'
  use 'ful1e5/onedark.nvim'
  -- use '$XDG_CONFIG_HOME/nvim/monokai.nvim'

  -- useful utility
  use 'mbbill/undotree'
  use 'preservim/nerdtree'
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-lualine/lualine.nvim'
  use 'ackyshake/VimCompletesMe'
  use 'kyazdani42/nvim-web-devicons'
  use 'psliwka/vim-smoothie'
  use {'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production' }  

  -- lsp
  use 'sheerun/vim-polyglot'
  use 'neovim/nvim-lspconfig'
  use 'leafgarland/typescript-vim'
  use 'tomlion/vim-solidity'
  use 'maxmellon/vim-jsx-pretty'
  use 'rust-lang/rust.vim'

  -- misc stuff
  use 'ThePrimeagen/vim-be-good'
  use 'wakatime/vim-wakatime'
end)

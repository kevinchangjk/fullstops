local HOME = os.getenv("HOME")
local VIM_CONFIG = HOME .. "/.config/nvim"
local opt = vim.opt

-- main settings for nvim
opt.ruler = true
opt.nu = true
opt.relativenumber = true
opt.wrap = false
opt.hidden = true
vim.cmd([[
  syntax on
  filetype plugin indent on
  ]])

-- tabs
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.smartindent = true
opt.autoindent = true
opt.breakindent = true
opt.expandtab = true

-- searching
opt.hlsearch = false
opt.incsearch = true

-- setting undodir
opt.undofile = true
opt.undodir  = VIM_CONFIG .. "/undodir"
opt.swapfile = false
opt.backup = false
opt.writebackup = false

-- additional settings
opt.signcolumn = "yes"
opt.smartcase = true
opt.updatetime = 50
opt.scrolloff = 16
opt.sidescrolloff = 16
opt.showmode = false
opt.showmatch = true
opt.spelllang = "en_us"

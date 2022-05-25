require'lspconfig'.bashls.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.solidity_ls.setup{}
require'lspconfig'.java_language_server.setup{}
require'lualine'.setup{
  options = {
    theme = 'codedark', 
    icons_enabled = false,
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '[', right = ']' }
    }
}

require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}

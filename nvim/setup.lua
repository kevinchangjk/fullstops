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

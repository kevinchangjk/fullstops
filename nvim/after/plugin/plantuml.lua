vim.cmd([[
  au FileType plantuml let g:plantuml_previewer#plantuml_jar_path = get(
      \  matchlist(system('cat `which plantuml` | grep plantuml.jar'), '\v.*\s[''"]?(\S+plantuml\.jar).*'),
      \  1,
      \  0
      \)
]])

local nnoremap = Map.noremap("n")
nnoremap("<leader>mlp", "<cmd>PlantumlToggle<cr>")

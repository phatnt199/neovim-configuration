local vimG = vim.g

---------------------------------------------------------
--Searching | Tree
vimG.loaded_netrw = 1
vimG.loaded_netrwPlugin = 1
vimG.ag_working_path_mode = 'r'
vimG.fzf_layout = { down = '60%' }

---------------------------------------------------------
--ALE
local js_fixers = { 'prettier', 'eslint' }
vimG.ale_linters = {
  javascript = { 'eslint' },
  javascriptreact =  { 'eslint' },
  typescript = { 'eslint', 'tsserver' },
  typescriptreact = { 'eslint', 'tsserver' },
}

vimG.ale_fixers = {
  ['*'] = { 'remove_trailing_lines', 'trim_whitespace' },
  javascript = js_fixers,
  javascriptreact = js_fixers,
  typescript = js_fixers,
  typescriptreact = js_fixers,
  css = { 'prettier' },
  json = { 'prettier' },
  dart = { 'dartfmt' },
}

vimG.ale_set_highlights = 0
vimG.ale_sign_error = '✖'
vimG.ale_sign_warning = '◼'
vimG.ale_sign_info = '⚉'
vimG.ale_fix_on_save = 1
vimG.ale_completion_autoimport = 0
vimG.ale_virtualtext_cursor = 0

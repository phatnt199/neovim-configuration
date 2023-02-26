local vimG = vim.g

---------------------------------------------------------
--Comment
require('Comment').setup()

---------------------------------------------------------
--Telescope
--[[ local telescope = require('telescope')

telescope.load_extension('media_files')
telescope.setup {
  extensions = {
    media_files = {
      file_types = { 'png', 'jpg', 'jpeg', 'webp', 'pdf' },
      find_cmd = 'rg'
    }
  }
} ]]

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

---------------------------------------------------------
--DevGlow
vimG.afterglow_blackout = 1
vimG.afterglow_italic_comments = 1

---------------------------------------------------------
--Airline
vimG['airline#extensions#ale#enabled'] = 1
vimG['airline#extensions#tabline#left_sep'] = ' '
vimG['airline#extensions#tabline#left_alt_sep'] = '|'
vimG.airline_theme = 'afterglow'

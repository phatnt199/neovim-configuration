"--------------------------------------------------------------------------------
" CONFIGURATION
"--------------------------------------------------------------------------------
set runtimepath^=/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
syntax enable

lua << EOF
  require('settings.000-preload')
  require('settings.100-plugin')
  require('settings.200-tree')
  require('settings.201-comment')
  require('settings.300-lsp')
EOF

colorscheme afterglow
let g:afterglow_blackout=1
let g:afterglow_italic_comments=1

let g:ag_working_path_mode='r'

let g:ale_linters = {
      \  'javascript': ['eslint'],
      \  'javascriptreact': ['eslint'],
      \  'typescript': ['eslint', 'tsserver'],
      \  'typescriptreact': ['eslint', 'tsserver'],
      \ }

let js_fixers = ['prettier', 'eslint']
let g:ale_fixers = {
      \  '*': ['remove_trailing_lines', 'trim_whitespace'],
      \  'javascript': js_fixers,
      \  'javascriptreact': js_fixers,
      \  'typescript': js_fixers,
      \  'typescriptreact': js_fixers,
      \  'css': ['prettier'],
      \  'json': ['prettier'],
      \  'dart': ['dartfmt'],
      \ }

let g:ale_set_highlights = 0
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '◼'
let g:ale_sign_info = '⚉'
let g:ale_fix_on_save = 1
let g:ale_completion_autoimport = 0

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='afterglow'

"--------------------------------------------------------------------------------
" KEYMAPS
"--------------------------------------------------------------------------------
nmap <C-s>                :w<CR>
nmap <C-z>                :undo<CR>
nmap <C-y>                :redo<CR>
nmap <C-Up>               :resize -2<CR>
nmap <C-Down>             :resize +2<CR>

nmap <C-f>                :Telescope current_buffer_fuzzy_find<CR>
nmap <C-p>                :Telescope git_files<CR>
nmap <C-r>                :Telescope find_files<CR>
nmap <leader>ff           :Telescope live_grep<CR>
nmap <leader>fs           :Telescope grep_string<CR>
nmap <C-b>                :NvimTreeToggle<CR>
nmap <leader>r            :NvimTreeRefresh<CR>
nmap nf                   :NvimTreeFindFile<CR>
nmap <space>e             :lua vim.diagnostic.open_float()<CR>
nmap [d                   :lua vim.diagnostic.goto_prev()<CR>
nmap ]d                   :lua vim.diagnostic.goto_next()<CR>
nmap <space>q             :lua vim.diagnostic.setloclist()<CR>
nmap gD                   :lua vim.lsp.buf.declaration()<CR>
nmap gd                   :lua vim.lsp.buf.definition()<CR>
nmap K                    :lua vim.lsp.buf.hover()<CR>
nmap gi                   :lua vim.lsp.buf.implementation()<CR>
nmap <C-k>                :lua vim.lsp.buf.signature_help()<CR>
nmap <leader>D            :lua vim.lsp.buf.type_definition()<CR>
nmap <leader>rn           :lua vim.lsp.buf.rename()<CR>
nmap <leader>ac           :lua vim.lsp.buf.code_action()<CR>
nmap gr                   :lua vim.lsp.buf.references()<CR>
nmap ff                   :lua vim.lsp.buf.formatting()<CR>

nmap <leader>T            :tabnew<CR>
nmap <leader>tn           :tabnext<CR>
nmap <leader>tb           :tabprevious<CR>
nmap <leader>tf           :tabfirst<CR>
nmap <leader>tl           :tablast<CR>
nmap <leader>tm           :tabmove<CR>
nmap <leader>tx           :tabclose<CR>

imap jk                   <Esc>
imap <expr> <Tab>         pumvisible() ? "\<C-n>" : "\<Tab>"
imap <expr> <S-Tab>       pumvisible() ? "\<C-p>" : "\<S-Tab>"

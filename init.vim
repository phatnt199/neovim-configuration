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

let g:seoul256_background = 233
colorscheme seoul256

let g:ag_working_path_mode='r'

let g:ale_linters = {
      \  'javascript': ['eslint'],
      \  'typescript': ['eslint', 'tsserver'],
      \ }

let js_fixers = ['prettier', 'eslint']
let g:ale_fixers = {
      \  '*': ['remove_trailing_lines', 'trim_whitespace'],
      \  'javascript': js_fixers,
      \  'typescript': js_fixers,
      \  'css': ['prettier'],
      \  'json': ['prettier'],
      \  'dart': ['dartfmt'],
      \ }

let g:ale_sign_error = 'x'
let g:ale_sign_warning = 'o'
let g:ale_sign_info = 'i'
let g:ale_fix_on_save = 1
let g:ale_completion_autoimport = 0

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='seoul256'

"--------------------------------------------------------------------------------
" KEYMAPS
"--------------------------------------------------------------------------------
nmap <C-s>                :w<CR>
nmap <C-z>                :undo<CR>
nmap <C-y>                :redo<CR>
nmap <C-f>                :BLines<CR>
nmap <C-p>                :GFiles<CR>
nmap <C-r>                :FZF<CR>
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

imap jk                   <Esc>
imap <expr> <Tab>         pumvisible() ? "\<C-n>" : "\<Tab>"
imap <expr> <S-Tab>       pumvisible() ? "\<C-p>" : "\<S-Tab>"

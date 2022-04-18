"--------------------------------------------------------------------------------
" CONFIGURATION
"--------------------------------------------------------------------------------
set runtimepath^=/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
syntax enable

lua << EOF
  require('settings.preload')
  require('settings.plugin')
  require('settings.cmp')
  require('settings.lsp')
EOF

let g:seoul256_background = 233
colorscheme seoul256

let NERDTreeShowHidden = 1
let g:ag_working_path_mode='r'

let g:ale_linters = {
      \  'javascript': ['eslint'],
      \  'typescript': ['eslint'],
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
nmap <C-f>                :BLines<CR>
nmap <C-p>                :GFiles<CR>
nmap <C-r>                :FZF<CR>
nmap <C-s>                :w<CR>
nmap <C-b>                :NERDTreeToggle<CR>
nmap <C-z>                :undo<CR>
nmap <C-y>                :redo<CR>
nmap nf                   :NERDTreeFind<CR>
nmap <silent><space>e     :lua vim.diagnostic.open_float()<CR>
nmap <silent>[d           :lua vim.diagnostic.goto_prev()<CR>
nmap <silent>]d           :lua vim.diagnostic.goto_next()<CR>
nmap <silent><space>q     :lua vim.diagnostic.setloclist()<CR>
nmap <silent>gD           :lua vim.lsp.buf.declaration()<CR>
nmap <silent>gd           :lua vim.lsp.buf.definition()<CR>
nmap <silent>K            :lua vim.lsp.buf.hover()<CR>
nmap <silent>gi           :lua vim.lsp.buf.implementation()<CR>
nmap <silent><C-k>        :lua vim.lsp.buf.signature_help()<CR>
nmap <silent><leader>D    :lua vim.lsp.buf.type_definition()<CR>
nmap <silent><leader>rn   :lua vim.lsp.buf.rename()<CR>
nmap <silent><leader>ac   :lua vim.lsp.buf.code_action()<CR>
nmap <silent>gr           :lua vim.lsp.buf.references()<CR>
nmap <silent>ff           :lua vim.lsp.buf.formatting()<CR>

imap jk                   <Esc>
imap <expr> <Tab>         pumvisible() ? "\<C-n>" : "\<Tab>"
imap <expr> <S-Tab>       pumvisible() ? "\<C-p>" : "\<S-Tab>"

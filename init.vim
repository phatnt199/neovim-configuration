"--------------------------------------------------------------------------------
" CONFIGURATION
"--------------------------------------------------------------------------------
set runtimepath^=/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
syntax enable

lua << EOF
  require('settings.000-preload')
  require('settings.100-plugin')
  require('settings.101-plugin-config')
EOF

colorscheme afterglow

let g:afterglow_blackout=1
let g:afterglow_italic_comments=1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='afterglow'

lua << EOF
  require('settings.200-tree')
  require('settings.201-comment')
  require('settings.300-lsp')
EOF

"--------------------------------------------------------------------------------
" KEYMAPS
"--------------------------------------------------------------------------------
nmap <C-s>                :w<CR>
nmap <C-z>                :undo<CR>
nmap <C-y>                :redo<CR>
nmap <C-Up>               :resize -2<CR>
nmap <C-Down>             :resize +2<CR>

nmap <C-f>                :BLines<CR>
nmap <C-p>                :GFiles<CR>
nmap <C-r>                :FZF<CR>
nmap <leader>fa           :Ag<SPACE>
nmap <leader>ff           :Rg<CR>
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
nmap ff                   :lua vim.lsp.buf.format({ async=true })<CR>

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

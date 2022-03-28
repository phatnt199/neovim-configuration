set runtimepath^=/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

"--------------------------------------------------------------------------------
" PRELOAD
"--------------------------------------------------------------------------------
syntax enable

set hidden
set smartindent
set expandtab
set showmatch
set secure
set nowrap
set smartcase
set relativenumber
set nobackup
set nowritebackup
set lazyredraw
set tabstop=2
set shiftwidth=2
set softtabstop=2
set laststatus=2
set encoding=utf-8
set completeopt=menu,menuone,noselect
set shortmess+=c
set background=dark
"set cmdheight=2

"--------------------------------------------------------------------------------
" PLUGINS
"--------------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" General
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rking/ag.vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'dense-analysis/ale'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Javascript
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

" Dart/Flutter
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'

" Theme
Plug 'junegunn/seoul256.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lilydjwg/colorizer'

call plug#end()

"--------------------------------------------------------------------------------
" CONFIGURATION
"--------------------------------------------------------------------------------
let g:seoul256_background = 233
colorscheme seoul256

let NERDTreeShowHidden = 1
let g:ag_working_path_mode='r'

let g:ale_linters = {
      \  'javascript': ['eslint'],
      \  'typescript': ['eslint']
      \ }

let js_fixers = ['prettier', 'eslint']
let g:ale_fixers = {
      \  '*': ['remove_trailing_lines', 'trim_whitespace'],
      \  'javascript': js_fixers,
      \  'javascript.jsx': js_fixers,
      \  'typescript': js_fixers,
      \  'typescriptreact': js_fixers,
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

lua << EOF
local cmp = require'cmp'
local cmpLsp = require'cmp_nvim_lsp'

cmp.setup({
snippet = {
  expand = function(args)
  vim.fn["vsnip#anonymous"](args.body)
end,
},
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable,
      ['<C-e>'] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close(), }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ["<Tab>"] = cmp.mapping.select_next_item(),
      ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    },
  sources = cmp.config.sources(
  { { name = 'nvim_lsp' }, { name = 'vsnip' }, },
  { { name = 'buffer' }, }
  )
})

--require'lspconfig'.tsserver.setup {}

local capabilities = cmpLsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
require'lspconfig'.dartls.setup {
  capabilities = capabilities
}
EOF

"--------------------------------------------------------------------------------
" FUNCTIONS
"--------------------------------------------------------------------------------

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
imap <C-x><C-l>           <plug>(fzf-complete-line)
imap <expr> <Tab>         pumvisible() ? "\<C-n>" : "\<Tab>"
imap <expr> <S-Tab>       pumvisible() ? "\<C-p>" : "\<S-Tab>"

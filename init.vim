set runtimepath^=/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

"--------------------------------------------------------------------------------
" PRELOAD
"--------------------------------------------------------------------------------
syntax enable

set hidden
set smartindent
set expandtab
set ts=2 sw=2
set softtabstop=2
set showmatch

set secure
set laststatus=2
set nowrap
set encoding=utf-8
set smartcase
set relativenumber
set nobackup
set nowritebackup
set cmdheight=2
set completeopt=menuone,noinsert,noselect
set shortmess+=c

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
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-lua/completion-nvim'

" Javascript
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

" Dart/Flutter
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'

" Theme
Plug 'danilo-augusto/vim-afterglow'
Plug 'vim-airline/vim-airline'
Plug 'lilydjwg/colorizer'

call plug#end()

"--------------------------------------------------------------------------------
" CONFIGURATION
"--------------------------------------------------------------------------------
colorscheme afterglow
let g:afterglow_blackout=1

let NERDTreeShowHidden = 1
let g:ag_working_path_mode='r'

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='afterglow'

lua << EOF
local lspConfig = require('lspconfig')
local saga = require('lspsaga')

local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
-- Enable completion triggered by <c-x><c-o>
vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

-- Mappings.
-- See `:help vim.lsp.*` for documentation on any of the below functions
vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ac', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ff', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

vim.api.nvim_buf_set_keymap(bufnr, 'i', '<C-space>', '<cmd>lua vim.lsp.buf.completion()<CR>', opts)
end

local servers = { 'tsserver', 'dartls' }
for _, lsp in pairs(servers) do
  lspConfig[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
      }
    }

  saga.init_lsp_saga {
    error_sign = 'e',
    warn_sign = 'w',
    hint_sign = 'h',
    infor_sign = 'i',
    border_style = "round",
    }
end
EOF

"--------------------------------------------------------------------------------
" FUNCTIONS
"--------------------------------------------------------------------------------

"--------------------------------------------------------------------------------
" KEYMAPS
"--------------------------------------------------------------------------------
nmap <C-f>        :BLines<CR>
nmap <C-p>        :GFiles<CR>
nmap <C-r>        :FZF<CR>
nmap <C-s>        :w<CR>
nmap <C-b>        :NERDTreeToggle<CR>
nmap <C-z>        :undo<CR>
nmap <C-y>        :redo<CR>
nmap nf           :NERDTreeFind<CR>
nmap <silent>K    :Lspsaga hover_doc<CR>
nmap <silent>gh   <Cmd>Lspsaga lsp_finder<CR>

imap jk           <Esc>
imap <C-x><C-l>   <plug>(fzf-complete-line)
imap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>
imap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
imap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

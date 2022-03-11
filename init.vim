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
"set updatetime=500
set completeopt=noinsert,noselect,menuone
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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'chiel92/vim-autoformat'
Plug 'w0rp/ale'

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

let g:ale_linters = {
      \  'javascript': ['eslint'],
      \  'typescript': ['eslint']
      \ }
let g:ale_fixers = {
      \  '*': ['remove_trailing_lines', 'trim_whitespace'],
      \  'javascript': ['prettier', 'eslint'],
      \  'typescript': ['prettier', 'eslint'],
      \  'dart': ['dartfmt'],
      \ }

let g:ale_sign_error = 'x'
let g:ale_sign_warning = 'o'
let g:ale_fix_on_save = 1

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='afterglow'

let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-json',
      \ 'coc-flutter',
      \ 'coc-yaml',
      \ 'coc-css',
      \ 'coc-html',
      \ 'coc-json',
      \ ]

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
nmap ff           :Autoformat<CR>
nmap nf           :NERDTreeFind<CR>
nmap <leader>ac   :CocAction<CR>
nmap <leader>rn   <Plug>(coc-rename)
nmap <silent> gd  <Plug>(coc-definition)
nmap <silent> gy  <Plug>(coc-type-definition)
nmap <silent> gi  <Plug>(coc-implementation)
nmap <silent> gr  <Plug>(coc-references)

imap jk           <Esc>
imap <C-x><C-l>  <plug>(fzf-complete-line)
imap <silent><expr> <C-space> coc#refresh()
imap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
imap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

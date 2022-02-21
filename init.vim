set runtimepath^=/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

"--------------------------------------------------------------------------------
" PRELOAD
"--------------------------------------------------------------------------------
syntax enable

set relativenumber
set expandtab
set tabstop=2
set softtabstop=0 noexpandtab
set shiftwidth=2
set smartindent
set showmatch
set secure
set completeopt-=preview
set laststatus=2
set nowrap
set encoding=utf-8
set smartcase
set nohlsearch
set noswapfile
set incsearch

"--------------------------------------------------------------------------------
" PLUGINS
"--------------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" Javascript
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdcommenter'
Plug 'prettier/vim-prettier'

" Dart
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/dartlang-snippets'

" Utilities
Plug 'lilydjwg/colorizer'
Plug 'danilo-augusto/vim-afterglow'
Plug 'vim-airline/vim-airline'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Plug 'valloric/youcompleteme'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'

Plug 'rking/ag.vim'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'

Plug 'jiangmiao/auto-pairs'
Plug 'chiel92/vim-autoformat'

call plug#end()

"--------------------------------------------------------------------------------
" CONFIGURATION
"--------------------------------------------------------------------------------
colorscheme afterglow

let g:ale_linters = {
			\  'javascript': ['eslint'],
			\  'typescript': ['eslint']
			\}
let g:ale_fixers = {
			\  '*': ['remove_trailing_lines', 'trim_whitespace'],
			\  'javascript': ['prettier', 'eslint'],
			\  'typescript': ['prettier', 'eslint']
			\}

let g:ale_sign_error = 'x'
let g:ale_sign_warning = 'o'
let g:ale_fix_on_save = 1

let g:ag_working_path_mode='r'

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let NERDTreeShowHidden = 1

let python_highlight_all = 1

let g:airline_theme='afterglow'
let g:afterglow_blackout=1

let g:dart_format_on_save = 1
let g:dartfmt_options = ['--fix', '--line-length 160']
let g:coc_global_extensions = [
			\ 'coc-snippets',
			\ 'coc-tsserver',
			\ 'coc-eslint',
			\ 'coc-prettier',
			\ 'coc-json',
			\ 'coc-flutter',
			\ 'coc-yaml',
			\ 'coc-tslint-plugin',
			\ 'coc-tsserver',
			\ 'coc-emmet',
			\ 'coc-css',
			\ 'coc-html',
			\ 'coc-json',
			\ ]

let g:NERDTreeGitStatusWithFlags = 1
let g:UltiSnipsExpandTrigger = '<Nop>'

"--------------------------------------------------------------------------------
" FUNCTIONS
"--------------------------------------------------------------------------------

"--------------------------------------------------------------------------------
" KEYMAPS
"--------------------------------------------------------------------------------
map  <C-f>	:BLines<CR>
map  <C-p>	:GFiles<CR>
map  <C-r>	:FZF<CR>
map  <C-s>	:w<CR>
map  <C-b>	:NERDTreeToggle<CR>
map  <C-z>	:undo<CR>
map  <C-y>	:redo<CR>
map  ff			:Autoformat<CR>
map  nf			:NERDTreeFind<CR>

nmap <S-k>         i<CR><ESC>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn --<Plug>(coc-rename)
nmap <leader>a  <Plug>(coc-codeaction-selected)

imap jk <Esc>
imap <C-x><C-l>  <plug>(fzf-complete-line)

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', { branch = '0.1.x' })
Plug 'nvim-telescope/telescope-media-files.nvim'

Plug 'jose-elias-alvarez/null-ls.nvim'
Plug('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
Plug 'numToStr/Comment.nvim'
Plug 'sindrets/diffview.nvim'

Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'

Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

Plug 'nvim-lualine/lualine.nvim'

-- Color Scheme
Plug 'lilydjwg/colorizer'
Plug 'phatnt199/devglow'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'junegunn/seoul256.vim'

vim.call('plug#end')

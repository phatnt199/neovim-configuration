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
Plug ('nvim-telescope/telescope.nvim', { branch = '0.1.x' })
Plug 'nvim-telescope/telescope-media-files.nvim'

Plug 'mhartington/formatter.nvim'
Plug ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
Plug 'numToStr/Comment.nvim'
Plug 'windwp/nvim-autopairs'

Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

Plug 'nvim-lualine/lualine.nvim'

-- Color Scheme
Plug 'lilydjwg/colorizer'
Plug 'phatnt199/devglow'

vim.call('plug#end')

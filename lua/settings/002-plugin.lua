local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'numToStr/Comment.nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug('nvim-telescope/telescope.nvim', { branch = '0.1.x' })
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug('akinsho/toggleterm.nvim', { tag = '*' })

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'

Plug 'nvim-lualine/lualine.nvim'
Plug 'lilydjwg/colorizer'

-- Color Scheme
Plug 'phatnt199/devglow'
Plug 'iibe/gruvbox-high-contrast'
Plug('kaicataldo/material.vim', { branch = 'main' })

vim.call('plug#end')

---------------------------------------------------------
--DevGlow
vim.cmd('colorscheme afterglow')
vim.g.afterglow_blackout = 1
vim.g.afterglow_italic_comments = 1

---------------------------------------------------------
--Searching | Tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.ag_working_path_mode = 'r'
vim.g.fzf_layout = { down = '60%' }

---------------------------------------------------------
--LuaLine
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'codedark',
    component_separators = { left = ' | ', right = '|'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

---------------------------------------------------------
--Comment
require('Comment').setup()

---------------------------------------------------------
--NvimTree
require('nvim-tree').setup {
  renderer = {
    icons = {
      webdev_colors = true,
      git_placement = "before",
      modified_placement = "after",
      padding = " ",
      symlink_arrow = "➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        --[[ default = "",
        symlink = "■",
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
        folder = {
          arrow_open = "▼",
          arrow_closed = "►",
          default = "►",
          open = "▼",
          empty = "",
          empty_open = "",
          symlink = "►",
          symlink_open = "▼",
        }, ]]
      }
    }
  },
  git = {
    enable = false,
    ignore = false,
    timeout = 400,
  },
}

local function openNvimTree()
  require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = openNvimTree })

---------------------------------------------------------
--NullLS
local nullLs = require('null-ls')
local formatting = nullLs.builtins.formatting
nullLs.setup({
  sources = {
    formatting.eslint,
    formatting.prettier,
    formatting.stylelint,
    formatting.fixjson,
    formatting.mdformat,
    formatting.sqlformat,
    formatting.dart_format,
  }
})

---------------------------------------------------------
--Telescope
local telescope = require('telescope')
telescope.load_extension('media_files')
telescope.setup {
  extensions = {
    media_files = {
      file_types = { 'png', 'jpg', 'jpeg', 'webp', 'pdf' },
      find_cmd = 'rg'
    }
  }
}

---------------------------------------------------------
--Shade
require('shade').setup({
  overlay_opacity = 80,
  opacity_step = 1,
  keys = {
    brightness_up    = '<C-Up>',
    brightness_down  = '<C-Down>',
    toggle           = '<Leader>s',
  }
})

---------------------------------------------------------
--Keymaps
vim.cmd [[
  nmap <C-s>                :w<CR>
  nmap <C-z>                :undo<CR>
  nmap <C-y>                :redo<CR>
  nmap <C-Up>               :resize -2<CR>
  nmap <C-Down>             :resize +2<CR>

  nmap <C-f>                :Telescope current_buffer_fuzzy_find<CR>
  nmap <C-p>                :Telescope git_files<CR>
  nmap <C-r>                :Telescope find_files<CR>
  nmap <leader>ff           :Telescope live_grep<CR>
  nmap <leader>fs           :Telescope grep_string<CR>
  nmap <leader>gc           :Telescope git_commits<CR>
  nmap <leader>gst          :Telescope git_status<CR>
  nmap <leader>gb           :Telescope git_branches<CR>

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
  nmap <leader>oi           :lua vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })<CR>
  nmap gr                   :lua vim.lsp.buf.references()<CR>
  nmap ff                   :lua vim.lsp.buf.format({ async = true, timeout_ms = 2000 })<CR>

  nmap <C-t>                :tabnew<CR>
  nmap <C-x>                :tabclose<CR>

  imap jk                   <Esc>
]]

---------------------------------------------------------
--ALE
--[[ local js_fixers = { 'prettier', 'eslint' }
vim.g.ale_linters = {
  javascript = { 'eslint' },
  javascriptreact =  { 'eslint' },
  typescript = { 'eslint', 'tsserver' },
  typescriptreact = { 'eslint', 'tsserver' },
}

vim.g.ale_fixers = {
  ['*'] = { 'remove_trailing_lines', 'trim_whitespace' },
  javascript = js_fixers,
  javascriptreact = js_fixers,
  typescript = js_fixers,
  typescriptreact = js_fixers,
  css = { 'prettier' },
  json = { 'prettier' },
  dart = { 'dartfmt' },
}

vim.g.ale_set_highlights = 0
vim.g.ale_sign_error = '✖'
vim.g.ale_sign_warning = '◼'
vim.g.ale_sign_info = '⚉'
vim.g.ale_fix_on_save = 1
vim.g.ale_completion_autoimport = 0
vim.g.ale_virtualtext_cursor = 0 ]]

---------------------------------------------------------
--LuaLine
require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'seoul256',
    component_separators = { left = '|', right = '|' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = { statusline = {}, winbar = {}, },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = { statusline = 1000, tabline = 1000, winbar = 1000, }
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
})

---------------------------------------------------------
--Comment
require('Comment').setup()

---------------------------------------------------------
--Toggle Term
require('toggleterm').setup({
  size = 20,
  open_mapping = [[<c-\>]],
  direction = 'horizontal',
})

---------------------------------------------------------
--NvimTree
require('nvim-tree').setup({
  disable_netrw = true,
  hijack_netrw = true,
  open_on_tab = false,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  renderer = {
    icons = { 
      webdev_colors = true 
    },
  },
  git = { enable = false, ignore = false, timeout = 400 },
  view = { cursorline = false },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    show_on_open_dirs = false,
    debounce_delay = 20,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "✖",
    },
  },
})

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
--Keymaps
vim.cmd [[
  nmap <C-s>                :w<CR>
  nmap <C-z>                :undo<CR>
  nmap <C-y>                :redo<CR>
  nmap <C-Up>               :resize -2<CR>
  nmap <C-Down>             :resize +2<CR>

  nmap <leader>ts           :Telescope<CR>
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
  nmap nf                   :NvimTreeFocus<CR>
  nmap <leader>rf           :luafile %<CR>
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
--DevGlow
vim.cmd('colorscheme devglow')
vim.g.devglow_blackout = 1
vim.g.devglow_italic_comments = 1

vim.cmd [[
  hi! Pmenu guibg=#333333
  sign define DiagnosticSignError text=✖ texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
  sign define DiagnosticSignWarn text=◼ texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
  sign define DiagnosticSignInfo text=! texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
  sign define DiagnosticSignHint text=⚉ texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
]]

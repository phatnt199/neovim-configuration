local keymaps = {
  { mode = 'n', shortcut = '<C-s>',        fn = ':w<CR>' },
  { mode = 'n', shortcut = '<M-k>',        fn = '<C-y>'},
  { mode = 'n', shortcut = '<M-j>',        fn = '<C-e>'},
  { mode = 'n', shortcut = '<M-h>',        fn = 'zh'},
  { mode = 'n', shortcut = '<M-l>',        fn = 'zl'},
  { mode = 'n', shortcut = '<C-z>',        fn = ':undo<CR>'},
  { mode = 'n', shortcut = '<C-y>',        fn = ':redo<CR>'},
  { mode = 'n', shortcut = '<C-Up>',       fn = ':resize -2<CR>'},
  { mode = 'n', shortcut = '<C-Down>',     fn = ':resize +2<CR>'},
  { mode = 'n', shortcut = '<leader>rf',   fn = ':luafile %<CR>'},

  { mode = 'n', shortcut = '<leader>ts',   fn = ':Telescope<CR>'},
  { mode = 'n', shortcut = '<C-f>',        fn = ':Telescope current_buffer_fuzzy_find<CR>'},
  { mode = 'n', shortcut = '<C-p>',        fn = ':Telescope git_files<CR>'},
  { mode = 'n', shortcut = '<C-r>',        fn = ':Telescope find_files<CR>'},
  { mode = 'n', shortcut = '<leader>ff',   fn = ':Telescope live_grep<CR>'},
  { mode = 'n', shortcut = '<leader>fs',   fn = ':Telescope grep_string<CR>'},
  { mode = 'n', shortcut = '<leader>gc',   fn = ':Telescope git_commits<CR>'},
  { mode = 'n', shortcut = '<leader>gst',  fn = ':Telescope git_status<CR>'},
  { mode = 'n', shortcut = '<leader>gbr',   fn = ':Telescope git_branches<CR>'},

  { mode = 'n', shortcut = 'nv',           fn = ':NvimTreeToggle<CR>'},
  { mode = 'n', shortcut = 'nr',           fn = ':NvimTreeRefresh<CR>'},
  { mode = 'n', shortcut = 'nf',           fn = ':NvimTreeFocus<CR>'},

  { mode = 'n', shortcut = '<space>e',     fn = ':lua vim.diagnostic.open_float()<CR>'},
  { mode = 'n', shortcut = ']d',           fn = ':lua vim.diagnostic.goto_next()<CR>'},
  { mode = 'n', shortcut = '[d',           fn = ':lua vim.diagnostic.goto_prev()<CR>'},
  { mode = 'n', shortcut = '<space>q',     fn = ':lua vim.diagnostic.setloclist()<CR>'},
  { mode = 'n', shortcut = 'gD',           fn = ':lua vim.lsp.buf.declaration()<CR>'},
  { mode = 'n', shortcut = 'gd',           fn = ':lua vim.lsp.buf.definition()<CR>'},
  { mode = 'n', shortcut = 'K',            fn = ':lua vim.lsp.buf.hover()<CR>'},
  { mode = 'n', shortcut = 'gi',           fn = ':lua vim.lsp.buf.implementation()<CR>'},
  { mode = 'n', shortcut = '<C-k>',        fn = ':lua vim.lsp.buf.signature_help()<CR>'},
  { mode = 'n', shortcut = '<leader>D',    fn = ':lua vim.lsp.buf.type_definition()<CR>'},
  { mode = 'n', shortcut = '<leader>rn',   fn = ':lua vim.lsp.buf.rename()<CR>'},
  { mode = 'n', shortcut = '<leader>ac',   fn = ':lua vim.lsp.buf.code_action()<CR>'},
  { mode = 'n', shortcut = '<leader>oi',   fn = ':lua vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })<CR>'},
  { mode = 'n', shortcut = 'gr',           fn = ':lua vim.lsp.buf.references()<CR>'},
  { mode = 'n', shortcut = 'ff',           fn = ':FormatWrite<CR>'},

  { mode = 'n', shortcut = '<C-t>',        fn = ':tabnew<CR>'},
  { mode = 'n', shortcut = '<C-x>',        fn = ':tabclose<CR>'},

  { mode = 'i', shortcut = 'jk',           fn = '<Esc>'},

  { mode = 'v', shortcut = 'J',            fn = ':m \'>+1<CR>gv=gv'},
  { mode = 'v', shortcut = 'K',            fn = ':m \'<-2<CR>gv=gv'},

  { mode = 'x', shortcut = '<leader>p',    fn = '\"_dP'},
  { mode = 'n', shortcut = '<leader>y',    fn = '\"+y'},
  { mode = 'v', shortcut = '<leader>y',    fn = '\"+y'},
  { mode = 'n', shortcut = '<leader>Y',    fn = '\"+Y'},

  { mode = 'n', shortcut = '<leader>gl',   fn = ':diffget LOCAL'},
  { mode = 'n', shortcut = '<leader>gb',   fn = ':diffget BASE'},
  { mode = 'n', shortcut = '<leader>gr',   fn = ':diffget REMOTE'},
}

for index in ipairs(keymaps) do
  local keymap = keymaps[index]
  vim.keymap.set(keymap.mode, keymap.shortcut, keymap.fn)
end

vim.cmd [[
  sign define DiagnosticSignError text=✖  texthl=DiagnosticSignError  linehl=   numhl=DiagnosticLineNrError
  sign define DiagnosticSignWarn  text=◼  texthl=DiagnosticSignWarn   linehl=   numhl=DiagnosticLineNrWarn
  sign define DiagnosticSignInfo  text=!  texthl=DiagnosticSignInfo   linehl=   numhl=DiagnosticLineNrInfo
  sign define DiagnosticSignHint  text=⚉  texthl=DiagnosticSignHint   linehl=   numhl=DiagnosticLineNrHint
]]

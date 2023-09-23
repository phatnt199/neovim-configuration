vim.keymap.set('n', '<C-s>',       ':w<CR>')
vim.keymap.set('n', '<M-k>',       '<C-y>')
vim.keymap.set('n', '<M-j>',       '<C-e>')
vim.keymap.set('n', '<M-h>',       'zh')
vim.keymap.set('n', '<M-l>',       'zl')

vim.keymap.set('n', '<C-z>',       ':undo<CR>')
vim.keymap.set('n', '<C-y>',       ':redo<CR>')

vim.keymap.set('n', '<C-Up>',      ':resize -2<CR>')
vim.keymap.set('n', '<C-Down>',    ':resize +2<CR>')

vim.keymap.set('n', '<leader>ts',  ':Telescope<CR>')
vim.keymap.set('n', '<C-f>',       ':Telescope current_buffer_fuzzy_find<CR>')
vim.keymap.set('n', '<C-p>',       ':Telescope git_files<CR>')
vim.keymap.set('n', '<C-r>',       ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>ff',  ':Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>fs',  ':Telescope grep_string<CR>')
vim.keymap.set('n', '<leader>gc',  ':Telescope git_commits<CR>')
vim.keymap.set('n', '<leader>gst', ':Telescope git_status<CR>')
vim.keymap.set('n', '<leader>gb',  ':Telescope git_branches<CR>')

vim.keymap.set('n', '<C-b>',       ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>r',   ':NvimTreeRefresh<CR>')
vim.keymap.set('n', 'nf',          ':NvimTreeFocus<CR>')
vim.keymap.set('n', '<leader>rf',  ':luafile %<CR>')

vim.keymap.set('n', '<leader>dv',  ':DiffviewOpen<CR>')

vim.keymap.set('n', '<space>e',    ':lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', ']d',          ':lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', '[d',          ':lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', '<space>q',    ':lua vim.diagnostic.setloclist()<CR>')
vim.keymap.set('n', 'gD',          ':lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', 'gd',          ':lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'K',           ':lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', 'gi',          ':lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', '<C-k>',       ':lua vim.lsp.buf.signature_help()<CR>')
vim.keymap.set('n', '<leader>D',   ':lua vim.lsp.buf.type_definition()<CR>')
vim.keymap.set('n', '<leader>rn',  ':lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', '<leader>ac',  ':lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', '<leader>oi',  ':lua vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })<CR>')
vim.keymap.set('n', 'gr',          ':lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', 'ff',          ':lua vim.lsp.buf.format({ async = true })<CR>')

vim.keymap.set('n', '<C-t>',       ':tabnew<CR>')
vim.keymap.set('n', '<C-x>',       ':tabclose<CR>')

vim.keymap.set('i', 'jk',          '<Esc>')

vim.keymap.set('v', 'J',           ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K',           ':m \'<-2<CR>gv=gv')

vim.keymap.set('x', '<leader>p',   '\"_dP')

vim.keymap.set('n', '<leader>y',   '\"+y')
vim.keymap.set('v', '<leader>y',   '\"+y')
vim.keymap.set('n', '<leader>Y',   '\"+Y')

vim.cmd [[
  sign define DiagnosticSignError text=✖ texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
  sign define DiagnosticSignWarn text=◼ texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
  sign define DiagnosticSignInfo text=! texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
  sign define DiagnosticSignHint text=⚉ texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
]]

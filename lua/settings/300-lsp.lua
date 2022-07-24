local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable,
    ['<C-e>'] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close(), }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'path' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  })
})

local cmpLsp = require'cmp_nvim_lsp'
local capabilities = cmpLsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
local flags = { debounce_text_changes = 150 }
local handlers = {
  ["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    underline = true,
    update_in_insert = false,
  }),
}

local defaultConfigs =

require('lspconfig').dartls.setup { capabilities = capabilities, flags = flags, handlers = handlers }
require('lspconfig').tsserver.setup { capabilities = capabilities, flags = flags, handlers = handlers }
require('lspconfig').rust_analyzer.setup { capabilities = capabilities, flags = flags, handlers = handlers }

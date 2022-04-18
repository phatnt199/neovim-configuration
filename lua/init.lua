local cmp = require'cmp'
local cmpLsp = require'cmp_nvim_lsp'

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
  sources = cmp.config.sources(
  { { name = 'nvim_lsp' }, { name = 'vsnip' }, },
  { { name = 'buffer' }, }
  )
})

local capabilities = cmpLsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
require'lspconfig'.tsserver.setup {
  capabilities = capabilities
}

require'lspconfig'.dartls.setup {
  capabilities = capabilities
}

local cmpLsp = require'cmp_nvim_lsp'
local capabilities = cmpLsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig').dartls.setup {
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  }
}

require('lspconfig').tsserver.setup {
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = false,
      underline = true,
      update_in_insert = false,
    }
    ),
  }
}

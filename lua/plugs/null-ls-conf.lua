local mod = require('null-ls')
local formatting = mod.builtins.formatting

mod.setup({
  sources = {
    formatting.prettier,
    formatting.eslint,
    formatting.stylelint,
    formatting.fixjson,
    formatting.mdformat,
    formatting.sqlformat,
    formatting.dart_format,
  }
})

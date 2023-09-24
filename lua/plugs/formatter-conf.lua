local mod = require("formatter")

mod.setup {
  logging = false,
  log_level = vim.log.levels.WARN,
  filetype = {
    dart = { require("formatter.filetypes.dart").dartformat },
    html = { require("formatter.filetypes.javascript").prettier },
    java = { require("formatter.filetypes.java").clangformat },
    javascript = { require("formatter.filetypes.javascript").prettier },
    javascriptreact = { require("formatter.filetypes.javascriptreact").prettier },
    json = { require("formatter.filetypes.json").prettier },
    lua = { require("formatter.filetypes.lua").stylua },
    markdown = { require("formatter.filetypes.markdown").prettier },
    python = { require("formatter.filetypes.python").autopep8},
    rust = { require("formatter.filetypes.rust").rustfmt},
    sh = { require("formatter.filetypes.sh").shfmt},
    sql = { require("formatter.filetypes.sql").pgformat},
    toml = { require("formatter.filetypes.toml").taplo},
    typescript = { require("formatter.filetypes.typescript").prettier },
    typescriptreact = { require("formatter.filetypes.typescriptreact").prettier },
    yaml = { require("formatter.filetypes.yaml").prettier },
    ["*"] = { require("formatter.filetypes.any").remove_trailing_whitespace }
  }
}

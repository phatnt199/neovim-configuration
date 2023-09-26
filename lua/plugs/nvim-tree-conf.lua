local mod = require('nvim-tree')

mod.setup({
  disable_netrw = true,
  hijack_netrw = true,
  open_on_tab = false,
  update_focused_file = {
    enable = true,
    ignore_list = {},
  },
  renderer = {
    icons = {
      webdev_colors = true,
    },
  },
  git = { 
    enable = false, 
    ignore = false, 
    timeout = 400,
  },
  view = { 
    cursorline = false,
  },
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

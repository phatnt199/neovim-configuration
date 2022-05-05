local vimG = vim.g

vimG.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 0,
}

vimG.nvim_tree_icons = {
  default = "■",
  symlink = "■",
  git = {
    unstaged = "",
    staged = "",
    unmerged = "",
    renamed = "",
    untracked = "",
    deleted = "",
    ignored = ""
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
  },
}

require'nvim-tree'.setup {
   git = {
    enable = false,
    ignore = false,
    timeout = 400,
  },
}

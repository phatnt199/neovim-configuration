local vimG = vim.g

vimG.nvim_tree_show_icons = {
  git = 0,
  folders = 0,
  files = 0,
}

vimG.nvim_tree_icons = {
  default = "",
  symlink = "",
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
    arrow_open = "",
    arrow_closed = "",
    default = "f",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
    symlink_open = "",
  },
}

require'nvim-tree'.setup { }

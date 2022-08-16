require'nvim-tree'.setup {
  renderer = {
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = false,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "■",
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
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
    }
  },
  git = {
    enable = false,
    ignore = false,
    timeout = 400,
  },
}

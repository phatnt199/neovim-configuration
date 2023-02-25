local function open_nvim_tree()
  require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

require('nvim-tree').setup {
  renderer = {
    icons = {
      webdev_colors = true,
      git_placement = "before",
      modified_placement = "after",
      padding = " ",
      symlink_arrow = "➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        --[[ default = "",
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
        }, ]]
      }
    }
  },
  git = {
    enable = false,
    ignore = false,
    timeout = 400,
  },
}

local tree = require 'nvim-tree'

tree.setup({
  create_in_closed_folder = true,
  disable_netrw = true,
  update_cwd = true,
  view = {
    width = 50,
    height = 30,
    number = false,
    relativenumber = true,
  },
  renderer = {
    indent_markers = {
      enable = true,
    },
  },
})

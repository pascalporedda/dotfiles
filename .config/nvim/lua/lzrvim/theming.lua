local o = vim.opt
local util = require('lzrvim.utils')

-- require('onedark').setup {
--     style = 'light',
--     transparent = false,
-- }
-- require('onedark').load()
-- require('lualine').setup({options = {theme = 'onedark'}})
--
local catppuccin = require("catppuccin")

catppuccin.setup({
    term_colors = true,
    integrations = {
        nvimtree = {
            enabled = true,
            show_root = true, -- makes the root folder not transparent
            transparent_panel = false -- make the panel transparent
        }
    }
})

vim.g.catppuccin_flavour = 'mocha'
vim.cmd [[colorscheme catppuccin]]

require('lualine').setup({options = {theme = 'catppuccin'}})

o.list = true
o.listchars:append("eol:↴")
o.listchars:append("space:⋅")

require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = true,
    space_char_blankline = " "
}

-- Highlight yanked lines 

util.create_augroup({
    {
        'TextYankPost', '* silent!',
        "lua require 'vim.highlight'.on_yank({timeout = 150})"
    }
}, 'highlight_yank')


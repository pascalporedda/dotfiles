local o = vim.opt
local util = require('lzrvim.utils')

require('onedark').setup {
    style = 'light',
    transparent = false,
}
require('onedark').load()
require('lualine').setup({options = {theme = 'onedark'}})

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
        'TextYankPost',
        '* silent!',
        "lua require 'vim.highlight'.on_yank({timeout = 80})"
    }
}, 'highlight_yank')


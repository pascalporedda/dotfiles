local o = vim.opt
local util = require('lzrvim.utils')

-- vim.g.gruvbox_invert_selection = 0
-- vim.cmd[[
-- let g:gruvbox_contrast_dark = 'hard'
-- if exists('+termguicolors')
--     let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
--     let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
-- endif
-- let g:gruvbox_invert_selection='0'

-- colorscheme gruvbox
-- highlight ColorColumn ctermbg=0 guibg=grey
-- hi SignColumn guibg=none
-- hi CursorLineNR guibg=None
-- highlight Normal guibg=none
-- " highlight LineNr guifg=#ff8659
-- " highlight LineNr guifg=#aed75f
-- highlight LineNr guifg=#5eacd3
-- highlight netrwDir guifg=#5eacd3
-- highlight qfFileName guifg=#aed75f
-- hi TelescopeBorder guifg=#5eacd
-- ]]
-- require('lualine').setup({options = {theme = 'gruvbox'}})


-- Tokyonight theme
vim.g.tokyonight_style = "day"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

-- Load the colorscheme
vim.cmd[[colorscheme tokyonight]]


-- require('onedark').setup {style = 'light', transparent = false}
-- require('onedark').load()

-- LuaLine
require('lualine').setup({
    options = {theme = 'tokyonight', globalstatus = false},
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {
            {'filename', file_status = true, path = 1, shorting_target = 20}
        },
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    }
})


-- Blankline indents
o.list = true
o.listchars:append("eol:↴")
o.listchars:append("space:⋅")

require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = true,
    space_char_blankline = " "
}

-- vim.opt.laststatus = 3

vim.api.nvim_exec([[
  hi WinSeparator guibg=None
]], false)

-- Highlight yanked lines

util.create_augroup({
    {
        'TextYankPost', '* silent!',
        "lua require 'vim.highlight'.on_yank({timeout = 150})"
    }
}, 'highlight_yank')


vim.cmd[[
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
endif
]]


local M = {}

function M.toggle_theme ()
  if vim.opt.background == 'dark' then
    vim.opt.background = 'light'
  else
    vim.opt.background = 'dark'
  end
end

return M

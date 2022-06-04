local o = vim.opt
local wo = vim.wo
local bo = vim.bo
local go = vim.g

o.cursorline = true
o.sw = 2
o.ts = 2
o.sts = 1

-- o.fillchars = "vert:\\"
-- o.lcs = "tab:▸ ,trail:·,eol:¬,nbsp:_,space:·"
o.encoding = "utf-8"
o.wildmode = "longest:list,full"
o.wildmenu = true
o.wrap = false
o.title = true
o.guicursor = ""
o.relativenumber = true
o.hidden = true
o.errorbells = false
o.expandtab = true
o.autoindent = true
o.nu = true
o.clipboard = "unnamedplus"
o.splitright = true

o.swapfile = false
o.backup = false
o.undodir = HOME .. "/.vim/undodir"
o.undofile = true

o.ignorecase = true
o.smartcase = true
o.incsearch = true
o.hlsearch = false

o.termguicolors = true
o.scrolloff = 8
o.signcolumn = "yes"
--
-- Longer update times leads to noticable delays and poor user experience
o.updatetime = 50

o.shortmess = "a"
o.cmdheight = 1

o.colorcolumn = "80"

o.completeopt = 'menuone,noselect'

go.completion_matching_strategy_list = {"exact", "substring", "fuzzy"}
go.loaded_matchparen = 1




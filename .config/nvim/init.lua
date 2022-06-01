local sumneko_root_path = "/opt/homebrew/Cellar/lua-language-server/3.0.0"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

HOME = os.getenv("HOME")

vim.g.mapleader = " "
vim.g.loaded_matchparen = 1
vim.opt.cursorline = true
vim.opt.sw = 2
vim.opt.ts = 2
vim.opt.sts = 1
-- vim.opt.fillchars = "vert:\\"
vim.opt.lcs = "tab:▸ ,trail:·,eol:¬,nbsp:_,space:·"
vim.opt.encoding = "utf-8"
vim.opt.wildmode = "longest:list,full"
vim.opt.wildmenu = true
vim.opt.wrap = false
vim.opt.title = true
vim.opt.guicursor = ""
vim.opt.relativenumber = true
vim.opt.hlsearch = false
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.nu = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitright = true


vim.g.completion_matching_strategy_list={"exact", "substring", "fuzzy"}

-- noswapfile
-- nobackup

vim.opt.undodir = HOME .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 1
-- More space for displaying messages
vim.opt.cmdheight = 1

-- Longer update times leads to noticable delays and poor user experience
vim.opt.updatetime = 50

vim.opt.shortmess = "a"

vim.opt.colorcolumn = "80"

-- NetRW Filebrowser

-- vim.g.netrw_banner=0
-- vim.g.netrw_liststyle=0
-- vim.g.netrw_browse_split=4
-- vim.g.netrw_altv=1
-- vim.g.netrw_winsize=25
-- vim.g.netrw_keepdir=0
-- vim.g.netrw_localcopydircmd="cp -r"

-- Plugins

vim.cmd([[
call plug#begin('~/.vim/plugged')

" Indent guides
Plug 'lukas-reineke/indent-blankline.nvim'

" Auto pairs

Plug 'phaazon/hop.nvim'
Plug 'jiangmiao/auto-pairs'

" Easier word motions
Plug 'chaoren/vim-wordmotion'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/argtextobj.vim'

" Tree
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" Multi cursors

Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'adelarsq/vim-matchit'

" Language server
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
Plug 'github/copilot.vim'
Plug 'nvim-lua/lsp_extensions.nvim'

" Plug 'nvim-lua/completion-nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'simrat39/symbols-outline.nvim'
" Plug 'tjdevries/nlua.nvim'
" Plug 'tjdevries/lsp_extensions.nvim'

" Snippets

Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" Treesitter

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Formatter and linter

Plug 'sbdchd/neoformat'
Plug 'mfussenegger/nvim-lint'

" Vim Commentary

Plug 'tpope/vim-commentary'

" Colors

Plug 'ii14/onedark.nvim'
Plug 'shaunsingh/nord.nvim'
Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'watzon/vim-edge-template'

" Lua line

Plug 'nvim-lualine/lualine.nvim'

" GitGutter

Plug 'airblade/vim-gitgutter'

call plug#end()

syntax on

]])

vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_disable_background = true
vim.g.nord_italic = true

require('nord').set()

vim.cmd[[colorscheme nord]]

-- Easy navigation

require'hop'.setup()

vim.api.nvim_set_keymap('n', '<leader><leader>', "<cmd> lua require'hop'.hint_patterns()<cr>", {})
vim.api.nvim_set_keymap('v', '<leader><leader>', "<cmd> lua require'hop'.hint_patterns()<cr>", {})
vim.api.nvim_set_keymap('o', '<leader><leader>', "<cmd> lua require'hop'.hint_patterns()<cr>", {})

-- Vim indent guides 

vim.opt.list = true
vim.opt.listchars:append("eol:↴")
vim.opt.listchars:append("space:⋅")

require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = true,
    space_char_blankline = " ",
}

require'nvim-treesitter.configs'.setup {
    ensure_installed = {"lua", "javascript", "typescript", "css", "html", "prisma", "graphql", "rust", "yaml"},
    highlight = {enable = true},
    incremental_selection = {enable = true},
    textobjects = {enable = true}
}

vim.cmd([[
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END
]])

-- NeoFormat and Linting integration

-- vim.cmd([[
-- augroup fmt
--   autocmd!
--   " autocmd BufWritePre * undojoin | Neoformat
--   autocmd BufWritePre,TextChanged,InsertLeave *.{js,ts,tsx,jsx} undojoin | Neoformat
-- augroup END
-- ]])
--

require('lint').linters_by_ft = {
  markdown = {'vale',},
  typescript = {'eslint',},
  javascript = {'eslint',},
}

-- vim.cmd[[
--   " au BufWritePost <buffer> :lua require('lint').try_lint()<CR>
-- ]]
-- Easier remapping

function CreateNoremap(type, opts)
    return function(lhs, rhs, bufnr)
        bufnr = bufnr or 0
        vim.api.nvim_set_keymap(type, lhs, rhs, opts)
    end
end

Nnoremap = CreateNoremap("n", {noremap = true})
Inoremap = CreateNoremap("i", {noremap = true})
Tnoremap = CreateNoremap("t", {noremap = true})

-- Embedding everything inside of here, as I cannot get lua paths working.. :((

-- CMP SETUP

local cmp = require 'cmp'
local luasnip = require("luasnip")
vim.o.completeopt = 'menuone,noselect'

require("luasnip.loaders.from_vscode").lazy_load()

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local function tab(fallback)
    if cmp.visible() then
        cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    elseif has_words_before() then
        cmp.complete()
    else
        -- F("<Tab>")
        fallback()
    end
end

local function shtab(fallback)
    if cmp.visible() then
        cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
    else
        -- F('<S-Tab>')
        fallback()
    end
end

local function enterit(fallback)
    if cmp.visible() and cmp.get_selected_entry() then
        cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false  })
    else
        -- F("<CR>")
        fallback()
    end
end

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end
    },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
        ['<Tab>'] = cmp.mapping(tab, {'i', 's', 'c'}),
        ['<S-Tab>'] = cmp.mapping(shtab, { 'i', 's', 'c'}),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if ou want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        ['<CR>'] = cmp.mapping(enterit, {"i", "s"}),
    },
    sources = cmp.config.sources({
        {name = 'nvim_lsp'}, {name = 'luasnip'} -- For luasnip users.
    }, {{name = 'buffer'}})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        {name = 'cmp_git'} -- You can specify the `cmp_git` source if you were installed it.
    }, {{name = 'buffer'}})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {sources = {{name = 'buffer'}}})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})
})

local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp
                                                                       .protocol
                                                                       .make_client_capabilities()),
        on_attach = function()
            Nnoremap("gd", ":lua vim.lsp.buf.definition()<CR>")
            Nnoremap("K", ":lua vim.lsp.buf.hover()<CR>")
            Nnoremap("<leader>vws", ":lua vim.lsp.buf.workspace_symbol()<CR")
            Nnoremap("<leader>vd", ":lua vim.diagnostic.open_float()<CR>")
            Nnoremap("[d", ":lua vim.lsp.diagnostic.goto_next()<CR>")
            Nnoremap("]d", ":lua vim.lsp.diagnostic.goto_prev()<CR>")
            Nnoremap("<leader>vca", ":lua vim.lsp.buf.code_action()<CR>")
            Nnoremap("<leader>vrr", ":lua vim.lsp.buf.references()<CR>")
            Nnoremap("<leader>vrn", ":lua vim.lsp.buf.rename()<CR>")
            Inoremap("<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
        end
    }, _config or {})
end

-- Setup lspconfig.
require('lspconfig').tsserver.setup(config())
require("lspconfig").cssls.setup(config())
require('lspconfig').tailwindcss.setup(config())
require('lspconfig').rust_analyzer.setup(config())
require('lspconfig').prismals.setup{}

require'lspconfig'.gopls.setup{}


local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require('lspconfig').sumneko_lua.setup(config({
    -- cmd = { sumneko_binary, "-E", sumneko_root_path .. "/libexec/main.lua" },
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = runtime_path
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {"vim"}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true)
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {enable = false}
        }
    }
}))

--
-- TELESCOPE SETUP
--

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values
local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        prompt_prefix = " >",
        color_devicons = true,

        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        mappings = {i = {
            ["<C-x>"] = false,
            ["<C-q>"] = actions.send_to_qflist,
            ["<esc>"] = actions.close,
        }}
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true
        }
    }
})

require("telescope").load_extension("fzy_native")

local telescope_funcs = {}

-- function telescope_funcs.reload_modules()
--     -- Because TJ gave it to me.  telescope_funcs.kes me happpy.  Put it next to his other
--     -- awesome things.
--     local lua_dirs = vim.fn.glob("./lua/*", 0, 1)
--     for _, dir in ipairs(lua_dirs) do
--         dir = string.gsub(dir, "./lua/", "")
--         require("plenary.reload").reload_module(dir)
--     end
-- end

telescope_funcs.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = vim.env.DOTFILES,
        hidden = true
    })
end

local function refactor(prompt_bufnr)
    local content = require("telescope.actions.state").get_selected_entry(
                        prompt_bufnr)
    require("telescope.actions").close(prompt_bufnr)
    require("refactoring").refactor(content.value)
end

telescope_funcs.refactors = function()
    require("telescope.pickers").new({}, {
        prompt_title = "refactors",
        finder = require("telescope.finders").new_table({
            results = require("refactoring").get_refactors()
        }),
        sorter = require("telescope.config").values.generic_sorter({}),
        attach_mappings = function(_, map)
            map("i", "<CR>", refactor)
            map("n", "<CR>", refactor)
            return true
        end
    }):find()
end

telescope_funcs.git_branches = function()
    require("telescope.builtin").git_branches({
        attach_mappings = function(_, map)
            map("i", "<c-d>", actions.git_delete_branch)
            map("n", "<c-d>", actions.git_delete_branch)
            return true
        end
    })
end

require'nvim-tree'.setup({
    -- view = {width = 25},
    -- disable_netrw = true,
    -- update_cwd = true,
    -- hijack_unnamed_buffer_when_opening = true,
    -- ignore_buffer_on_setup = true,

  auto_reload_on_write = true,
  disable_netrw = true,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  open_on_setup = true,
  open_on_setup_file = false,
  open_on_tab = false,
  sort_by = "name",
  update_cwd = true,
  view = {
    width = 50,
    height = 30,
    side = "left",
    preserve_window_proportions = true,
    number = false,
    relativenumber = true,
    signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {
        -- user mappings go here
      },
    },
  },
  renderer = {
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
    },
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {},
  },
  ignore_ft_on_setup = {},
  system_open = {
    cmd = nil,
    args = {},
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      diagnostics = false,
      git = false,
      profile = false,
    },
  },
})

-- vim.cmd[[
-- autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
-- ]]

Nnoremap("<leader>pf",
         "<cmd>:lua require('telescope.builtin').grep_string({ search = vim.fn.input(\"Grep For > \")})<CR>")
Nnoremap("<C-p>", "<cmd>:lua require('telescope.builtin').find_files()<CR>")
Nnoremap("<Leader>ff", "<cmd>:lua require('telescope.builtin').find_files()<CR>")
Nnoremap("<Leader>fb", "<cmd>:lua require('telescope.builtin').buffers()<CR>")

-- Other remaps

Inoremap("jk", "<Esc>")
Inoremap("kj", "<Esc>")
Nnoremap("<leader>=", ":Neoformat<CR>")

-- NVIM Tree
--
Nnoremap("<leader>t", "<cmd>lua require\"nvim-tree\".toggle(false, true)<CR>")
Nnoremap("<leader>r", ":NvimTreeRefresh<CR>")
Nnoremap("<leader>n", ":NvimTreeFindFile<CR>")

-- Git fugitive 

Nnoremap("<leader>gb", ":Git blame<CR>")
Nnoremap("<leader>gd", ":Git vdiff<CR>")
Nnoremap("<leader>gs", ":Git<CR>")
Nnoremap("<leader>gp", ":Git push<CR>")
Nnoremap("<leader>gh", ":diffget //3")
Nnoremap("<leader>gu", ":diffget //2")

Nnoremap("<C-j>", "<C-W><C-j>")
Nnoremap("<C-k>", "<C-W><C-k>")
Nnoremap("<C-l>", "<C-W><C-l>")
Nnoremap("<C-h>", "<C-W><C-h>")

Tnoremap("<Esc>", "<C-\\><C-n>")

-- vim.cmd [[
-- set laststatus=2
-- set statusline=
-- set statusline+=%2*
-- set statusline+=%{StatuslineMode()}
-- set statusline+=%1*
-- set statusline+=\ 
-- set statusline+=<
-- set statusline+=<
-- set statusline+=\ 
-- set statusline+=%f
-- set statusline+=\ 
-- set statusline+=>
-- set statusline+=>
-- set statusline+=%=
-- set statusline+=%m
-- set statusline+=%h
-- set statusline+=%r
-- set statusline+=\ 
-- set statusline+=%3*
-- set statusline+=%{b:gitbranch}
-- set statusline+=%1*
-- set statusline+=\ 
-- set statusline+=%4*
-- set statusline+=%F
-- set statusline+=:
-- set statusline+=:
-- set statusline+=%5*
-- set statusline+=%l
-- set statusline+=/
-- set statusline+=%L
-- set statusline+=%1*
-- set statusline+=|
-- set statusline+=%y
-- hi User2 ctermbg=lightgreen ctermfg=black guibg=lightgreen guifg=black
-- hi User1 ctermbg=black ctermfg=white guibg=black guifg=white
-- hi User3 ctermbg=black ctermfg=lightblue guibg=black guifg=lightblue
-- hi User4 ctermbg=black ctermfg=lightgreen guibg=black guifg=lightgreen
-- hi User5 ctermbg=black ctermfg=magenta guibg=black guifg=magenta

-- function! StatuslineMode()
--   let l:mode=mode()
--   if l:mode==#"n"
--     return "NORMAL"
--   elseif l:mode==?"v"
--     return "VISUAL"
--   elseif l:mode==#"i"
--     return "INSERT"
--   elseif l:mode==#"R"
--     return "REPLACE"
--   elseif l:mode==?"s"
--     return "SELECT"
--   elseif l:mode==#"t"
--     return "TERMINAL"
--   elseif l:mode==#"c"
--     return "COMMAND"
--   elseif l:mode==#"!"
--     return "SHELL"
--   endif
-- endfunction

-- function! StatuslineGitBranch()
--   let b:gitbranch=""
--   if &modifiable
--     try
--       let l:dir=expand('%:p:h')
--       let l:gitrevparse = system("git -C ".l:dir." rev-parse --abbrev-ref HEAD")
--       if !v:shell_error
--         let b:gitbranch="(".substitute(l:gitrevparse, '\n', '', 'g').") "
--       endif
--     catch
--     endtry
--   endif
-- endfunction

-- augroup GetGitBranch
--   autocmd!
--   autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
-- augroup END
-- ]]


-- Lua line setup
require('lualine').setup({
    options = {
        theme = 'nord'
    }
})


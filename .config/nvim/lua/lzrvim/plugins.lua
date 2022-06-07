vim.cmd([[
call plug#begin('~/.vim/plugged')

" Indent guides
Plug 'lukas-reineke/indent-blankline.nvim'

" Todo highlight 

Plug 'folke/todo-comments.nvim'

" Easier movement 
Plug 'phaazon/hop.nvim'

" Debugger plugins
Plug 'mfussenegger/nvim-dap'
Plug 'Pocco81/DAPInstall.nvim'

" Auto pairs

Plug 'windwp/nvim-autopairs'

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
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
Plug 'nvim-lua/lsp_extensions.nvim'

" the maintainer currently is working on a rewrite 
" "Plug 'glepnir/lspsaga.nvim'
Plug 'tami5/lspsaga.nvim'
Plug 'simrat39/symbols-outline.nvim'

" Enhanced quickfix list, fzf plugin required for bqf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'kevinhwang91/nvim-bqf'

" Snippets

Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

Plug 'tpope/vim-fugitive'

" Treesitter

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'ThePrimeagen/harpoon'

" Formatter and linter

Plug 'sbdchd/neoformat'

" Vim Commentary

Plug 'tpope/vim-commentary'

" Colors

Plug 'navarasu/onedark.nvim'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}

" Lua line

Plug 'nvim-lualine/lualine.nvim'

" Git signs
Plug 'lewis6991/gitsigns.nvim'

call plug#end()
]])

-- Setting up plugins that have no other place

require('hop').setup()
require("todo-comments").setup {}
require('gitsigns').setup()
require('nvim-autopairs').setup{}
require('harpoon').setup({
    nav_first_in_list = true,
})

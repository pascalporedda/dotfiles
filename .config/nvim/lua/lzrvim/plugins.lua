vim.cmd([[
call plug#begin('~/.vim/plugged')

" Indent guides
Plug 'lukas-reineke/indent-blankline.nvim'

" Todo highlight 

Plug 'folke/todo-comments.nvim'

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
Plug 'ThePrimeagen/git-worktree.nvim'

Plug 'ThePrimeagen/harpoon'


" Formatter and linter

Plug 'sbdchd/neoformat'
Plug 'mfussenegger/nvim-lint'

" Vim Commentary

Plug 'tpope/vim-commentary'

" Colors

Plug 'shaunsingh/nord.nvim'
Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'navarasu/onedark.nvim'
Plug 'watzon/vim-edge-template'

" Lua line

Plug 'nvim-lualine/lualine.nvim'

" GitGutter

Plug 'airblade/vim-gitgutter'

" Search and replace 

Plug 'jremmen/vim-ripgrep'
Plug 'TamaMcGlinn/quickfixdd'

call plug#end()
]])

-- Setting up plugins that have no other place

require('hop').setup()
require("todo-comments").setup {}

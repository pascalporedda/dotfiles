" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamedplus
" Enhance command-line completion
set wildmenu
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Don’t add empty newlines at the end of files
set binary
" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
set softtabstop=2
set smartindent
set nowrap
set smartcase
set noswapfile

set sw=4 ts=4 sts=4 " Default

set fillchars+=vert:\▏


" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_,space:·
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
set relativenumber
" Start scrolling three lines before the horizontal window border
set scrolloff=3

set updatetime=300
set cmdheight=2
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile
set colorcolumn=120
highlight ColorColumn ctermbg=0 
set shiftwidth=2
set expandtab
set splitbelow
set splitright
set shortmess=aFc
set autoindent

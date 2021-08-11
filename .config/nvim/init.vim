" vim-plug section
call plug#begin('~/.vim/plugged')
" Plug 'posva/vim-vue'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug '907th/vim-auto-save'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'StanAngeloff/php.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'gruvbox-community/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'lervag/vimtex'
Plug 'rust-lang/rust.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'mattn/emmet-vim'
call plug#end()
" end vim-plug section

" " Make vertical separator pretty
" highlight VertSplit cterm=NONE
" used for coc tab completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Automatic commands
if has("autocmd")
  " Enable file type detection
  filetype on

  autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
  autocmd FileType typescript.tsx :setlocal sw=2 ts=2 sts=2
  autocmd FileType css :setlocal sw=2 ts=2 sts=2
  autocmd FileType html :setlocal sw=2 ts=2 sts=2
  autocmd FileType ruby :setlocal sw=2 ts=2 sts=2
  autocmd FileType xml :setlocal sw=2 ts=2 sts=2
  " Treat .json files as .js
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  autocmd BufNewFile,BufRead *.jsx setfiletype js typescript syntax=javascript
  autocmd BufNewFile,BufRead *.tsx setfiletype typescript syntax=typescript
  " Treat .md files as Markdown
  autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
endif
"


" Change mapleader
let mapleader=" "
let g:user_emmet_leader_key=','
let g:prettier#autoformat_require_pragma = 0
nmap <Leader>= <Plug>(Prettier)

" let g:auto_save = 1


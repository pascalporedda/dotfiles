
set termguicolors     " enable true colors support
colorscheme purify
let g:airline_theme='purify'
" let g:airline_theme='gruvbox'
" let g:gruvbox_transparent_bg=1
" let g:gruvbox_improved_strings=1
" let g:gruvbox_improved_warnings=1
" let g:gruvbox_contrast_light='soft'
" set background=light
" colorscheme gruvbox
" let ayucolor="dark"
" colorscheme ayu
syntax on

" nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
" nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
" nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>

" nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
" nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
" nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif


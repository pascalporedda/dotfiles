" remap split into tabs movement to simplyy control "x" instead of control-w + x
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-p> :Files<CR>
"git fugitive
nmap <leader>gs :G<CR>
nmap <leader>gf :diffget //3<CR>
nmap <leader>gj :diffget //2<CR>

nnoremap <leader>/ :Rg<CR>

imap jk <Esc>
imap kj <Esc>

" greatest remap ever
vnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <leader>d "_d
vnoremap <leader>d "_d

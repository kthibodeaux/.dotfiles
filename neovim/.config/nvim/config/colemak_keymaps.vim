" Remap movement
noremap h k
noremap j h
noremap k j

" Move visual block
vnoremap K :m '>+1<CR>gv=gv
vnoremap H :m '<-2<CR>gv=gv

" Quickly escape
inoremap nn <Esc>

" Splits navigation
nnoremap <silent> <c-j> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-k> :TmuxNavigateDown<cr>
nnoremap <silent> <c-h> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

" Close the buffer and reuse the window for an existing buffer
nnoremap <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" Delete the buffer and close the window
nnoremap <leader>d :bd<CR>

" Buffer cycling
nnoremap <C-p> :bprev<CR>
nnoremap <C-n> :bnext<CR>

" Resizing splits
nnoremap <silent> <Up> :resize -2<CR>
nnoremap <silent> <Down> :resize +2<CR>
nnoremap <silent> <Left> :vertical resize +2<CR>
nnoremap <silent> <Right> :vertical resize -2<CR>

" Toggle the quickfix window
nmap <script> <silent> <Leader><Leader>l :call ToggleQuickFix()<CR>

" FZF
nnoremap <leader>c :BCommits<cr> |" Commits for current file
nnoremap <leader>t :BTags<cr> |" Tags for current file
nnoremap <leader>y :Tags<cr> |" Tags for current project
nnoremap <leader>p :Tags<cr> |" Tags for project
nnoremap <leader>/ :Files<cr> |" Project dir files

" Close the buffer and reuse the window for an existing buffer
nnoremap <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" Delete the buffer and close the window
nnoremap <leader>d :bd<CR>

" Buffer cycling
nnoremap <C-p> :bprev<CR>
nnoremap <C-n> :bnext<CR>

" Argwrap
nnoremap <silent> <leader>a :ArgWrap<CR>

" Retag
nnoremap <leader>rt :call jobstart($CTAGS_COMMAND)<CR>

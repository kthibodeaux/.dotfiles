nnoremap <leader>rt :call jobstart('rm -f TAGS; /usr/local/bin/ctags -a -e -f TAGS --tag-relative -R --exclude=.git --exclude=log --exclude=tmp .')<CR>

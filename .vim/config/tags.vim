set tags=./TAGS,./tags

let ctags_command = 'rm -f TAGS; /usr/local/bin/ctags -a -e -f TAGS --tag-relative -R --exclude=.git --exclude=log --exclude=tmp .'

nnoremap <leader>rt :call jobstart(ctags_command)<CR>

au BufWritePre *.rb :call jobstart(ctags_command)

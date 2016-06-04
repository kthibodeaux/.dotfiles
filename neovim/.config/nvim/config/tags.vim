set tags+=TAGS,gems.tags

nnoremap <leader>rt :call jobstart($CTAGS_COMMAND)<CR>

au BufWritePre *.rb :call jobstart($CTAGS_COMMAND)

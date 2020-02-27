setlocal foldmethod=indent
setlocal foldlevel=2

map <buffer> <leader>rf :call VimuxRunCommand("ya test ". expand('%') ." \n")<CR>
map <buffer> <leader>ra :call VimuxRunCommand("ya test\n")<CR>

nmap <buffer> <leader><tab> :call CocAction('format')<CR>

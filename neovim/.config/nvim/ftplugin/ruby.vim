nnoremap <buffer> <localleader>c :Econtroller<CR>
nnoremap <buffer> <localleader>m :Emodel<CR>
nnoremap <buffer> <localleader>v :Eview<CR>

setlocal iskeyword+=!
setlocal iskeyword+=?

nmap <buffer> <leader>. <Plug>RailsOpenAlt

map <buffer> <Leader>rr :call RunNearestSpec()<CR>
map <buffer> <Leader>rf :call RunCurrentSpecFile()<CR>
map <buffer> <Leader>rl :call RunLastSpec()<CR>
map <buffer> <Leader>ra :call RunAllSpecs()<CR>

" iskeyword is local, so we remove it before leaving the buffer
au BufLeave <buffer> set iskeyword-=:
nnoremap <silent> <buffer> <leader>n :set iskeyword+=:<CR><C-]>

" override file indent to run rubocop
nnoremap <buffer> <leader><tab> :!rubocop --safe-auto-correct %<CR>

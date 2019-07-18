" Run both javascript and vue linters for vue files.
let b:ale_linter_aliases = ['javascript', 'vue']

" Select the eslint and vls linters.
let b:ale_linters = ['eslint', 'vls']

set foldmethod=indent
set foldlevel=4

nmap <buffer> <leader><tab> mm/<script<CR>=G:noh<CR>`m

set foldmethod=indent
set foldlevel=4
setlocal isfname-=.

autocmd BufWritePre <buffer> EslintFixAll

set foldmethod=indent
set foldlevel=4
setlocal isfname-=.

autocmd BufWritePre <buffer> lua vim.lsp.buf.format()

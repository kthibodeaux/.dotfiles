autocmd BufWritePre *.rb lua vim.lsp.buf.format()

function s:fix_if_eslint_is_present()
  if exists(':EslintFixAll') > 0
    exec ":EslintFixAll"
  endif
endfunction
au BufWritePre *.js :call s:fix_if_eslint_is_present()
au BufWritePre *.vue :call s:fix_if_eslint_is_present()

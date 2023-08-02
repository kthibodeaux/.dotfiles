set foldmethod=indent
set foldlevel=4
setlocal isfname-=.

function s:fix_if_eslint_is_present()
  if exists(':EslintFixAll') > 0
    exec ":EslintFixAll"
  endif
endfunction

autocmd BufWritePre <buffer> silent! :call s:fix_if_eslint_is_present()

au BufWritePre * :call jobstart($CTAGS_COMMAND)
au BufWritePre * :call <SID>DefSpaceToUnderscore()

fun! <SID>DefSpaceToUnderscore()
  norm md
  %s/\s*\(def [0-9a-zA-Z _]*\)\@<= /_/e
  norm `d
endfun

nnoremap <localleader>c :Econtroller<CR>
nnoremap <localleader>m :Emodel<CR>
nnoremap <localleader>v :Eview<CR>
nnoremap <localleader>s :Espec<CR>
nnoremap <localleader>u :Eunittest<CR>

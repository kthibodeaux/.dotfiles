au BufWritePre * :call jobstart($CTAGS_COMMAND)
au BufWritePre * :call <SID>DefSpaceToUnderscore()

fun! <SID>DefSpaceToUnderscore()
  mark d
  %s/\s*\(def [\a-zA-z ]*\)\@<= /_/ge|norm!`d
endfun

nnoremap <localleader>c :Econtroller<CR>
nnoremap <localleader>m :Emodel<CR>
nnoremap <localleader>v :Eview<CR>
nnoremap <localleader>s :Espec<CR>
nnoremap <localleader>u :Eunittest<CR>

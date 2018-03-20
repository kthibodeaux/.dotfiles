au BufWritePre * :call <SID>StripWhite()
fun! <SID>StripWhite()
  let l:cursor_pos = getpos(".")
  %s/[ \t]\+$//ge
  call cursor(l:cursor_pos[1], l:cursor_pos[2])
endfun

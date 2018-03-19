au BufWritePre * :call <SID>StripWhite()
fun! <SID>StripWhite()
  let l:cursor_pos = getpos(".")
  %s/[ \t]\+$//ge
  %s!^\( \+\)\t!\=StrRepeat("\t", 1 + strlen(submatch(1)) / 8)!ge
  call cursor(l:cursor_pos[1], l:cursor_pos[2])
endfun

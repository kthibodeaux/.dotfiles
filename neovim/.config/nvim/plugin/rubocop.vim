function s:run_rubocop()
  let l:cursor_pos = getpos(".")
  exec ":w!"
  silent exec "!rubocop --safe-auto-correct %"
  exec ":e"
  call cursor(l:cursor_pos[1], l:cursor_pos[2])
  echo "Rubocop complete"
endfunction

nnoremap <Plug>RunRubocop :call <SID>run_rubocop()<CR>

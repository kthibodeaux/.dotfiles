function s:open_db_migrate()
  if isdirectory("db") == 1
    exec ":edit db/migrate"
  else
    let l:dir = system("find . -maxdepth 1 -type d -name '*backend' -print -quit")
    let l:dir = substitute(l:dir, '\n\+$', '', '')
    let l:command = ":edit ". l:dir . "/db/migrate"

    exec l:command
  endif
endfunction

nnoremap <Plug>OpenDbMigrate :call <SID>open_db_migrate()<CR>G

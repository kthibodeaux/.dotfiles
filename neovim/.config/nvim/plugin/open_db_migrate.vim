function s:open_db_migrate()
  if isdirectory("db") == 1
    exec ":edit db/migrate"
  endif
endfunction

nnoremap <Plug>OpenDbMigrate :call <SID>open_db_migrate()<CR>G

function s:open_db_migrate()
  if isdirectory("db/migrate") == 1
    exec ":edit db/migrate"
  elseif isdirectory("backend/db/migrate") == 1
    exec ":edit backend/db/migrate"
  endif
endfunction

nnoremap <leader>m :call <SID>open_db_migrate()<CR>G

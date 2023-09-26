function s:folder()
  if isdirectory("db/migrate") == 1
    return "db/migrate"
  elseif isdirectory("backend/db/migrate") == 1
    return "backend/db/migrate"
  endif
endfunction

execute 'nnoremap <Plug>OpenDbMigrate :Oil ' . <SID>folder() . '<CR>'

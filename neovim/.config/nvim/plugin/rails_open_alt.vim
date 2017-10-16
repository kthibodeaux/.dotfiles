function s:open_alt(path)
  let l:alternate = ""

  if a:path =~ "spec/"
    let l:alternate = substitute(a:path, "spec/", "app/", "")
    let l:alternate = substitute(l:alternate, "_spec", "", "")
  elseif a:path =~ "app/"
    let l:alternate = substitute(a:path, "app/", "spec/", "")
    let l:alternate = substitute(l:alternate, ".rb", "_spec.rb", "")
  endif

  if empty(l:alternate)
    echo "No alternate file for " . a:path . " exists!"
  else
    exec ":vsplit " . l:alternate
  endif
endfunction

nnoremap <Plug>RailsOpenAlt :call <SID>open_alt(expand('%'))<CR>

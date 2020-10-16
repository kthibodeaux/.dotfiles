function s:boiler()
  if filereadable("./.boiler/boiler") == 1
    if filereadable(@%) == 0
      read !./.boiler/boiler %
      norm ggdd
    elseif line('$') == 1 && col('$') == 1
      read !./.boiler/boiler %
      norm ggdd
    endif
  endif
endfunction

au BufNewFile,BufReadPost *.rb silent! :call s:boiler()
au BufNewFile,BufReadPost *.vue silent! :call s:boiler()
au BufNewFile,BufReadPost *.js silent! :call s:boiler()

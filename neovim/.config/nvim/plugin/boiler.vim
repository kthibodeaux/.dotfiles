function s:boiler()
  if executable("boilerplate_generator") == 1
    if filereadable(@%) == 0
      read !boilerplate_generator %:. %:p
      norm ggdd
    elseif line('$') == 1 && col('$') == 1
      read !boilerplate_generator %:. %:p
      norm ggdd
    endif
  endif
endfunction

au BufNewFile,BufReadPost *.rb silent! :call s:boiler()

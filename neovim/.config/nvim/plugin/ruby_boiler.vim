function s:boiler()
  if filereadable("boiler") == 1
    if filereadable(@%) == 0
      read !be ruby boiler %
      norm ggdd
    elseif line('$') == 1 && col('$') == 1
      read !be ruby boiler %
      norm ggdd
    endif
  endif
endfunction

au BufNewFile,BufReadPost *.rb silent! :call s:boiler()

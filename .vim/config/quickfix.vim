function! ToggleQuickFix()
  if exists("g:qwindow")
    lclose
    unlet g:qwindow
  else
    try
      lopen 10
      let g:qwindow = 1
    catch
      echo "No Errors found!"
    endtry
  endif
endfunction

nmap <script> <silent> <Leader>l :call ToggleQuickFix()<CR>

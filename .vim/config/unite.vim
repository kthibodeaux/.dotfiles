call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

function! Unite_common()
  execute ':Unite  -buffer-name=files -start-insert buffer file_rec file_rec/async:'.ProjectRootGuess().'/'
endfunction

function! s:unite_settings()
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

nnoremap <leader><space> :call Unite_common()<CR>

autocmd FileType unite call s:unite_settings()

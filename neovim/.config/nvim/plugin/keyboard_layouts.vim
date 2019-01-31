function s:use_qwerty()
  noremap h h
  noremap j j
  noremap k k
  nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
  nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
  nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
  nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
  echo "Using Qwerty style navigation"
endfunction

function s:use_colemak()
  noremap h k
  noremap j h
  noremap k j
  nnoremap <silent> <c-j> :TmuxNavigateLeft<cr>
  nnoremap <silent> <c-k> :TmuxNavigateDown<cr>
  nnoremap <silent> <c-h> :TmuxNavigateUp<cr>
  nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
  echo "Using Colemak style navigation"
endfunction

nnoremap <Plug>UseQwertyNavigation :call <SID>use_qwerty()<CR>
nnoremap <Plug>UseColemakNavigation :call <SID>use_colemak()<CR>

silent call <SID>use_colemak()

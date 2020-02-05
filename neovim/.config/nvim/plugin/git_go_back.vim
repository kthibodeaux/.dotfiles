function s:handler(line)
  let l:sha = split(a:line, ' ')[0]
  let l:file = expand("%")
  if executable('bat')
    let l:command = "git show " . l:sha . ":" . l:file . " | bat -l " . &filetype
  else
    let l:command = "git show " . l:sha . ":" . l:file
  endif
  let l:tmux_command = "!tmux split-window -h '" . l:command . "'"

  silent execute l:tmux_command
endfunction

function s:gitgoback()
  let l:file = expand("%")
  let l:command = "git log " . l:file

  call fzf#run(fzf#wrap({'source': l:command, 'sink': function('<SID>handler'),}))
endfunction

nnoremap <Plug>GitGoBack :call <SID>gitgoback()<CR>

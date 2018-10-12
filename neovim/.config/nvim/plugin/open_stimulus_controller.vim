function s:open_stimulus_controller(controller_name)
  let l:line = getline('.')
  let l:name = matchlist(l:line, '.*data-controller=\%(\"\|''\)\(.*\)\%(\"\|''\).*')[1]

  let l:name = substitute(l:name, "--", "/", "")
  let l:name = substitute(l:name, "-", "_", "")

  let l:path = getcwd() . "/app/javascript/controllers/"

  exec ":vsplit " . l:path . l:name . "_controller.js"
endfunction

nnoremap <Plug>OpenStimulusController :call <SID>open_stimulus_controller(expand('<cword>'))<CR>

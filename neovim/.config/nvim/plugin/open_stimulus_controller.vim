function s:open_stimulus_controller(controller_name)
  let l:path = getcwd() . "/app/javascript/controllers/"
  let l:alternate = substitute(a:controller_name, "--", "/", "")
  let l:alternate = substitute(l:alternate, "-", "_", "")

  exec ":vsplit " . l:path . l:alternate . "_controller.js"
endfunction

nnoremap <Plug>OpenStimulusController :call <SID>open_stimulus_controller(expand('<cword>'))<CR>

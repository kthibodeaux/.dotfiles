" Based on puglint by w0rp - <devw0rp@gmail.com>
" https://github.com/dense-analysis/ale/blob/master/ale_linters/pug/puglint.vim
" Description: puglintvue for checking Pug/Jade in Vue files.

call ale#Set('vue_puglintvue_executable', 'node_modules/.bin/pug-lint-vue')
call ale#Set('vue_puglintvue_use_global', get(g:, 'ale_use_global_executables', 0))

function! s:FindConfig(buffer) abort
  for l:filename in [
        \   '.pug-lintrc',
        \   '.pug-lintrc.js',
        \   '.pug-lintrc.json',
        \   'package.json',
        \]
    let l:config = ale#path#FindNearestFile(a:buffer, l:filename)

    if !empty(l:config)
      return l:config
    endif
  endfor

  return ''
endfunction

function! ale_linters#vue#puglintvue#GetCommand(buffer) abort
  let l:config = s:FindConfig(a:buffer)

  return '%e'
        \   . ' -c ' . ale#Escape(l:config)
        \   . ' %t'
endfunction

function! ale_linters#vue#puglintvue#Handle(buffer, lines) abort
  for l:line in a:lines[:10]
    if l:line =~# '^SyntaxError: '
      return [{
            \   'lnum': 1,
            \   'text': 'puglintvue configuration error (type :ALEDetail for more information)',
            \   'detail': join(a:lines, "\n"),
            \}]
    endif
  endfor

  return s:HandleError(a:buffer, a:lines)
endfunction

function! s:HandleError(buffer, lines) abort
    " let l:pattern = '\v^ +[a-zA-Z]?:?[^:]+(\d+):?(\d+)?:? ?(.+)$'
    let l:pattern = '\v^ +(\d+):?(\d+)?(.+)$'
    let l:output = []

    for l:match in ale#util#GetMatches(a:lines, l:pattern)
      echom "full" . l:match[0]
      echom "line" . l:match[1]
      echom "col" . l:match[2]
        call add(l:output, {
        \   'lnum': l:match[1] + 0,
        \   'col': l:match[2] + 0,
        \   'text': l:match[3],
        \   'type': 'E',
        \})
    endfor

    return l:output
endfunction

call ale#linter#Define('vue', {
      \   'name': 'puglintvue',
      \   'executable': {b -> ale#node#FindExecutable(b, 'vue_puglintvue', [
      \       'node_modules/.bin/pug-lint-vue',
      \   ])},
      \   'output_stream': 'stdout',
      \   'command': function('ale_linters#vue#puglintvue#GetCommand'),
      \   'callback': 'ale_linters#vue#puglintvue#Handle',
      \})


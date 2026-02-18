highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

function! ShouldHighlightWhitespace()
  " Don't highlight in special buffer types
  if &buftype != '' | return 0 | endif

  " Don't highlight in floating windows
  if exists('*nvim_win_get_config')
    let l:config = nvim_win_get_config(0)
    if l:config.relative != '' | return 0 | endif
  endif

  " Don't highlight in specific filetypes
  if index(['help', 'qf'], &filetype) >= 0 | return 0 | endif

  return 1
endfunction

au BufEnter * if ShouldHighlightWhitespace() | match ExtraWhitespace /\s\+$/ | else | match none | endif
au InsertEnter * if ShouldHighlightWhitespace() | match ExtraWhitespace /\s\+\%#\@<!$/ | else | match none | endif
au InsertLeave * if ShouldHighlightWhitespace() | match ExtraWhitespace /\s\+$/ | else | match none | endif

" Config not set in lua:
" set nrformats-=octal
" set mouse-=a
" set guicursor=
" set shortmess+=c
" set signcolumn=yes
" hi clear SignColumn " fix grey gutter

" Plugin config {{{
" Quickscope {{{
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary ctermfg=117 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary ctermfg=219 cterm=underline
augroup END
" }}}

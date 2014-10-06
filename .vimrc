syntax on
filetype plugin indent on
autocmd FileType ruby,eruby,yaml setlocal ai sw=2 sts=2 et
colorscheme hybrid
set ruler
set backspace=indent,eol,start
set nowrap
set guioptions-=T
set autoindent
set showmatch
set backupdir=~/.tmp
set directory=~/.tmp
set laststatus=2
set relativenumber

" Highlight current line in active pane only
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" Easier pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

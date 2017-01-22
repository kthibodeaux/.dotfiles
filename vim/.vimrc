set nocompatible
filetype plugin indent on
au FileType * setlocal ai sw=2 sts=2 et

syntax on
set autoindent
set backspace=indent,eol,start
set backupdir=~/.vim/tmp
set colorcolumn=80
set directory=~/.vim/tmp
set encoding=utf-8
set fileencoding=utf-8
set laststatus=2 " Always show last status
set nowrap
set nrformats-=octal
set number
set relativenumber " 7.4+ shows both, below just relative
set ruler " Show cursor position
set scrolloff=1 " Always show at least one line above and below cursor
set showcmd " Show partially typed commands
set showmatch " Matches () etc
set timeout
set timeoutlen=1000
set ttimeoutlen=100
set visualbell " Flash the cursor on error instead of beeping
set wildmenu " Show menu options for completion

" Theme
set background=dark
colorscheme slate

" Random maps (normal, visual, select, operater pending)
nnoremap <CR> :noh<CR><CR> " Cancel search by pressing return
nnoremap <leader><tab> mtgg=G`t
inoremap ii <Esc>
noremap h k
noremap j h
noremap k j

" Searching
set hlsearch
set ignorecase
set smartcase " Only search upcase if provided with capital letter
set gdefault " Assume /g flag on :%s to replace all matches on line
set incsearch " Search as typing

" Highlight current line in active pane only
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" Highlight current column in active pane only
augroup CursorColumn
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
  au WinLeave * setlocal nocursorcolumn
augroup END

" Window management
set hidden " Allow unsaved buffers to be put in background
set winwidth=84 " Active window min width
noremap <c-k> <c-w>j
noremap <c-h> <c-w>k
noremap <c-l> <c-w>l
noremap <c-j> <c-w>j

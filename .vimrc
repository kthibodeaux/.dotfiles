set nocompatible
filetype plugin indent on
au FileType * setlocal ai sw=2 sts=2 et
call pathogen#infect()

syntax on
set ruler " Show cursor position
set backspace=indent,eol,start
set nowrap
set guioptions-=TBe
set autoindent
set showmatch " Matches () etc
set backupdir=~/.tmp
set directory=~/.tmp
set laststatus=2 " Always show last status
set relativenumber
set showcmd " Show partially typed commands
set fileencoding=utf-8
set encoding=utf-8
set colorcolumn=80
set scrolloff=1 " Always show at least one line above and below cursor
set visualbell " Flash the cursor on error instead of beeping

let mapleader = ","

" Theme
colorscheme hybrid

" Random maps (normal, visual, select, operater pending)
map <TAB> = " Tab smartly indents current line TODO: WHY DOES IT BEEP!?
map <leader>w :bw<CR>
map <leader>t :NERDTreeToggle<CR>
map <leader>gs :Gstatus<CR>
map <leader>ga :Gwrite<CR>
map <leader>gc :Gcommit<CR>
map <leader>gp :Gpush<CR>

" Random maps (insert, command)
map! Q q
map! W w

" SkyBison
let g:skybison_fuzz = 1
nnoremap <leader>b :<c-u>call SkyBison("b ")<cr>
nnoremap <leader>e :<c-u>call SkyBison("e ")<cr>

" Searching
set hlsearch
set ignorecase
set smartcase " Only search upcase if provided with capital letter
set gdefault " Assume /g flag on :%s to replace all matches on line
set incsearch " Search as typing

" Show syntax highlighting groups for word under cursor
" Only really useful when changing colors in a theme, which I do a lot...
nmap <leader>syn :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Highlight current line in active pane only
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" Window management
set winwidth=84 " Active window min width
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Ruby file types
au BufNewFile,BufRead Gemfile set filetype=ruby
au BufNewFile,BufRead Vagrantfile set filetype=ruby
au BufNewFile,BufRead Guardfile set filetype=ruby
au BufNewFile,BufRead Capfile set filetype=ruby
au BufNewFile,BufRead Rakefile set filetype=ruby
au BufNewFile,BufRead *.gemspec set filetype=ruby
au BufNewFile,BufRead *.cap set filetype=ruby
au BufNewFile,BufRead *.rake set filetype=ruby
au BufNewFile,BufRead *.ru set filetype=ruby

" Highlight whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

" Strip trailing whitespace before saving
au BufWritePre * :call <SID>StripWhite()
fun! <SID>StripWhite()
  %s/[ \t]\+$//ge
  %s!^\( \+\)\t!\=StrRepeat("\t", 1 + strlen(submatch(1)) / 8)!ge
endfun


set nocompatible
filetype plugin indent on
au FileType * setlocal ai sw=2 sts=2 et
call pathogen#infect()

syntax on
set autoindent
set backspace=indent,eol,start
set backupdir=~/.tmp
set colorcolumn=80
set directory=~/.tmp
set encoding=utf-8
set fileencoding=utf-8
set guioptions-=TBe
set laststatus=2 " Always show last status
set nowrap
set number
set relativenumber " 7.4+ shows both, below just relative
set ruler " Show cursor position
set scrolloff=1 " Always show at least one line above and below cursor
set showcmd " Show partially typed commands
set showmatch " Matches () etc
set visualbell " Flash the cursor on error instead of beeping
set wildmenu " Show menu options for completion

let mapleader = ","
let g:airline_powerline_fonts = 1

" Theme
set background=dark
colorscheme bubblegum

" Random maps (normal, visual, select, operater pending)
map <TAB> = " Tab smartly indents current line TODO: WHY DOES IT BEEP!?
nnoremap <CR> :noh<CR><CR> " Cancel search by pressing return
map <leader>w :bw<CR>
map <leader>t :NERDTreeToggle<CR>
map <leader>gs :Gstatus<CR>
map <leader>ga :Gwrite<CR>
map <leader>gc :Gcommit<CR>
map <leader>gp :Gpush<CR>
map <leader>gd :Gdiff<CR>
map <leader>gb :Gblame<CR>

" ctrlp
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_show_hidden = 1
nnoremap <leader>o :CtrlP c<cr>
nnoremap <leader>e :CtrlP<cr>
nnoremap <leader>b :CtrlPBuffer<cr>

" xmpfilter - Super M and Super R
nmap <buffer> <F5> <Plug>(xmpfilter-mark)
xmap <buffer> <F5> <Plug>(xmpfilter-mark)
imap <buffer> <F5> <Plug>(xmpfilter-mark)

nmap <buffer> <F6> <Plug>(xmpfilter-run)
xmap <buffer> <F6> <Plug>(xmpfilter-run)
imap <buffer> <F6> <Plug>(xmpfilter-run)

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

augroup RubyFileTypes
  au BufNewFile,BufRead Gemfile set filetype=ruby
  au BufNewFile,BufRead Vagrantfile set filetype=ruby
  au BufNewFile,BufRead Guardfile set filetype=ruby
  au BufNewFile,BufRead Capfile set filetype=ruby
  au BufNewFile,BufRead Rakefile set filetype=ruby
  au BufNewFile,BufRead *.gemspec set filetype=ruby
  au BufNewFile,BufRead *.cap set filetype=ruby
  au BufNewFile,BufRead *.rake set filetype=ruby
  au BufNewFile,BufRead *.ru set filetype=ruby
augroup END

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

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

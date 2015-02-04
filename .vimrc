set nocompatible
filetype plugin indent on
au FileType * setlocal ai sw=2 sts=2 et

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'tomtom/tlib_vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Townk/vim-autoclose'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'danro/rename.vim'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'kien/ctrlp.vim'
Plugin 'matchit.zip'
Plugin 'mattn/emmet-vim'
Plugin 'rking/ag.vim'
Plugin 'sk1418/HowMuch'
Plugin 't9md/vim-ruby-xmpfilter'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vimoutliner/vimoutliner'
Plugin 'wycats/nerdtree'
Plugin 'christoomey/vim-tmux-navigator'
Bundle 'jgdavey/tslime.vim'
Plugin 'chrisbra/Recover.vim'
Plugin 'derekwyatt/vim-scala'
call vundle#end()

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

let mapleader = ","
let g:airline_powerline_fonts = 1
let g:tmux_navigator_no_mappings = 1

" Hastebin
function Haste() range
  echo system('echo '.shellescape(join(getline(a:firstline, a:lastline), "\n")).' | haste | pbcopy')
endfunction

" Local Hastebin
function LHaste() range
  echo system('echo '.shellescape(join(getline(a:firstline, a:lastline), "\n")).' | lhaste | pbcopy')
endfunction

" Theme
set background=dark
colorscheme bubblegum

" Random maps (normal, visual, select, operater pending)
map ; :
nnoremap <CR> :noh<CR><CR> " Cancel search by pressing return
nnoremap <leader><tab> mtgg=G`t
map <leader>t :NERDTreeToggle<CR>

cnoreabbrev hastebin call Haste()
cnoreabbrev lhaste call LHaste()

" Fugitive
map <leader>gs :Gstatus<CR>
map <leader>ga :Gwrite<CR>
map <leader>gc :Gcommit<CR>
map <leader>gp :Gpush<CR>
map <leader>gd :Gdiff<CR>
map <leader>gb :Gblame<CR>

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" ctrlp
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_show_hidden = 1
let g:ctrlp_extensions = ['funky']
nnoremap <leader>oo :CtrlP c<cr>
nnoremap <leader>e :CtrlP<cr>
nnoremap <leader>f :CtrlPFunky<cr>
nnoremap <leader>b :CtrlPBuffer<cr>

" rails
nnoremap <leader>oc :Econtroller<space>
nnoremap <leader>om :Emodel<space>
nnoremap <leader>ov :Eview<space>

" rspec
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
map <Leader>rr :call RunNearestSpec()<CR>
map <Leader>rf :call RunCurrentSpecFile()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>

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

" Highlight current line in active pane only
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" Window management
set hidden " Allow unsaved buffers to be put in background
set winwidth=84 " Active window min width
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

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

augroup ScalaFileTypes
  au BufNewFile,BufRead *.scala set filetype=scala
augroup END

au BufRead,BufNewFile *.otl set filetype=votl

" By default only README.md opens as markdown
au BufNewFile,BufRead *.md set ft=markdown

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

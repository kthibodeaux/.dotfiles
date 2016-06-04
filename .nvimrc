set nocompatible
filetype plugin indent on
au FileType * setlocal ai sw=2 sts=2 et

set shell=/bin/zsh

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'tomtom/tlib_vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Townk/vim-autoclose'
Plugin 'airblade/vim-gitgutter'
Plugin 'danro/rename.vim'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'matchit.zip'
Plugin 'mattn/emmet-vim'
Plugin 'rking/ag.vim'
Plugin 'sk1418/HowMuch'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'benmills/vimux'
Plugin 'chrisbra/Recover.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'tpope/vim-commentary'
Plugin 'junegunn/vim-easy-align'
Plugin 'jaxbot/browserlink.vim'
Plugin 'unblevable/quick-scope'
Plugin 'shime/vim-livedown'
Plugin 'dbakker/vim-projectroot'
Plugin 'tpope/vim-vinegar'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'AndrewRadev/linediff.vim'
Plugin 'cyphactor/vim-open-alternate'
Plugin 'itchyny/lightline.vim'
Plugin 'FooSoft/vim-argwrap'
Plugin 'neomake/neomake'
Plugin 'Shougo/deoplete.nvim'
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
set foldmethod=indent
set foldlevelstart=3
set mouse-=a
set splitright
let g:netrw_liststyle=3

set undofile
set undodir=~/.vim/undodir

let mapleader = "\<Space>"
let g:lightline = {'colorscheme': 'Tomorrow_Night'}
let g:tmux_navigator_no_mappings = 1

" Theme
set background=dark
let base16colorspace=256
colorscheme base16-ocean

let g:qs_first_occurrence_highlight_color = 117
let g:qs_second_occurrence_highlight_color = 219

" Random maps (normal, visual, select, operater pending)
map ; :
nnoremap <CR> :noh<CR><CR> " Cancel search by pressing return
nnoremap <leader><tab> mtgg=G`t
inoremap jj <Esc>
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>$
nnoremap <s-tab> za
nnoremap <leader>. :vs<CR>:OpenAlternate<CR>

cnoreabbrev hastebin w !haste
cnoreabbrev lhaste w !lhaste

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" rspec
let g:rspec_command = 'call VimuxRunCommand("bundle exec rspec {spec}\n")'
map <Leader>rr :call RunNearestSpec()<CR>
map <Leader>rf :call RunCurrentSpecFile()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>

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

" Always assume paste mode when pasting from system clipboard
noremap <silent> <C-r>* <C-o>:setl paste<CR><C-r>*<C-o>:setl nopaste<CR>

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" Load other files
source ~/.vim/config/filetypes.vim
source ~/.vim/config/window_management.vim
source ~/.vim/config/fzf.vim
source ~/.vim/config/argwrap.vim
source ~/.vim/config/neomake.vim
source ~/.vim/config/quickfix.vim
source ~/.vim/config/tags.vim
source ~/.vim/config/whitespace.vim
let g:deoplete#enable_at_startup = 1

" vim:foldmethod=marker:foldlevel=0
" Leaders {{{
let mapleader = "\<Space>"
let maplocalleader = ","
" }}}
" Basic config {{{
filetype plugin indent on
au FileType * setlocal ai sw=2 sts=2 et
syntax on
set shell=/bin/zsh
set autoindent
set backspace=indent,eol,start
set colorcolumn=80
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
set mouse-=a
set splitright
let g:netrw_liststyle=3
set tags+=TAGS,gems.tags
set list
" Searching {{{
set hlsearch
set ignorecase
set smartcase " Only search upcase if provided with capital letter
set gdefault " Assume /g flag on :%s to replace all matches on line
set incsearch " Search as typing
" }}}
" Folding {{{
set foldmethod=syntax
set foldlevelstart=3
au BufRead *_spec.rb setlocal foldlevel=2
au BufRead *.slim setlocal foldmethod=indent
au BufRead *.slim setlocal foldlevel=4
" }}}
" }}}
" Window managment {{{
set hidden " Allow unsaved buffers to be put in background
set winwidth=90 " Active window min width
" }}}
" Filetypes {{{
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

augroup MarkdownFileTypes
  au BufNewFile,BufRead *.md set ft=markdown
augroup END
" }}}
" Auto make directories {{{
function! AskQuit (msg, options, quit_option)
  if confirm(a:msg, a:options) == a:quit_option
    exit
  endif
endfunction

function! EnsureDirExists ()
  let required_dir = expand("%:h")
  if !isdirectory(required_dir)
    call AskQuit("Parent directory '" . required_dir . "' doesn't exist.",
          \       "&Create it\nor &Quit?", 2)

    try
      call mkdir( required_dir, 'p' )
    catch
      call AskQuit("Can't create '" . required_dir . "'",
            \            "&Quit\nor &Continue anyway?", 1)
    endtry
  endif
endfunction

augroup AutoMkdir
  autocmd!
  autocmd  BufNewFile  *  :call EnsureDirExists()
augroup END
" }}}
" Ruby file templates {{{
function BoilerBuilder()
  if filereadable("boiler") == 1
    if filereadable(@%) == 0
      read !./boiler %
      norm ggdd
    elseif line('$') == 1 && col('$') == 1
      read !./boiler %
      norm ggdd
    endif
  endif
endfunction

au BufNewFile,BufReadPost *.rb :call BoilerBuilder()
" }}}
" Undo config {{{
set undofile
set undodir=~/.config/nvim/undodir
" }}}
" Backup config {{{
set backupdir=~/.config/nvim/tmp
set directory=~/.config/nvim/tmp
" }}}
" Crosshair {{{
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
" }}}
" Whitespace {{{
" Highlight whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

" Strip trailing whitespace before saving
au BufWritePre * :call <SID>StripWhite()
fun! <SID>StripWhite()
  norm md
  %s/[ \t]\+$//ge
  %s!^\( \+\)\t!\=StrRepeat("\t", 1 + strlen(submatch(1)) / 8)!ge
  norm `d
endfun
" }}}
" Mappings {{{
inoremap ii <Esc>
noremap h k
noremap j h
noremap k j
nnoremap <CR> :noh<CR><CR> " cancel search by pressing return
nnoremap <leader><tab> mtgg=G`t " indent file
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>$ " split line
nnoremap <s-tab> za " toggle fold
nnoremap <leader>rt :call jobstart("$RUBY_TAG_COMMAND")<CR> " tag ruby
nnoremap <leader>n <C-]>

vnoremap K :m '>+1<CR>gv=gv " move visual block down
vnoremap H :m '<-2<CR>gv=gv " move visual block up
" Buffers {{{
" Close the buffer and reuse the window for an existing buffer
nnoremap <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" Delete the buffer and close the window
nnoremap <leader>d :bd<CR>

" Buffer cycling
nnoremap <C-p> :bprev<CR>
nnoremap <C-n> :bnext<CR>
" }}}
" RSpec {{{
let g:rspec_command = 'call VimuxRunCommand("bundle exec rspec {spec}\n")'
map <Leader>rr :call RunNearestSpec()<CR>
map <Leader>rf :call RunCurrentSpecFile()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>
" }}}
" Resizing splits {{{
nnoremap <silent> <Up> :resize -2<CR>
nnoremap <silent> <Down> :resize +2<CR>
nnoremap <silent> <Left> :vertical resize +2<CR>
nnoremap <silent> <Right> :vertical resize -2<CR>
" }}}
" }}}
" Quickfix {{{
function! ToggleQuickFix()
  if exists("g:qwindow")
    lclose
    unlet g:qwindow
  else
    try
      lopen 10
      let g:qwindow = 1
    catch
      echo "No Errors found!"
    endtry
  endif
endfunction

nmap <script> <silent> <Leader><Leader>l :call ToggleQuickFix()<CR>
" }}}
" Matchit {{{
" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif
" }}}
" Plugins {{{
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'Townk/vim-autoclose'
Plug 'airblade/vim-gitgutter'
Plug 'danro/rename.vim'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'matchit.zip'
Plug 'rking/ag.vim'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'chrisbra/Recover.vim'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'unblevable/quick-scope'
Plug 'dbakker/vim-projectroot'
Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'AndrewRadev/linediff.vim'
Plug 'cyphactor/vim-open-alternate'
Plug 'itchyny/lightline.vim'
Plug 'FooSoft/vim-argwrap'
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'mbbill/undotree'
Plug 'jelera/vim-javascript-syntax'
Plug 'slim-template/vim-slim'
Plug 'kchmck/vim-coffee-script'
Plug 'junegunn/vim-peekaboo'
Plug 'fishbullet/deoplete-ruby'
Plug 'Konfekt/FastFold'
Plug 'SirVer/ultisnips'
call plug#end()
" }}}
" Theme {{{
set background=dark
let base16colorspace=256
colorscheme base16-ocean
" }}}
" Plugin config {{{
" Lightline {{{
let g:lightline = {'colorscheme': 'Tomorrow_Night'}
" }}}
" Tmux navigator {{{
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-j> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-k> :TmuxNavigateDown<cr>
nnoremap <silent> <c-h> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
" }}}
" Quickscope {{{
let g:qs_first_occurrence_highlight_color = 117
let g:qs_second_occurrence_highlight_color = 219
" }}}
" EasyAlign {{{
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" }}}
" Undotree {{{
nnoremap <F5> :UndotreeToggle<cr>
" }}}
" FZF {{{
set rtp+=~/.fzf
nnoremap <leader>c :BCommits<cr> |" Commits for current file
nnoremap <leader>t :BTags<cr> |" Tags for current file
nnoremap <leader>y :Tags<cr> |" Tags for current project
nnoremap <leader>p :Tags<cr> |" Tags for project
nnoremap <leader>/ :Files<cr> |" Project dir files
" }}}
" Open Alternate {{{
nnoremap <leader>. :vs<CR>:OpenAlternate<CR>
" }}}
" Argwrap {{{
let g:argwrap_padded_braces = '[{'
nnoremap <silent> <leader>a :ArgWrap<CR>
" }}}
" Neomake {{{
autocmd! BufWritePost,BufRead * Neomake
" }}}
" vim-ruby {{{
" https://github.com/vim-ruby/vim-ruby/blob/master/doc/vim-ruby.txt#L133
let g:ruby_indent_block_style = 'do'
" }}}
" Deoplete {{{
let g:deoplete#enable_at_startup = 1
" }}}
" UltiSnips {{{
let g:UltiSnipsSnippetsDir = '~/.config/.nvim/UltiSnips'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" }}}
" }}}

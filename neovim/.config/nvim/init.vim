" vim:foldmethod=marker:foldlevel=0
" Leaders {{{
let mapleader = "\<Space>"
let maplocalleader = ","
" }}}
" Basic config {{{
filetype plugin indent on
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
syntax on
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
set splitbelow
let g:netrw_liststyle=3
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
set list
set guicursor=
" Searching {{{
set hlsearch
set ignorecase
set smartcase " Only search upcase if provided with capital letter
set gdefault " Assume /g flag on :%s to replace all matches on line
set incsearch " Search as typing
" }}}
" Default Folding {{{
set foldmethod=syntax
set foldlevelstart=3
" }}}
" }}}
" Tags {{{
au BufWritePost *.rb :call jobstart('sh ~/.dotfiles/bin/run_tags')
" }}}
" Abbreviations {{{
iabbr pry ::Kernel.binding.pry
" }}}
" Commands {{{
command! -bang -nargs=* Find
      \ call fzf#vim#grep(
      \ 'ag --hidden -A 0 -B 0 --ignore .git --nogroup --color '.shellescape(<q-args>), 0,
      \   fzf#vim#with_preview('up:40%')
      \ )
" }}}
" Window managment {{{
set hidden " Allow unsaved buffers to be put in background
set winwidth=90 " Active window min width
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
" Mappings {{{
inoremap ii <Esc>
noremap h k
noremap j h
noremap k j
nnoremap <CR> :noh<CR><CR> " cancel search by pressing return
nnoremap <leader><tab> mtgg=G`t " indent file
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>$ " split line
nnoremap <s-tab> za " toggle fold
nnoremap <leader>t :tab new<CR>
nnoremap <leader><CR> gt
nnoremap <leader>m :edit db/migrate<CR>G

nnoremap <leader>ff :Find<space>
nnoremap <leader>fv :vs<CR>:Find<space>
nnoremap <leader>fa :vs<CR>:Find <C-R><C-W><CR>

nmap <leader>fm :silent execute "!tmux split-window ranger " . expand('%:p:h')<CR>

" zoom in on a split
nnoremap <leader>zz <C-w>z <C-w>_ <C-w>\|

" equalize splits
nnoremap <leader>zx <C-w>=

nnoremap <silent> <leader>n <C-]>

nnoremap <leader>l :split<CR>:Buffers<CR>
nnoremap <leader>u :vsplit<CR>:Buffers<CR>
" Resizing splits {{{
nnoremap <silent> <Up> :resize -2<CR>
nnoremap <silent> <Down> :resize +2<CR>
nnoremap <silent> <Left> :vertical resize +2<CR>
nnoremap <silent> <Right> :vertical resize -2<CR>
" }}}
" }}}
" Plugins {{{
call plug#begin('~/.config/nvim/plugged')
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'fishbullet/deoplete-ruby'

Plug 'jelera/vim-javascript-syntax'
Plug 'kchmck/vim-coffee-script'

Plug 'slim-template/vim-slim'

Plug 'rhysd/vim-crystal'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'chrisbra/Recover.vim'
Plug 'chriskempson/base16-vim'
Plug 'danro/rename.vim'
Plug 'FooSoft/vim-argwrap'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'kana/vim-textobj-user'
Plug 'Konfekt/FastFold'
Plug 'kshenoy/vim-signature'
Plug 'kthibodeaux/pull-review'
Plug 'kthibodeaux/tig.vim'
Plug 'mbbill/undotree'
Plug 'rhysd/vim-textobj-ruby'
Plug 'sgeb/vim-diff-fold'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'unblevable/quick-scope'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'
call plug#end()
" }}}
" Theme {{{
set background=dark
let base16colorspace=256
colorscheme base16-mocha
" }}}
" Statusline {{{
set statusline=
set statusline+=\ %t
set statusline+=\ %m
set statusline+=%r
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ %{&fileformat}
set statusline+=\ %p%%
set statusline+=\ %l:%c
" }}}
" Plugin config {{{
" RSpec {{{
let g:rspec_command = 'call VimuxRunCommand("bes {spec}\n")'
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
" Undotree {{{
nnoremap <F5> :UndotreeToggle<cr>
" }}}
" FZF {{{
set rtp+=~/.fzf
nnoremap <leader>e :Files<cr>

" :Files will preview the selected file
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
" }}}
" Argwrap {{{
let g:argwrap_padded_braces = '{'
nnoremap <silent> <leader>a :ArgWrap<CR>
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
" {{{ tig.vim
nmap <leader>c <Plug>TigFileHistory
nmap <leader>b <Plug>TigBlame
nmap <leader>y <Plug>TigLatestCommitForLine
" }}}
" }}}

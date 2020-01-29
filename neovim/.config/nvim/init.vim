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
set scrolloff=3 " Always show at least three lines above and below cursor
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
      \   fzf#vim#with_preview('up:70%')
      \ )
" }}}
" Window managment {{{
set hidden " Allow unsaved buffers to be put in background
set winwidth=90 " Active window min width
" }}}
" Vue `gf` for components {{{
set suffixesadd=.vue
set path=.,app/javascript/**
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
inoremap jj <Esc>
nnoremap <CR> :noh<CR><CR> " cancel search by pressing return
nnoremap <leader><tab> mtgg=G`t " indent file, ruby.vim overrides for *.rb
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

nnoremap <silent> <Up> :cprevious<CR>
nnoremap <silent> <Down> :cnext<CR>
nnoremap <silent> <Left> :vertical resize +2<CR>
nnoremap <silent> <Right> :vertical resize -2<CR>
" }}}
" Plugins {{{
call plug#begin('~/.config/nvim/plugged')
Plug 'lifepillar/vim-solarized8'

Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'fishbullet/deoplete-ruby'
Plug 'slim-template/vim-slim'

Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'digitaltoad/vim-pug'
Plug 'joaohkfaria/vim-jest-snippets'
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'

Plug 'rhysd/vim-crystal'

Plug 'AndrewRadev/splitjoin.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'chrisbra/Recover.vim'
Plug 'danro/rename.vim'
Plug 'FooSoft/vim-argwrap'
Plug 'ap/vim-css-color'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'kana/vim-textobj-user'
Plug 'Konfekt/FastFold'
Plug 'kthibodeaux/pull-review'
Plug 'kthibodeaux/tig.vim'
Plug 'mbbill/undotree'
Plug 'rhysd/vim-textobj-ruby'
Plug 'sgeb/vim-diff-fold'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'unblevable/quick-scope'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'wincent/vcs-jump'
Plug 'w0rp/ale'
call plug#end()
" }}}
" Theme {{{
let g:solarized_use16=1
set background=dark
colorscheme solarized8
hi clear SignColumn " fix grey gutter
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
" Tabline {{{
function! MyTabLine()
    let s = ''
    let t = tabpagenr()
    let i = 1
    while i <= tabpagenr('$')
        let buflist = tabpagebuflist(i)
        let winnr = tabpagewinnr(i)
        let s .= '%' . i . 'T'
        let s .= (i == t ? '%1*' : '%2*')

        " let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
        " let s .= ' '
        let s .= (i == t ? '%#TabNumSel#' : '%#TabNum#')
        let s .= ' ' . i . ' '
        let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')

        let bufnr = buflist[winnr - 1]
        let file = bufname(bufnr)
        let buftype = getbufvar(bufnr, '&buftype')

        if buftype == 'help'
            let file = 'help:' . fnamemodify(file, ':t:r')

        elseif buftype == 'quickfix'
            let file = 'quickfix'

        elseif buftype == 'nofile'
            if file =~ '\/.'
                let file = substitute(file, '.*\/\ze.', '', '')
            endif

        else
            let file = pathshorten(fnamemodify(file, ':p:~:.'))
            if getbufvar(bufnr, '&modified')
                let file = '+' . file
            endif

        endif

        if file == ''
            let file = '[No Name]'
        endif

        let s .= ' ' . file

        let nwins = tabpagewinnr(i, '$')
        if nwins > 1
            let modified = ''
            for b in buflist
                if getbufvar(b, '&modified') && b != bufnr
                    let modified = '*'
                    break
                endif
            endfor
            let hl = (i == t ? '%#WinNumSel#' : '%#WinNum#')
            let nohl = (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let s .= ' ' . modified . '(' . hl . winnr . nohl . '/' . nwins . ')'
        endif

        if i < tabpagenr('$')
            let s .= ' %#TabLine#|'
        else
            let s .= ' '
        endif

        let i = i + 1

    endwhile

    let s .= '%T%#TabLineFill#%='
    return s

endfunction

set tabline=%!MyTabLine()
" }}}
" Plugin config {{{
" RSpec {{{
let g:rspec_command = 'call VimuxRunCommand("bes {spec}\n")'
" }}}
" Tmux navigator {{{
let g:tmux_navigator_no_mappings = 1
" }}}
" Quickscope {{{
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary ctermfg=117 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary ctermfg=219 cterm=underline
augroup END
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

function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }
" }}}
" Argwrap {{{
let g:argwrap_padded_braces = '{'
nnoremap <silent> <leader>a :ArgWrap<CR>
" }}}
" vim-ruby {{{
" https://github.com/vim-ruby/vim-ruby/blob/master/doc/vim-ruby.txt#L133
let g:ruby_indent_block_style = 'do'
let g:ruby_indent_assignment_style = 'hanging'
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
" ale {{{
highlight ALEWarning ctermbg=10 ctermfg=255
let g:ale_fixers = {
      \   '*': ['trim_whitespace', 'remove_trailing_lines'],
      \   'javascript': ['eslint']
      \}
" }}}
" auto-pairs {{{
let g:AutoPairsMultilineClose=0
" }}}
" firenvim {{{
if exists('g:started_by_firenvim')
  colorscheme slate
  set laststatus=0
  startinsert!
endif
" }}}
" }}}
" Keyboard Layouts {{{
nmap <leader>lq <Plug>UseQwertyNavigation
nmap <leader>lc <Plug>UseColemakNavigation
" }}}

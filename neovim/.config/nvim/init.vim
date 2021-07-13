" Config not set in lua:
" set nrformats-=octal
" set mouse-=a
" set guicursor=
" set shortmess+=c
" set signcolumn=yes
" hi clear SignColumn " fix grey gutter

iabbr pry ::Kernel.binding.pry
command! -bang -nargs=* Find
      \ call fzf#vim#grep(
      \ 'ag --hidden -A 0 -B 0 --ignore .git --nogroup --color '.shellescape(<q-args>), 0,
      \   fzf#vim#with_preview('up:70%')
      \ )
" Vue `gf` for components {{{
set suffixesadd=.vue
set path=.,app/javascript/**,frontend/src/**
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
" Statusline {{{
set statusline=
set statusline+=\ %t
set statusline+=\ %m
set statusline+=\ %{coc#status()}
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
" {{{ coc.vim
let g:coc_node_args = ['--max-old-space-size=8192']
" {{{ functions
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" }}}
" {{{ mappings
inoremap <silent><expr> <c-n> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" :coc#refresh()
inoremap <expr><S-c-n> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" Use <c-n> to trigger completion.
inoremap <silent><expr> <c-n> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <tab> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <tab> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
" }}}
" {{{ commands
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" }}}
" {{{ snippets
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_prev = '<c-p>'
let g:coc_snippet_next = '<c-n>'
" }}}
" {{{ extensions
let g:coc_global_extensions = [
      \'coc-css',
      \'coc-eslint',
      \'coc-html',
      \'coc-json',
      \'coc-snippets',
      \'coc-solargraph',
      \'coc-tsserver',
      \'coc-vetur',
      \'coc-yaml',
      \]
" }}}
" }}}
" Keyboard Layouts {{{
nmap <leader>lq <Plug>UseQwertyNavigation
nmap <leader>lc <Plug>UseColemakNavigation
" }}}

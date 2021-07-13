vim.api.nvim_exec([[
command! -bang -nargs=* Find call fzf#vim#grep('ag --hidden -A 0 -B 0 --ignore .git --nogroup --color '.shellescape(<q-args>), 0, fzf#vim#with_preview('up:70%'))

nnoremap <leader>e :Files<cr>

command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
]], false)

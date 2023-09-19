vim.api.nvim_exec([[
command! -nargs=0 FixRailsDBStructure :normal G?HEAD<CR>maG?><CR>V`a:s/;/,/g<CR>`ajGVG?>><CR>:g!/^[(]/d<CR>`addVG?,<CR>:sort u<CR>G?,<CR>r;:wq<CR>
]], false)

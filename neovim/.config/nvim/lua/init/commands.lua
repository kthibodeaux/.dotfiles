vim.api.nvim_exec([[
command! -nargs=0 FixRailsDBStructure :normal /HEAD<CR>dd/parent<CR>dd/===<CR>dd/>>><CR>ddV/INSERT INTO "sch<CR>j:sort! u<CR>:wq<CR>
]], false)

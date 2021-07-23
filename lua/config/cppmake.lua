 vim.api.nvim_command([[
let g:cmake_link_compile_commands = 1
let g:lsp_cxx_hl_use_text_props = 1

nmap <leader>cg :CMakeGenerate<cr>
autocmd VimEnter * nmap <leader>cb :CMakeBuild<cr>
autocmd VimEnter * nmap <leader>cq :CMakeClose<cr>
autocmd VimEnter * nmap <leader>cc :CMakeClean<cr>
]])

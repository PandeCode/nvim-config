let g:cmake_link_compile_commands = 1

nmap <leader>cg :CMakeGenerate<cr>
autocmd VimEnter * nmap <leader>cb :CMakeBuild<cr>

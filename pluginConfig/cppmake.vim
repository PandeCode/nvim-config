let g:cmake_link_compile_commands = 1

autocmd BufWritePre *c execute ':ClangFormat'
autocmd BufWritePre *cpp execute ':ClangFormat'
autocmd BufWritePre *h execute ':ClangFormat'
autocmd BufWritePre *hpp execute ':ClangFormat'

nmap <leader>cg :CMakeGenerate<cr>
autocmd VimEnter * nmap <leader>cb :CMakeBuild<cr>

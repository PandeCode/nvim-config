" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
                let l:file = expand('%')
                if l:file =~# '^\f\+_test\.go$'
                                call go#test#Test(0, 1)
                elseif l:file =~# '^\f\+\.go$'
                                call go#cmd#Build(0)
                endif
endfunction


" Map keys for most used commands.
" Ex: `\b` for building, `\r` for running and `\b` for running test.
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
au filetype go inoremap <buffer> . .<C-x><C-o>

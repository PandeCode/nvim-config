nmap <leader>nf :Neoformat<CR>
vmap <leader>nf :Neoformat<CR>


"autocmd FileType jsonc autocmd BufWritePre <buffer> echo "Hello"
"try | undojoin | Neoformat! json prettier | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat! json prettier | endtry

" augroup fmt
" 		autocmd!
" 		au BufWritePre * if index(blacklist, &ft) < 0 | try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
" augroup END

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

nmap <Space>nf :Neoformat<CR>
vmap <Space>nf :Neoformat<CR>

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

"augroup fmt
		"autocmd!
		"au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
"augroup END

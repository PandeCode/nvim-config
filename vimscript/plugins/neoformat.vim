nmap <leader>nf :Neoformat<CR>
vmap <leader>nf :Neoformat<CR>

augroup fmt
		autocmd!
		autocmd BufWritePre * undojoin | Neoformat
augroup END

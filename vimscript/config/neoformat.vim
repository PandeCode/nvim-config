nmap <Space>nf :Neoformat<CR>
vmap <Space>nf :Neoformat<CR>

augroup fmt
	autocmd!
	autocmd BufWritePre * undojoin | Neoformat
augroup END

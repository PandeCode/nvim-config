nmap <Space>nf :Neoformat<CR>
vmap <Space>nf :Neoformat<CR>

"augroup fmt
"autocmd!
"autocmd BufWritePre * undojoin | Neoformat
"augroup END

let blacklist = ['tmux', 'conf', 'jsonc', 'desktop']

augroup fmt
autocmd!
autocmd BufWritePre * if index(blacklist, &ft) < 0 | try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
		"au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
		augroup END

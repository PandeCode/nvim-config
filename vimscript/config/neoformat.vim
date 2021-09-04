nmap <Space>ff :Neoformat<CR>
vmap <Space>ff :Neoformat<CR>

let blacklist = ['tmux', 'conf', 'jsonc', 'desktop', 'make', 'vim']


"augroup fmt
"autocmd!
"autocmd BufWritePre * if index(blacklist, &ft) < 0 | try | undojoin | Neformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
		""au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
		"augroup END

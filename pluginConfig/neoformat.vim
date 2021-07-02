let g:neoformat_enabled_python = ['black']

augroup fmt
		autocmd!
		au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
augroup END


let g:neoformat_jsonc_prettier = {
						\ 'exe': 'prettier',
						\ }

let g:neoformat_enabled_json = ['prettier']

augroup fmt
		autocmd!
		au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
augroup END

let g:neoformat_enabled_json = ['prettier']
let g:neoformat_enabled_python = ['black']

let g:neoformat_cmake_cmakeformat = {'args': [], 'stdin': 1, 'exe': 'cmake-format'}

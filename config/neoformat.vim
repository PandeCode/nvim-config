nmap <leader>nf :Neoformat<CR>
vmap <leader>nf :Neoformat<CR>

let blacklist = ['jsonc', 'vim']

autocmd FileType jsonc autocmd BufWritePre <buffer> echo "Hello"
"try | undojoin | Neoformat! json prettier | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat! json prettier | endtry

augroup fmt
		autocmd!
		au BufWritePre * if index(blacklist, &ft) < 0 | try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
augroup END


let g:neoformat_enabled_json = ['prettier']
let g:neoformat_enabled_python = ['black']

let g:neoformat_cmake_cmakeformat = {'args': [], 'stdin': 1, 'exe': 'cmake-format'}

let g:neoformat_only_msg_on_error = 1

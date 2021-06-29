let g:neoformat_enabled_python = ['black']

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END


let g:neoformat_jsonc_prettier = {
            \ 'exe': 'prettier',
            \ }

let g:neoformat_enabled_json = ['prettier']

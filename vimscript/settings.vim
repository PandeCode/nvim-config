set t_Co=256
set t_ut=

set shortmess+="c"

syntax sync minlines=256
filetype indent off

autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.json set filetype=jsonc


set noexpandtab!
set softtabstop=4
set tabstop=4

autocmd FileType * setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType * set noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufRead,BufAdd,BufCreate,BufFilePre,BufReadPre,BufWrite,BufWritePre * setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufRead,BufAdd,BufCreate,BufFilePre,BufReadPre,BufWrite,BufWritePre * set noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

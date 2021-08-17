set t_Co=256
set t_ut=

set shortmess+="c"

syntax sync minlines=256
filetype indent off

autocmd BufNewFile,BufRead *.* set noexpandtab
autocmd BufNewFile,BufRead python set noexpandtab
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.json set filetype=jsonc

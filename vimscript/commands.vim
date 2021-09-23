" Clear Registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

" Scratch Buffer
command! Scratch new | setlocal bt=nofile bh=wipe nobl noswapfile nu

command -bang W w<bang>
command -bang WQ noautocmd wq<bang>
command -bang Wq noautocmd wq<bang>
command -bang QW noautocmd wq<bang>
command -bang Qw noautocmd wq<bang>
command -bang Q noautocmd q<bang>
command -bar -complete=file -nargs=1 E :e <args>

" Auto make dir for new files without parent dirs
augroup Mkdir
autocmd!
autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
augroup END

au TextYankPost * lua vim.highlight.on_yank {on_visual = false}

autocmd Filetype cpp,c vnoremap <buffer> <SPACE>cf <esc>`>a// clang-format on<esc>`<i// clang-format off<esc>
autocmd Filetype lua   vnoremap <buffer> <SPACE>cf <esc>`>a-- stylua: ignore end<esc>`<i-- stylua: ignore start<esc>
autocmd Filetype py    vnoremap <buffer> <SPACE>cf <esc>`>a# fmt: on<esc>`<i# fmt: off<esc>




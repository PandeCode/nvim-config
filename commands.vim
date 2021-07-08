" Clear Registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

" Scratch Buffer
command! Scratch new | setlocal bt=nofile bh=wipe nobl noswapfile nu

" Auto make dir for new files without parent dirs
augroup Mkdir
		autocmd!
		autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
augroup END


" Clear Registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

" Scratch Buffer
command! Scratch new | setlocal bt=nofile bh=wipe nobl noswapfile nu

" Auto make dir for new files without parent dirs
augroup Mkdir
		autocmd!
		autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
augroup END

" Makes whick key load idk y it doesn't automatically
autocmd VimEnter * WhichKey<ESC>


command -bang W w<bang>
command -bang WQ wq<bang>
command -bang Wq wq<bang>
command -bang QW wq<bang>
command -bang Qw wq<bang>
command -bang Q q<bang>
command -bar -complete=file -nargs=1 E :e <args>

function! Update(...) 
		PackerUpdate
		CocUpdate
		TSUpdate
endfunction

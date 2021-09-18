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

function! ExpandCMacro()
  "get current info
  let l:macro_file_name = "__macroexpand__" . tabpagenr()
  let l:file_row = line(".")
  let l:file_name = expand("%")
  let l:file_window = winnr()
  "create mark
  execute "normal! Oint " . l:macro_file_name . ";"
  execute "w"
  "open tiny window ... check if we have already an open buffer for macro
  if bufwinnr( l:macro_file_name ) != -1
    execute bufwinnr( l:macro_file_name) . "wincmd w"
    setlocal modifiable
    execute "normal! ggdG"
  else
    execute "bot 10split " . l:macro_file_name
    execute "setlocal filetype=cpp"
    execute "setlocal buftype=nofile"
    nnoremap <buffer> q :q!<CR>
  endif
  "read file with gcc
  silent! execute "r!gcc -E " . l:file_name
  "keep specific macro line
  execute "normal! ggV/int " . l:macro_file_name . ";$\<CR>d"
  execute "normal! jdG"
  "indent
  execute "%!indent -st -kr"
  execute "normal! gg=G"
  "resize window
  execute "normal! G"
  let l:macro_end_row = line(".")
  execute "resize " . l:macro_end_row
  execute "normal! gg"
  "no modifiable
  setlocal nomodifiable
  "return to origin place
  execute l:file_window . "wincmd w"
  execute l:file_row
  execute "normal!u"
  execute "w"
  "highlight origin line
  let @/ = getline('.')
endfunction

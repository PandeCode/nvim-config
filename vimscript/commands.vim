" Clear Registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

" Scratch Buffer
command! Scratch new | setlocal bt=nofile bh=wipe nobl noswapfile nu

"command -bang W w<bang>
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

autocmd Filetype cpp,c nnoremap <buffer> <SPACE>fo <esc>{o// clang-format off<esc>}O// clang-format on<esc>
autocmd Filetype cpp,c vnoremap <buffer> <SPACE>fo <esc>`>a// clang-format on<esc>`<i// clang-format off<esc>

autocmd Filetype haskell,lhaskell nnoremap <buffer> <SPACE>fo <esc>{o{- ORMOLU_DISABLE -}<esc>}O{- ORMOLU_ENABLE -}<esc>
autocmd Filetype haskell,lhaskell vnoremap <buffer> <SPACE>fo <esc>`>a{- ORMOLU_ENABLE -}<esc>`<i{- ORMOLU_DISABLE -}<esc>

autocmd Filetype js,ts,tsx,jsx,vue,json,svelte,javascriptreact,typescriptreact  nnoremap <buffer> <SPACE>fo <esc>{o// prettier-ignore<esc>
autocmd Filetype js,ts,tsx,jsx,vue,json,svelte,javascriptreact,typescriptreact  vnoremap <buffer> <SPACE>fo <esc>`<i// prettier-ignore<esc>

autocmd Filetype lua   nnoremap <buffer> <SPACE>fo <esc>{o-- stylua: ignore start<esc>}O-- stylua: ignore end<esc>
autocmd Filetype lua   vnoremap <buffer> <SPACE>fo <esc>`>a-- stylua: ignore end<esc>`<i-- stylua: ignore start<esc>

autocmd Filetype python nnoremap <buffer> <SPACE>fo <esc>{o# fmt: off<esc>}O# fmt: on<esc>
autocmd Filetype python vnoremap <buffer> <SPACE>fo <esc>`>a# fmt: on<esc>`<i# fmt: off<esc>

autocmd Filetype rust  nnoremap <buffer> <SPACE>fo <esc>{o#[rustfmt::skip]<esc>
autocmd Filetype rust  vnoremap <buffer> <SPACE>fo <esc>`<i#[rustfmt::skip]<esc>

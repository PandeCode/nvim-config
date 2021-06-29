let mapleader = " "
map <leader>w :w<CR>

imap <F4> <ESC>

imap <c-_> <ESC>:call NERDComment('n', 'toggle')<CR>i
nmap <c-_> :call NERDComment('n', 'toggle')<CR>
vmap <c-_> :call NERDComment('x', 'toggle')<CR>v

nmap <c-f> :Rg<CR>
nmap <F2> :CocCommand document.renameCurrentWord<CR>i
nmap <c-t> :FloatermNew<CR>
nmap <F5> :GundoToggle<CR>

imap <c-f> <ESC>:Rg<CR>
imap <F2> <ESC>:CocCommand document.renameCurrentWord<CR>i
imap <c-t> <ESC>:FloatermNew<CR>
imap <F5> <ESC>:GundoToggle<CR>


nmap <LEADER>wj <c-w>j
nmap <LEADER>wh <c-w>h
nmap <LEADER>wl <c-w>l
nmap <LEADER>wk <c-w>k
imap <LEADER>wj <ESC><c-w>j
imap <LEADER>wh <ESC><c-w>h
imap <LEADER>wk <ESC><c-w>k
imap <LEADER>wl <ESC><c-w>l


nmap <LEADER>wJ <c-w>J
nmap <LEADER>wH <c-w>H
nmap <LEADER>wL <c-w>L
nmap <LEADER>wK <c-w>K
imap <LEADER>wJ <ESC><c-w>J
imap <LEADER>wH <ESC><c-w>H
imap <LEADER>wK <ESC><c-w>K
imap <LEADER>wL <ESC><c-w>L

nmap <c-d> :bd!<CR>
imap <c-d> <Esc>:bd!<CR>a

" Save on Ctrl-S
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a
" system clipboard
nmap <c-c> "+y
vmap <c-c> "+y
nmap <c-v> "+p
inoremap <c-v> <c-r>+
cnoremap <c-v> <c-r>+
" use <c-r> to insert original character without triggering things like auto-pairs
inoremap <c-r> <c-v>

nmap <A-down> ddp <CR> " Move down
nmap <A-up> ddkkpk <CR> " Move up
imap <A-down> <ESC>ddp <CR>a " Move down
imap <A-up> <ESC>ddkkpk <CR>a " Move up

command W execute ":w"

command WQ execute ":wq"
command Wq execute ":wq"
command QW execute ":wq"
command Qw execute ":wq"

command Q execute ":q"

noremap <C-w><Right> :vertical res -3  <CR>
noremap <C-w><Left> :vertical res +3 <CR>
noremap <C-w><Down> :res +3 <CR>
noremap <C-w><Up> :res -3 <CR>

nnoremap <LEADER>fs :w<CR>

autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.json set filetype=jsonc
autocmd BufNewFile,BufRead *.txt RainbowToggleOff

nmap <F1> <esc>
imap <F1> <esc>

nmap <leader>b :Buffers<CR>

command! Scratch new | setlocal bt=nofile bh=wipe nobl noswapfile nu

nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

noremap <expr> <Home> (col('.') == matchend(getline('.'), '^\s*')+1 ? '0' : '^')
noremap <expr> <End> (col('.') == match(getline('.'), '\s*$') ? '$' : 'g_')
vnoremap <expr> <End> (col('.') == match(getline('.'), '\s*$') ? '$h' : 'g_')
imap <Home> <C-o><Home>
imap <End> <C-o><End>

noremap <silent> <leader>ff :setlocal foldmethod=syntax<CR>

autocmd VimEnter * nmap <leader>ca :CocAction<CR>
autocmd VimEnter * vmap <leader>ca :CocAction<CR>

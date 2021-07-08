let mapleader = " "
imap <F4> <ESC>

map <C-i> <C-a>

imap <c-_> <ESC>:call NERDComment('n', 'toggle')<CR>i
nmap <c-_> :call NERDComment('n', 'toggle')<CR>
vmap <c-_> :call NERDComment('x', 'toggle')<CR>v

nmap <F2> :CocCommand document.renameCurrentWord<CR>i
nmap <c-t> :FloatermNew<CR>
nmap <F5> :GundoToggle<CR>

imap <F2> <ESC>:CocCommand document.renameCurrentWord<CR>i
imap <c-t> <ESC>:FloatermNew<CR>
imap <F5> <ESC>:GundoToggle<CR>

nmap <LEADER>w <c-w>

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

nnoremap <LEADER>fs :w<CR>

nmap <F1> <esc>
imap <F1> <esc>

nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

noremap <expr> <Home> (col('.') == matchend(getline('.'), '^\s*')+1 ? '0' : '^')
noremap <expr> <End> (col('.') == match(getline('.'), '\s*$') ? '$' : 'g_')
vnoremap <expr> <End> (col('.') == match(getline('.'), '\s*$') ? '$h' : 'g_')
imap <Home> <C-o><Home>
imap <End> <C-o><End>

noremap <silent> <leader>fm :setlocal foldmethod=syntax<CR>

" Let <C-w> use vim word motion
imap <c-w> <esc>bce
map Q :echo<CR>

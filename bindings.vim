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

nmap <c-j> <c-w>j
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l
nmap <c-k> <c-w>k

imap <c-j> <ESC><c-w>j
imap <c-h> <ESC><c-w>h
imap <c-k> <ESC><c-w>k
imap <c-l> <ESC><c-w>l

nmap <c-d> :bd<CR>
imap <c-d> <Esc>:bd<CR>a

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

map <leader>[ :bp <CR>
map <leader>] :bn <CR>

nmap <C-[> :bp <CR>
nmap <C-]> :bn <CR>
imap <C-[> <ESC>:bp <CR>
imap <C-]> <ESC>:bn <CR>

noremap <C-w><Right> :vertical res -3  <CR>
noremap <C-w><Left> :vertical res +3 <CR>
noremap <C-w><Down> :res +3 <CR>
noremap <C-w><Up> :res -3 <CR>

nnoremap <LEADER>fs :w<CR>

autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.json set filetype=jsonc
autocmd BufNewFile,BufRead *.txt RainbowToggleOff

nunmap <esc>
iunmap <esc>

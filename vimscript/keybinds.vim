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

" Let <C-w> use vim word motion
imap <c-w> <esc>bce
map Q :echo<CR>

noremap Y y$

noremap n nzzzv
noremap N Nzzzv
noremap J mzJ`z

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap [ [<c-g>u
inoremap ] ]<c-g>u
inoremap ( (<c-g>u
inoremap ) )<c-g>u
inoremap { {<c-g>u
inoremap } }<c-g>u
inoremap " "<c-g>u
inoremap " "<c-g>u

nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv
nnoremap <c-j> :m .+1<CR>==
inoremap <c-k> <esc>:m .-2<CR>==i
nnoremap <c-k> :m .-2<CR>==
inoremap <c-j> <esc>:m .+1<CR>==i

" Stop annoying you have one more file to edit
if argc()
		au VimEnter * args %
endif

"-- Add space bellow or above without leaving normal mode
nnoremap <silent> [<space>  :<c-u>put!=repeat([''],v:count)<bar>']+1<cr>
nnoremap <silent> ]<space>  :<c-u>put =repeat([''],v:count)<bar>'[-1<cr>

" Use simple ; instead of shift + :
nnoremap ; :
vnoremap ; :

" Use this instead of touching Esc key
inoremap jk <Esc>
inoremap kj <Esc>

" Better tabbing
nnoremap < v<gv<esc>
nnoremap > v>gv<esc>
vnoremap < <gv
vnoremap > >gv

vnoremap " <esc>`>a"<esc>`<i"<esc>
vnoremap ' <esc>`>a'<esc>`<i'<esc>
vnoremap ` <esc>`>a`<esc>`<i`<esc>

vnoremap ( <esc>`>a)<esc>`<i(<esc>
vnoremap [ <esc>`>a]<esc>`<i[<esc>
vnoremap <c-[> <esc>`>a}<esc>`<i{<esc>

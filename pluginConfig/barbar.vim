nnoremap <leader>[ :BufferPrevious <CR>
nnoremap <leader>] :BufferNext <CR>

" Re-order to previous/next
nnoremap <silent>    <Space>b< :BufferMovePrevious<CR>
nnoremap <silent>    <Space>b> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <Space>1 :BufferGoto 1<CR>
nnoremap <silent>    <Space>2 :BufferGoto 2<CR>
nnoremap <silent>    <Space>3 :BufferGoto 3<CR>
nnoremap <silent>    <Space>4 :BufferGoto 4<CR>
nnoremap <silent>    <Space>5 :BufferGoto 5<CR>
nnoremap <silent>    <Space>6 :BufferGoto 6<CR>
nnoremap <silent>    <Space>7 :BufferGoto 7<CR>
nnoremap <silent>    <Space>8 :BufferGoto 8<CR>
nnoremap <silent>    <Space>9 :BufferLast<CR>
" Close buffer
nnoremap <silent>    <Space>bc :BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout<CR>
" Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseBuffersLeft<CR>
"                          :BufferCloseBuffersRight<CR>
" Magic buffer-picking mode
nnoremap <silent> <C-s>    :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>

" Other:
" :BarbarEnable - enables barbar (enabled by default)
" :BarbarDisable - very bad command, should never be used

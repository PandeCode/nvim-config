nnoremap <M-d> :bd<CR>

" These commands will navigate through buffers in order regardless of which mode you are using
" e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
nnoremap <silent><space>] :BufferLineCycleNext<CR>
nnoremap <silent><space>[ :BufferLineCyclePrev<CR>

" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <silent><space>b] :BufferLineMoveNext<CR>
nnoremap <silent><space>b[ :BufferLineMovePrev<CR>

" These commands will sort buffers by directory, language, or a custom criteria
nnoremap <silent><space>be :BufferLineSortByExtension<CR>
nnoremap <silent><space>bd :BufferLineSortByDirectory<CR>
nnoremap <silent><space>bs :BufferLineSortByTabs<CR>
"nnoremap <silent>bs :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>

" Goto buffer in position...
nnoremap <silent><space>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><space>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><space>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><space>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><space>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><space>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><space>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><space>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><space>9 <Cmd>BufferLineGoToBuffer 9<CR>

nnoremap <silent>    <Space>` :edit #<CR>

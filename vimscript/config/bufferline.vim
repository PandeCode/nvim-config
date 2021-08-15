nnoremap <M-d> :bd<CR>

" These commands will navigate through buffers in order regardless of which mode you are using
" e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
nnoremap <silent><space>] :BufferLineCycleNext<CR>
nnoremap <silent><space>[ :BufferLineCyclePrev<CR>

" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <silent><space>b] :BufferLineMoveNext<CR>
nnoremap <silent><space>b[ :BufferLineMovePrev<CR>

" These commands will sort buffers by directory, language, or a custom criteria
nnoremap <silent>be :BufferLineSortByExtension<CR>
nnoremap <silent>bd :BufferLineSortByDirectory<CR>
nnoremap <silent>bs :BufferLineSortByTabs<CR>
"nnoremap <silent>bs :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>

" Goto buffer in position...
nnoremap <silent>    <Space>1 :bfirst<CR>
nnoremap <silent>    <Space>2 :b 2<CR>
nnoremap <silent>    <Space>3 :b 3<CR>
nnoremap <silent>    <Space>4 :b 4<CR>
nnoremap <silent>    <Space>5 :b 5<CR>
nnoremap <silent>    <Space>6 :b 6<CR>
nnoremap <silent>    <Space>7 :b 7<CR>
nnoremap <silent>    <Space>8 :b 8<CR>
nnoremap <silent>    <Space>9 :blast<CR>

nnoremap <silent>    <Space>` :edit #<CR>

noremap <leader>e :NvimTreeToggle<CR>
noremap <leader>r :NvimTreeRefresh<CR>
noremap <leader>n :NvimTreeFindFile<CR>
"
" NvimTreeOpen, NvimTreeClose and NvimTreeFocus are also available if you need them
" a list of groups can be found at `=help nvim_tree_highlight`

highlight NvimTreeFolderIcon guibg=blue

"You can edit the size of the tree during runtime with :lua require'nvim-tree.view'.View.width = 50

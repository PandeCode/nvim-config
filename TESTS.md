nvim --clean --headless --server "$sock" --remote-send "<Cmd>if &bg !=# '$1' | let g:script_set_bg=1 | set bg=$1 | unlet g:script_set_bg | endif<CR>" +'qa!' 2>/dev/null

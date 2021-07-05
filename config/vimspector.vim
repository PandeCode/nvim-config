let g:vimspector_base_dir=expand( '$HOME/.config/nvim/vimspector-config' )

let g:vimspector_install_gadgets = [ 'vscode-cpptools',
						\	"debugpy",
						\ "vscode-java-debug",
						\ "java-language-server",
						\ "netcoredbg",
						\ "vscode-bash-debug", 
						\ "vscode-go", 
						\ "vscode-node-debug2", 
						\ "debugger-for-chrome",
						\ "CodeLLDB", 
						\ "local-lua-debugger-vscode"]


" When debugging, continue. Otherwise start debugging.
nmap <leader>d<tab> <Plug>VimspectorContinue
xmap <leader>d<tab> <Plug>VimspectorContinue

nmap <leader><tab> <Plug>VimspectorContinue
xmap <leader><tab> <Plug>VimspectorContinue
" Stop debugging.
nmap <leader>ds <Plug>VimspectorStop | call vimspector#Reset()
xmap <leader>ds <Plug>VimspectorStop | call vimspector#Reset()
" Restart debugging with the same configuration.
nmap <leader>dr <Plug>VimspectorRestart
xmap <leader>dr <Plug>VimspectorRestart
" Pause debuggee.
nmap <leader>dp <Plug>VimspectorPause
xmap <leader>dp <Plug>VimspectorPause
" Toggle line breakpoint on the current line.
nmap <leader>db <Plug>VimspectorToggleBreakpoint
xmap <leader>db <Plug>VimspectorToggleBreakpoint
" Toggle conditional line breakpoint on the current line.
nmap <leader>dac <Plug>VimspectorToggleConditionalBreakpoint
xmap <leader>dac <Plug>VimspectorToggleConditionalBreakpoint
" Add a function breakpoint for the expression under cursor
nmap <leader>daf <Plug>VimspectorAddFunctionBreakpoint
xmap <leader>daf <Plug>VimspectorAddFunctionBreakpoint
" Run to Cursor
nmap <leader>drc <Plug>VimspectorRunToCursor
xmap <leader>drc <Plug>VimspectorRunToCursor
" Step Over
nmap <leader>dsov <Plug>VimspectorStepOver
xmap <leader>dsov <Plug>VimspectorStepOver
" Step Into
nmap <leader>dsi <Plug>VimspectorStepInto
xmap <leader>dsi <Plug>VimspectorStepInto
" Step out of current function scope
nmap <leader>dsou <Plug>VimspectorStepOut
xmap <leader>dsou <Plug>VimspectorStepOut


" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)
" for normal mode - the word under the cursor
" for visual mode, the visually selected text
nmap <Leader>di <Plug>VimspectorBalloonEval
xmap <Leader>di <Plug>VimspectorBalloonEval

nmap <Leader>dfu <Plug>VimspectorUpFrame
nmap <Leader>dfd <Plug>VimspectorDownFrame


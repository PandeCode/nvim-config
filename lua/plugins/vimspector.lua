vim.cmd(
    [[
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

nnoremap <space>dd :call vimspector#Launch()<CR>
nnoremap <space>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <space>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <space>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <space>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <space>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <space>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <space>de :call vimspector#Reset()<CR>
nnoremap <space>dq :VimspectorReset<CR>

nmap <space>dp <Plug>VimspectorPause

nnoremap <space>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <space>dl <Plug>VimspectorStepInto
nmap <space>dj <Plug>VimspectorStepOver
nmap <space>dk <Plug>VimspectorStepOut
nmap <space>dr <Plug>VimspectorRestart
nnoremap <space>d<space> :call vimspector#Continue()<CR>

nmap <space>drc <Plug>VimspectorRunToCursor
nmap <space>db <Plug>VimspectorToggleBreakpoint
nmap <space>daf <Plug>VimspectorAddFunctionBreakpoint
nmap <space>dcbp <Plug>VimspectorToggleConditionalBreakpoint

nmap <space>d<tab> <Plug>VimspectorContinue
nmap <space><tab> <Plug>VimspectorContinue

nmap <space>di <Plug>VimspectorBalloonEval

nmap <space>dfu <Plug>VimspectorUpFrame
nmap <space>dfd <Plug>VimspectorDownFrame


]]
)

local noremap = {noremap=true}
vim.g.vimspector_base_dir = vim.fn.expand("$HOME/.config/nvim/spector")

vim.g.vimspector_install_gadgets = {
    "vscode-cpptools",
    "debugpy",
    "vscode-java-debug",
    "java-language-server",
    "netcoredbg",
    "vscode-bash-debug",
    "vscode-go",
    "vscode-node-debug2",
    "debugger-for-chrome",
    "CodeLLDB",
    "local-lua-debugger-vscode"
}

vim.api.nvim_set_keymap("n", "<space>dd",       ":call vimspector#Launch()<CR>",                                  noremap)
vim.api.nvim_set_keymap("n", "<space>dc",       ":call GotoWindow(g:vimspector_session_windows.code)<CR>",        noremap)
vim.api.nvim_set_keymap("n", "<space>dt",       ":call GotoWindow(g:vimspector_session_windows.tagpage)<CR>",     noremap)
vim.api.nvim_set_keymap("n", "<space>dv",       ":call GotoWindow(g:vimspector_session_windows.variables)<CR>",   noremap)
vim.api.nvim_set_keymap("n", "<space>dw",       ":call GotoWindow(g:vimspector_session_windows.watches)<CR>",     noremap)
vim.api.nvim_set_keymap("n", "<space>ds",       ":call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>", noremap)
vim.api.nvim_set_keymap("n", "<space>do",       ":call GotoWindow(g:vimspector_session_windows.output)<CR>",      noremap)
vim.api.nvim_set_keymap("n", "<space>de",       ":call vimspector#Reset()<CR>",                                   noremap)
vim.api.nvim_set_keymap("n", "<space>dq",       ":VimspectorReset<CR>",                                           noremap)

vim.api.nvim_set_keymap("n", "<space>dp",       "<Plug>VimspectorPause",                                          noremap)

vim.api.nvim_set_keymap("n", "<space>dtcb",     ":call vimspector#CleanLineBreakpoint()<CR>",                     noremap)

vim.api.nvim_set_keymap("n", "<space>dl",       "<Plug>VimspectorStepInto",                                       noremap)
vim.api.nvim_set_keymap("n", "<space>dj",       "<Plug>VimspectorStepOver",                                       noremap)
vim.api.nvim_set_keymap("n", "<space>dk",       "<Plug>VimspectorStepOut",                                        noremap)
vim.api.nvim_set_keymap("n", "<space>dr",       "<Plug>VimspectorRestart",                                        noremap)
vim.api.nvim_set_keymap("n", "<space>d<space>", ":call vimspector#Continue()<CR>",                                noremap)

vim.api.nvim_set_keymap("n", "<space>drc",      "<Plug>VimspectorRunToCursor",                                    noremap)
vim.api.nvim_set_keymap("n", "<space>db",       "<Plug>VimspectorToggleBreakpoint",                               noremap)
vim.api.nvim_set_keymap("n", "<space>daf",      "<Plug>VimspectorAddFunctionBreakpoint",                          noremap)
vim.api.nvim_set_keymap("n", "<space>dcbp",     "<Plug>VimspectorToggleConditionalBreakpoint",                    noremap)

vim.api.nvim_set_keymap("n", "<space>d<tab>",   "<Plug>VimspectorContinue",                                       noremap)
vim.api.nvim_set_keymap("n", "<space><tab>",    "<Plug>VimspectorContinue",                                       noremap)

vim.api.nvim_set_keymap("n", "<space>di",       "<Plug>VimspectorBalloonEval",                                    noremap)

vim.api.nvim_set_keymap("n", "<space>dfu",      "<Plug>VimspectorUpFrame",                                        noremap)
vim.api.nvim_set_keymap("n", "<space>dfd",      "<Plug>VimspectorDownFrame",                                      noremap)


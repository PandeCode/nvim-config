local dap, dapui = require("dap"), require("dapui")
local widgets = require("dap.ui.widgets")

dap.listeners.before.attach.dapui_config = dapui.open
dap.listeners.before.launch.dapui_config = dapui.open
dap.listeners.before.event_terminated.dapui_config = dapui.close
dap.listeners.before.event_exited.dapui_config = dapui.close

vim.keymap.set(Keys.N, "<LEADER>db", dap.toggle_breakpoint, Keys.Noremap)
vim.keymap.set(Keys.N, "<LEADER>d<SPACE>", dap.continue, Keys.Noremap)
vim.keymap.set(Keys.N, "<LEADER>di", dap.step_into, Keys.Noremap)
vim.keymap.set(Keys.N, "<LEADER>ds", dap.step_over, Keys.Noremap)
vim.keymap.set(Keys.N, "<LEADER>du", dap.step_out, Keys.Noremap)
vim.keymap.set(Keys.N, "<Leader>dr", dap.repl.open, Keys.Noremap)
vim.keymap.set(Keys.N, "<Leader>dl", dap.run_last, Keys.Noremap)
-- vim.keymap.set(Keys.NV, "<Leader>dh", widgets.hover, Keys.Noremap)
-- vim.keymap.set(Keys.NV, "<Leader>dp", widgets.preview, Keys.Noremap)

vim.keymap.set("n", "<Leader>lp", function()
	dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
vim.keymap.set("n", "<Leader>df", function()
	widgets.centered_float(widgets.frames)
end)
vim.keymap.set("n", "<Leader>ds", function()
	widgets.centered_float(widgets.scopes)
end)

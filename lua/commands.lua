-- Clear Registers
vim.cmd.command(
	{
		args = {
			"WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor"
		},
		bang = true
	}
)

-- Scratch Buffer
vim.cmd.command(
	{
		args = {"Scratch new | setlocal bt=nofile bh=wipe nobl noswapfile nu"},
		bang = true
	}
)

vim.cmd.command({args = {"-bang W  noautocmd w"}, bang = true})
vim.cmd.command({args = {"-bang WQ noautocmd wq"}, bang = true})
vim.cmd.command({args = {"-bang Wq noautocmd wq"}, bang = true})
vim.cmd.command({args = {"-bang QW noautocmd wq"}, bang = true})
vim.cmd.command({args = {"-bang Qw noautocmd wq"}, bang = true})
vim.cmd.command({args = {"-bang Q  noautocmd  q"}, bang = true})

vim.cmd.command({args = {"-bar -complete=file", "-nargs=1 E :e <args>"}})

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

vim.cmd.command({args = {"-bang W  w"}, bang = true})
vim.cmd.command({args = {"-bang WQ wq"}, bang = true})
vim.cmd.command({args = {"-bang Wq wq"}, bang = true})
vim.cmd.command({args = {"-bang QW wq"}, bang = true})
vim.cmd.command({args = {"-bang Qw wq"}, bang = true})
vim.cmd.command({args = {"-bang Q   q"}, bang = true})

vim.cmd.command({args = {"-bar -complete=file", "-nargs=1 E :e <args>"}})

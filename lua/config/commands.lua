local bang_true = { bang = true }

local function gen_new_cmd(name)
	return function(tbl)
		if tbl.bang then
			vim.cmd(name .. "!")
		else
			vim.cmd(name)
		end
	end
end

vim.api.nvim_create_user_command("W", gen_new_cmd("w"), bang_true)

local wq = gen_new_cmd("wq")
vim.api.nvim_create_user_command("WQ", wq, bang_true)
vim.api.nvim_create_user_command("Wq", wq, bang_true)
vim.api.nvim_create_user_command("Qw", wq, bang_true)
vim.api.nvim_create_user_command("QW", wq, bang_true)
vim.api.nvim_create_user_command("Q", gen_new_cmd("q"), bang_true)

vim.api.nvim_create_user_command(
	"WipeReg",
	"for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor",
	{ bang = true }
)

vim.api.nvim_create_user_command("Scratch", "new | setlocal bt=nofile bh=wipe nobl noswapfile nu", bang_true)
function Scratch()
	vim.opt_local.bt = "nofile"
end

vim.cmd.command({ args = { "-bar -complete=file", "-nargs=1 E :e <args>" } })

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>wj", "<C-W>j", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>wh", "<C-W>h", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>wk", "<C-W>k", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>wl", "<C-W>l", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>bn", ":bn<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bp", ":bp<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "gg", "gg0", { noremap = true, silent = true })
vim.keymap.set("n", "G", "G$", { noremap = true, silent = true })

local n = Keys.N

local keymaps = {
	{ n, "<LEADER>me", vim.cmd.messages },
	-- Buffer
	{ n, "<LEADER>bp", vim.cmd.bp, Keys.NOremapSilent },
	{ n, "<LEADER>bn", vim.cmd.bn, Keys.NOremapSilent },
	{ n, "<LEADER>bd", vim.cmd.bd, Keys.NOremapSilent },
	{ n, "<A-d>", vim.cmd.bd, Keys.NoremapSilent },

	{
		n,
		"<LEADER>x+",
		function()
			local filename = vim.fn.expand "%"
			vim.fn.jobstart { "chmod", "+x", filename }
			vim.notify("Given execution rights to '" .. filename .. "'", "info", { title = IDE.name })
		end,
	},

	{
		n,
		"<LEADER>x-",
		function()
			local filename = vim.fn.expand "%"
			vim.fn.jobstart { "chmod", "-x", filename }
			vim.notify("Taken away execution rights from '" .. filename .. "'", "info", { title = IDE.name })
		end,
	},
}

for _, value in pairs(keymaps) do
	vim.keymap.set(value[1], value[2], value[3], value[4] or Keys.None)
end
